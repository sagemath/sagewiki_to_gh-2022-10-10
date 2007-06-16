= Tom Boothby's sqlite-tutorial =

How to create a simple database in sqlite using SAGE.

In SAGE, type

{{{
sage: import sqlite3
}}}

To create a filename for the database

{{{
sage: conn = sqlite3.connect("/full/path/mydata.db")
}}}

This is a blank database at the moment.
Now create a table with fields labeled/typed as follows:

{{{
sage: connection.execute("CREATE TABLE cremona_label text primary key, a_0 int, a_1 int, a_2 int, a_3 int, a_4 int, a_5 int, a_6 int,  rank int, regulator float)")
}}}

This creates a sqlite3.cursor object. Now let's enter an entry into this database

{{{
sage: E = EllipticCurve("389a")
sage: connection.execute("INSERT INTO elliptic_curves(cremona_label,a_0,a_1,a_2,a_3,a_4,a_5,a_6,rank,regulator) VALUES (?,?,?,?,?,?,?,?,?,?)", ("389a",0,E.a1(),E.a2(),E.a3(),E.a4(),0,E.a6(),E.rank(),E.regular()))
}}}

This is our new entry in the database mydata! (If this fails with a mysterious error then possibly the entries, such as E.a1(), need to be coerced into the correct data type, such as int(E.a1()).)

Suppose you entered something wrong and you want to delete an 
entry. You use the primary key to delete an entry:

{{{
sage: connection.execute("DELETE FROM elliptic_curves WHERE cremona_label = ?",("389a",))
}}}

To "query" all the elliptic curves of rank 2, type:

{{{
sage: result = connection.execute("SELECT * FROM elliptic_curves WHERE rank = 2")
sage: result.fetchone()
}}

will return the first one (replacing "fetchone" by "fetchall" will return all).
