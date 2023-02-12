

# Pre Sage Days Projects

* <a href="/days17/projects/presagedays/discussion">Long list of projects corresponding to existing databases</a> 
* <a href="/days17/projects/presagedays/database">Database Code</a> 

## Overall Plan

   1. Compress ZFS on disk.math + rubinstein 
   1. Read through all tables at <a href="http://wstein.org/Tables/">http://wstein.org/Tables/</a> 
   1. Decide for every table:  
                  * - easy to recompute and extend and check - only in Magma  --> implement in SAge - reformat data to be readable - indexes to speed up queries  - references 
   1. Lists of how to verify conj or theorem via query. 
   1. Reorganize (?) 
What the interface might look like: 


```txt
sage: M = LMFDatabase()
sage: M.<tab>
sage: M.newforms(2, ...)
```

```txt
1998-2003: tons of data about (modular forms) + related data
2003-2004: fast online database/tables
ZOPE ZODB Python Web
2004-2009: Sage done
2009 -- back to work on database
```