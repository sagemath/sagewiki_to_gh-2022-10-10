= Pre Sage Days Projects =

  0. Compress ZFS on disk.math + rubinstein

  0. Read through all tables at http://wstein.org/Tables/

  0. Decide for every table:
      
       - easy to recompute and extend and check

       - only in Magma  --> implement in SAge

       - reformat data to be readable

       - indexes to speed up queries 
 
       - references

  0. Lists of how to verify conj or theorem via query.

  0. Reorganize (?)


What the interface might look like:

{{{
sage: M = LMFDatabase()
sage: M.<tab>
sage: M.newforms(2, ...)
}}}

{{{
1998-2003: tons of data about (modular forms) + related data
2003-2004: fast online database/tables
ZOPE ZODB Python Web
2004-2009: Sage done
2009 -- back to work on database
}}}
