= Databases =

[:days4/projects/: Other SAGE Days 4 Projects]

Robert Miller, Emily Kirkman, Tom Boothby, David Joyner, Yi Qiang

GOAL: SAGE Enhancement Proposal.

 * Unresolved issues:
  * require primary key to be the same in each table? else, how to join?
  * lists as entries: this is feasible via Emily's rawking regexp skills, IF we can find a delimiter guaranteed not to be in pickle strings (or pickled cucumbers, whichever comes first)


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
      * "Because hey, if you want to rm -rf your own hard drive, go for it!" (R. Miller)
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
D.add_a_bunch_of_shit()...
D.save('bunch of shit')
D.remove_shit()
D.add_piss_and_vinegar()...
D.save('piss and vinegar')
}}}
   * print
    * should probably just print a string with database name, number of tables...?
   * show
    * for extensions to the Database class, this can be anything, e.g. graph database prints nice table
    * for __default__ database class, execute any queries and print the data- this isn't that much of an issue since everything will be int, real, bool or string...
    * notebook will print a nice html table
    * for command line, output returned by sqlite is a pretty good template
   * fn to update query data (see under instance field)
    * inplace option
    * how to do a join?
   * vacuum
   * clear queries
 * !ImmutableDatabase class
  * idea - a different class for databases that are included with sage, to avoid issues relating to stupid people accidentally fucking up an important database in a public setting (if possible)
  * god damn cheeky -- have database class extend immutable database! although a database won't technically be an immutable database to a person, it is a good way to do this, since we can add on the property 'mutable', as well as all the modification functions

----------------------------------------------------------------------


   * Brainless database creation.

   * Databases distributed with sage: Standard databases included with sage should be immutable

   * Online databases
 
     * cgi web-accessible...

     * accessible from SAGE, perhaps hosted at sage.math...

     * SQLite servers?

   * Automagic caching: keep track of computation results

     * keeping those results in portable objects, making these objects merge-able, etc...

   * Licensing: $\exists$ DBGPL?

   * Noticing identical database entries

   * SAGE [http://www.initd.org/pub/software/pysqlite/doc/usage-guide.html interface] to sqlite [:sqlite-tutorial: creating your own database using sqlite in sage]
