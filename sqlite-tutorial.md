

# Tom Boothby's sqlite-tutorial

How to create a simple database in sqlite using SAGE. 

In SAGE, type 


```txt
sage: import sqlite3
```
To create a filename for the database 


```txt
sage: conn = sqlite3.connect("/full/path/mydata.db")
```
This is a blank database at the moment. Now create a table with fields labeled/typed as follows: 


```txt
sage: connection.execute("CREATE TABLE elliptic_curves (cremona_label text primary key, a_1 int, a_2 int, a_3 int, a_4 int, a_6 int, rank int, regulator float)")
```
This creates a sqlite3.cursor object. Now let's enter an entry into this database 


```txt
sage: E = EllipticCurve("389a")
sage: connection.execute("INSERT INTO elliptic_curves(cremona_label,a_1,a_2,a_3,a_4,a_6,rank,regulator) VALUES (?,?,?,?,?,?,?,?)", ('389a', int(E.a1()), int(E.a2()), int(E.a3()), int(E.a4()), int(E.a6()), int(E.rank()), float(E.regulator())))
```
This is our new entry in the database mydata! (If this fails with a mysterious error then possibly the entries, such as E.a1(), need to be coerced into the correct data type, such as int(E.a1()).) 


### Queries

To "query" all the elliptic curves of rank 2, type: 


```txt
sage: result = connection.execute("SELECT * FROM elliptic_curves WHERE rank=1")
sage: print result.fetchone()
None
sage: result = connection.execute("SELECT * FROM elliptic_curves WHERE rank=2")
sage: print result.fetchone()
(u'389a', 0, 0, 1, 1, -2, 0, 0, 2, 0.15246017794314401)
sage: print result.fetchone()
None
```
will return the first one (replacing "fetchone" by "fetchall" will return all). 


### Deleting an entry

Suppose you entered something wrong and you want to delete an  entry. You use the "primary key" to delete an entry: 


```txt
sage: connection.execute("DELETE FROM elliptic_curves WHERE cremona_label = ?",("389a",))
```