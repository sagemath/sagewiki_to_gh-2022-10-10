= Tom Boothby's sqlite-tutorial =

How to create a simple database in sqlite using SAGE.

In SAGE, type


To create a filename for the database

This is a blank database at the moment

Now create a table with fields labeled/typed as follows:

This creates a sqlite3.cursor object. Now let's enter an entry into this database


This is our new entry in the database tempdb.

Suppose you entered something wrong and you want to delete an 
entry. You use the primary key to delete an entry:

To "query" all the elliptic curves of rank 2, type:

will return the first one (fetchall will return all).
