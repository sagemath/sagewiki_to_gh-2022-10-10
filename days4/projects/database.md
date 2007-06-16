= Databases =

[:days4/projects/: Other SAGE Days 4 Projects]

Robert Miller, David Joyner, Yi Qiang, Emily Kirkman, Tom Boothby

 * GOAL: SAGE Enhancement Proposal.

   * Unified Database class
     * init establishes connection to sqlite
     * create, remove and modify tables
     * copy method
     * print?, save and show?
     * recursive queries without actually calling sqlite every time

 * Issues to brainstorm:

   * Brainless database creation.

   * SAGE [http://www.initd.org/pub/software/pysqlite/doc/usage-guide.html interface] to sqlite [:sqlite-tutorial: creating your own database using sqlite in sage]

   * Uniform database approach within sage

   * Databases distributed with sage

   * Online databases
 
     * cgi web-accessible...

     * accessible from SAGE, perhaps hosted at sage.math...

     * SQLite servers?

   * Automagic caching: keep track of computation results

     * keeping those results in portable objects, making these objects merge-able, etc...

   * Licensing: $\exists$ DBGPL?

   * Noticing identical database entries

   * Standard databases included with sage should be immutable
