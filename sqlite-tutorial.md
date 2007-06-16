= Tom Boothby's sqlite-tutorial =

How to create a simple database in sqlite using SAGE.

In SAGE, type

{{{
sage: import sqlite3
}}}

To create a filename for the database

{{{
conn = sqlite3.connect("/full/path/mydata.db")
}}}

This is a blank database at the moment.
Now create a table with fields labeled/typed as follows:

{{{
connection.execute("...")

}}}

This creates a sqlite3.cursor object. Now let's enter an entry into this database

{{{
E = EllipticCurve("389a")
connection.execute("...")
}}}
This is our new entry in the database mydata!

Suppose you entered something wrong and you want to delete an 
entry. You use the primary key to delete an entry:

To "query" all the elliptic curves of rank 2, type:

{{{
result = connection.execute("SELECT * FROM elliptic_curves WHERE rank = 2")
result.fetchone()
}}
will return the first one (replacing "fetchone" by "fetchall" will return all).
