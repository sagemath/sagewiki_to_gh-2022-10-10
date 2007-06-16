= Databases =

[:days4/projects/: Other SAGE Days 4 Projects]

Robert Miller, Emily Kirkman, Tom Boothby, David Joyner, Yi Qiang

GOAL: SAGE Enhancement Proposal.

 * Database class
  * instance field
   * filename -- the database itself
   * connection -- a sqlite connection to 'filename'
   * query string -- this would be a string representing the 'query state' of the database object.
    * allows for recursive searching quickly, since we can simply modify the string, and wait until we have to execute the query
   * list of tables -- strings
   * mutable -- boolean
  * functions
   * create/drop table
   * create/drop column( column name, table, bool index=False, bool primary key=False )
    * if no table specified, raise an error and educate user about sql
   * create/drop index( column, table(s) )
   * create/drop primary key( column, table )
    * QUESTION: should we allow multiple tables? bounce this off someone who knows (i.e. is it possible to do this with sqlite?)

   * 9
---

--------------------------------------------


   * unified Database class
     * recursive queries without actually calling sqlite every time: queries kept track of by a string...
     * exactly what should the following do?
       {{{
D = Database('something.db')
Q = D.query({'number_of_finches' : 7}, inplace=False) # hypothetical way to query}}}
       * proposal: it should create a new Database object, with a separate connection to the same database, and add "number_of_finches = 7" to the query string
       {{{
D = Database('something.db')
D.query({'number_of_finches' : 7}, inplace=True) # hypothetical way to query}}}
       * proposal: it should add "number_of_finches = 7" to the query string
     * init establishes connection to sqlite
       *{{{ D = Database() }}} creates a new temp database and opens a connection to it
       *{{{ D = Database('existing.db') }}} opens a connection to 'existing.db'
     * create, remove and modify tables
     * copy method
       * when should this create a new database file?
       * is it possible to have multiple connections to the same .db file? [http://www.mail-archive.com/sqlite-users@sqlite.org/msg24725.html relevant]
     * print?
       * should probably just print a string with database name, number of tables...?
     * save
       * {{{ D.save('my.db') }}} should copy the class's database file to my.db.
       * should this execute queries first?
     * show
       * for extensions to the Database class, this can be anything, e.g. graph database prints nice table
       * for __default__ database class, what would this do? execute any queries and print the data?
     * clear_queries
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
