

# Databases

<a href="/days4/projects/">Other SAGE Days 4 Projects</a> 

SAGE <a class="http" href="http://www.initd.org/pub/software/pysqlite/doc/usage-guide.html">interface</a> to sqlite: <a href="/sqlite-tutorial">creating your own database using sqlite in sage</a> 

Robert Miller, Emily Kirkman, Tom Boothby, David Joyner, Yi Qiang 


## SAGE Enhancement Proposal

1. Create two classes for interacting with sql databases: the base class will be an immutable database object, and a mutable database object will extend that one with modification functions. Create a separate Query class that points to a specific database, keeping track of a query string and a set of join instructions, with logico-arithmetic operations like and, or, etc. 
   1. class SQLDatabase(SageObject) is the base. 
      * idea - a different class for databases that are included with sage 
      * instance field 
         * filename -- the database itself 
         * connection -- a pysqlite connection to 'filename' 
         * dict of tables -- keyed by table name, entries are 
            * dict of columns -- keyed by column name, keeps track of indices, primary key state, data type 
      * functions 
         * init 
            * `D = SQLDatabase('graphs.db')` returns a database on graphs up to 1,000,000 vertices, which is queryable, but cannot be modified. 
         * copy 
            * creates new db, mutable by default 
            * skeleton option will create a new mutable database with empty tables but the same column/index/primary key structure 
         * save 
            * ` D.save('my.db') ` should copy the class's database file to my.db. 
            * option to close connection with old file and connect to new file, but default behavior shouldn't do this. motivation: 
               * ```txt
D = Database()
D.add( something great! ) # If save automatically connects
D.save('im_rich.db')      # to saved file, results could
D.remove( the great )     # easily be lost.
D.add( useless )
D.save('crap.db')         # Oh crap!
```
         * print 
            * should print a string describing the skeleton of the database 
         * vacuum 
   1. class MutableSQLDatabase(SQLDatabase) -- seems counterintuitive, to avoid issues relating to stupid people accidentally messing up an important database in a public setting (if possible) -- best way to avoid this is to not have mutation functions at all 
      * functions 
         * init 
            * `D = MutableSQLDatabase()` creates a new temp db, ready to go 
            * `D = MutableSQLDatabase('mydb.db')` opens a connection to mydb.db, ready to go 
            * `D = MutableSQLDatabase('yourdb.db')` if called on a protected database, just make a temp copy and connect to that 
         * create/drop table 
         * create/drop column( column name, col type, table, bool index=False, bool primary key=False ) 
            * if no table specified, raise an error and educate user about sql 
         * create/drop index( column, table(s) ) 
         * create/drop primary key( column, table ) 
            * QUESTION: should we allow multiple tables? bounce this off someone who knows (i.e. is it possible to do this with sqlite?) 
         * create/drop row( table, dict ) 
            * create accepts a dictionary keyed by column name 
                  * ```txt
def foo(table=None, **kwds):
    if table is None:
        raise KeyError('Table must be specified')
    print kwds

sage: foo(table='table_name', stuff='poo', dog='cat')
{'stuff':'poo', 'dog':'cat'}
sage: foo(stuff='poo', dog='cat')
Exception (click to the left for traceback):
...
KeyError: 'Table must be specified'
```
         * for later? add data from whatever (e.g. quickly via sql file): magic function to deal with other ways to add data? think about this more later. 
   1. class AdvancedQuery(SageObject) -- simply a pointer to an SQLDatabase object (recall, this could be mutable), and a string. When run_query is called, query the database and return results. 
   1. class Query(AdvancedQuery) -- a naive query class for the n00b in us all... 
         * comes with operations intersect, union and complement 
         * creating a new query: specify one table, columns, and simple search string (i.e. the "WHERE" clause) 
         * A dict with entries for the "SELECT" clause, the "FROM" clause, and the "WHERE" clause 
         * allows for recursive searching quickly, since we can simply modify the string, and wait until we have to execute the query 
         * deals with crazy stuff like joins automatically, informing user of what is required of him/her 
1. Persistent objects via ZODB. Only stores data for objects that have been declared to the db to be immutable, and only for classes that instantiate the proper functionality. Do this with at least one class to provide an example. 
   * perhaps a global option of whether to cache anything available or not, as well as class-level option for same thing 
   * different classes of objects would have different tables, defined by their classes. 
   * any object would be required to be set immutable. when it is set to mutable again, the entry in the database corresponding to the object would be dropped. 
   * export these tables to files, along with a pickle of each object, if desired. 
         * note- this should not necessarily be depended on! pickling isn't quite stable yet. As William says, the safest is to store things in a text file, together with a function that can recreate the pickles (with a current version so pickles are up to date). 
1. Create a web server modeled on the new notebook that uses Zope to serve either sql databases (for query type webpages like Grout's) or ZODB databases (<a class="http" href="http://modular.fas.harvard.edu:8080/mfd/index.html">e.g.</a> for webpages such as WS's Modular Forms Database). 
1. Automated Caching 
   * idea - when you do an expensive calculation on an object, the result is automatically stored in a global database. 
   * ZODB may be very good for object persistence 
            * caveats: sometimes you need to tell ZODB that you have changed some data or else it won't remember... 
            * ZODB never shrinks a file, unless you call a vacuum-like command 
            * pickling is dangerous without a plain text backup, since pickling can fail when you bridge versions... 
               * therefore, it is best to have a plain human-readable text file, and a function that will read in the text and convert the data to current pickled cucumbers... 
            * real-world data is great for recursive databasing, but algebraic objects can be too complicated... 
            * it's like a dictionary... 
1. Online databases 
   * (*) host these same portable mergable files online, in a killer 2.0 web app that serves the data 
   * modeled on the notebook server, there could be a database server... Tom?... Can you hear me?... Apparently there's a SQLite server for Windoze called SQLite_on_sockets. That should be useful... 
   * these databases could also serve sobj's, and depending on how ambitious people are, it could seamlessly interface with the notebook... 

## Unresolved issues

   1. lists as entries 
            * storing a whole list in one entry in the database: this is feasible via Emily's rawking regexp skills, IF we can find a delimiter guaranteed not to be in pickle strings. It is optimal for speed and memory. 
            * storing a list as an array of rows (experience tells us that this is inefficient) 
   1. Licensing: $\exists$ DBGPL? 
   1. Noticing identical database entries [added by David Joyner -- I think this can be resolved using a query. Is that correct Tom?] 
   1. [added by David Joyner] I'd like the issue of "uniformity" to be discussed. For example, I think having an "AUTHORS" and "REFERENCES" field (like the <a class="http" href="http://www.research.att.com/~njas/sequences/">OEIS</a>) would be great. For example, when Kate Minolta computes a new Conway polynomial, not only is the entry added by she gets proper credit. 