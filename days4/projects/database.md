= Databases =

[:days4/projects/: Other SAGE Days 4 Projects]

Robert Miller, Emily Kirkman, Tom Boothby, David Joyner, Yi Qiang

 * GOAL: SAGE Enhancement Proposal.

   * unified Database class
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
     * recursive queries without actually calling sqlite every time
     * query in place, query that creates a new Database object

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
