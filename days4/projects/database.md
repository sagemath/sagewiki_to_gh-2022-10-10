= Databases =

[:days4/projects/: Other SAGE Days 4 Projects]


SAGE [http://www.initd.org/pub/software/pysqlite/doc/usage-guide.html interface] to sqlite: [:sqlite-tutorial: creating your own database using sqlite in sage]


Robert Miller, Emily Kirkman, Tom Boothby, David Joyner, Yi Qiang

== Unresolved issues ==
  1. Should a generic SAGE Database object try to reproduce much advanced sqlite-fu? This came up during the first-run at coding such a class. If a generic SAGE Database were written to handle only more basic functions (such as only searching one table in a database at a time), it would be easier to maintain: its main purpose would be to expose an easy database structure to those not interested in learning the nuances of sqlite.
     * Note- this would not be a problem for developers, who could expand their own classes as they please.
     * This also wouldn't affect the global computation results database, which would be highly tweaked.
  1. lists as entries
     * storing a whole list in one entry in the database: this is feasible via Emily's rawking regexp skills, IF we can find a delimiter guaranteed not to be in pickle strings. It is optimal for speed and memory.
     * storing a list as an array of rows (experience tells us that this is inefficient)
  1. Whether it is worth it to have separate query objects on the same database (I can think of two advantages)
     * ability to do query arithmetic, perhaps in set theoretic language
     * ability to have different queries to check on an expanding database, for updates of certain subsets of information...
  1. Licensing: $\exists$ DBGPL?
  1. Noticing identical database entries

== Quick Notes ==

  1. ZODB may be very good for object persistence
     * caveats: sometimes you need to tell ZODB that you have changed some data or else it won't remember...
     * ZODB never shrinks a file, unless you call a vacuum-like command
     * pickling is dangerous without a plain text backup, since pickling can fail when you bridge versions...
      * therefore, it is best to have a plain human-readable text file, and a function that will read in the text and convert the data to current pickled cucumbers...
     * real-world data is great for recursive databasing, but algebraic objects can be too complicated...
     * it's like a dictionary...
  1. sqlite best for querying, not for quick reading and writing, i.e. best for serving
  1. Zope to serve webpages? [http://modular.fas.harvard.edu:8080/mfd/index.html e.g.]

== SAGE Enhancement Proposal ==

 * Database class
  * instance field
   * filename -- the database itself
   * connection -- a pysqlite connection to 'filename'
   * query -- this would be the following two objects:
    * a string representing the 'where clause'.
    * a dict representing what data to return (default everything), {{{ {'table1':['col1', 'col2'], 'table2':['col9'] } }}}
    * allows for recursive searching quickly, since we can simply modify the string, and wait until we have to execute the query
    * recursive searching is strictly an 'intersection'-- both of data returned (design decision) and of where clauses (definition of recursive search)
   * dict of tables -- keyed by table name, entries are
    * dict of columns -- keyed by column name, keeps track of indices, primary key state
   * mutable -- boolean
  * functions
   * init
    * {{{A = Database()}}} creates a new (obviously mutable) temp database and opens a connection to it
    * {{{B = Database()}}} creates a new (different) temp database and opens a connection to it
    * {{{C = Database('existing.db')}}} opens a connection to 'existing.db'
    * {{{X = Database('special.db')}}} where 'special.db' is one of the databases included in sage, which will usually be treated as immutable
     * border case, not likely to happen, but what SHOULD happen
     * issue warning/error
     * create mutable Database instance
     * create immutable Database instance
      * public notebook, BAD
      * avoidable with chroot jails?
      * is this even an issue?
      * can't someone mess with this via other methods?
   * (mut'ble only) create/drop table
   * (mut'ble only) create/drop column( column name, col type, table, bool index=False, bool primary key=False )
    * if no table specified, raise an error and educate user about sql
   * (mut'ble only) create/drop index( column, table(s) )
   * (mut'ble only) create/drop primary key( column, table )
    * QUESTION: should we allow multiple tables? bounce this off someone who knows (i.e. is it possible to do this with sqlite?)
   * (mut'ble only) create/drop row( table, dict )
    * create accepts a dictionary keyed by column name
      {{{
def foo(table=None, **kwds):
    if table is None:
        raise KeyError('Table must be specified')
    print kwds

sage: foo(table='table_name', shit='poo', dog='cat')
# works
sage: foo(shit='poo', dog='cat')
Exception (click to the left for traceback):
...
KeyError: 'Table must be specified'
}}}

   * (mut'ble only) add data from whatever (e.g. quickly via sql file): magic function to deal with other ways to add data? think about this more later.
   * set_mutable
   * copy
    * since it is [http://www.mail-archive.com/sqlite-users@sqlite.org/msg24725.html possible] to have two connections to the same db file, whether to create a new db may be a good option
     * pros? cons?
    * mutable by default
    * skeleton option will create a new mutable database with empty tables but the same column/index/primary key structure
    * preserves the query string?
    * executes the query string first?
   * save
    * {{{ D.save('my.db') }}} should copy the class's database file to my.db.
    * this should not execute queries at all
    * option to close connection with old file and connect to new file, but default behavior shouldn't do this. motivation:
      {{{
D = Database()
D.add( something great! ) # If save automatically connects
D.save('im_rich.db')      # to saved file, results could
D.remove( the great )     # easily be lost.
D.add( useless )
D.save('crap.db')
}}}
   * print
    * should probably just print a string with database name, number of tables...?
   * show
    * for extensions to the Database class, this can be anything, e.g. graph database prints nice table
    * for __default__ database class, execute any queries and print the data- this isn't that much of an issue since everything will be int, real, bool or string...
    * notebook will print a nice html table
    * for command line, output returned by sqlite is a pretty good template
   * fn to update query data (see under instance field)
    * first is table or tables
    * second argument is a "where clause", such as 'vertices = 5', or '(vertices=5 and edges=8) or not (vertices < 9)'
    * require primary key to be the same in each table? else, how to join?
    * inplace option
    * how to do a join?
   * vacuum
   * clear queries
 * !ImmutableDatabase class
  * idea - a different class for databases that are included with sage, to avoid issues relating to stupid people accidentally fucking up an important database in a public setting (if possible)
  * cheekiness - have Database class extend !ImmutableDatabase! although a Database won't technically be immutable, it is a good way to do this, since we can add on all the modification functions

 * Automated Caching
  * idea - when you do an expensive calculation on an object, the result is automatically stored in a global database.
  * different classes of objects would have different tables, defined by their classes.
  * any object would be required to be set immutable. when it is set to mutable again, the entry in the database corresponding to the object would be dropped.
  * export these tables as portable mergeable files (*), along with a pickle of each object, if desired.

 * Online databases
  * (*) host these same portable mergable files online, in a killer 2.0 web app that serves the data
  * modeled on the notebook server, there could be a database server... Tom?... Can you hear me?... Apparently there's a SQLite server for Windoze called SQLite_on_sockets. That should be useful...
  * these databases could also serve sobj's, and depending on how ambitious people are, it could seamlessly interface with the notebook...

 * eat a donut, drink some tea
