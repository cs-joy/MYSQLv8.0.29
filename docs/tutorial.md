### Some Basic Operations with MySQL
Here are some basic operations with the MySQL server. SQL Statements explains in detail the rich syntax and functionality of the SQL statements that are illustrated below.

Showing existing databases.  Use a SHOW DATABASES statement:
```mysql
mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.00 sec)
```
### Creating a new database.  Use a CREATE DATABASE statement:

mysql> CREATE DATABASE pets;
Query OK, 1 row affected (0.01 sec)

Check if the database has been created:
```mysql
mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| pets               |
| sys                |
+--------------------+
5 rows in set (0.00 sec)
```
Creating a table inside a database.  First, pick the database in which you want to create the table with a USE statement:

mysql> USE pets
Database changed
The USE statement tells MySQL to use pets as the default database for subsequent statements. Next, create a table with a CREATE TABLE statement:
```mysql
CREATE TABLE cats
(
  id              INT unsigned NOT NULL AUTO_INCREMENT, # Unique ID for the record
  name            VARCHAR(150) NOT NULL,                # Name of the cat
  owner           VARCHAR(150) NOT NULL,                # Owner of the cat
  birth           DATE NOT NULL,                        # Birthday of the cat
  PRIMARY KEY     (id)                                  # Make the id the primary key
);
```
Data types you can use in each column are explained in Data Types. Primary Key Optimization explains the concept of a primary key. What follows a # on each line is a comment, which is ignored by the mysql client; see Comments for other comment styles.

Check if the table has been created with a SHOW TABLES statement:
```mysql
mysql> SHOW TABLES;
+----------------+
| Tables_in_pets |
+----------------+
| cats           |
+----------------+
1 row in set (0.00 sec)
```
DESCRIBE shows information on all columns of a table:
```mysql
mysql> DESCRIBE cats;
+-------+------------------+------+-----+---------+----------------+
| Field | Type             | Null | Key | Default | Extra          |
+-------+------------------+------+-----+---------+----------------+
| id    | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| name  | varchar(150)     | NO   |     | NULL    |                |
| owner | varchar(150)     | NO   |     | NULL    |                |
| birth | date             | NO   |     | NULL    |                |
+-------+------------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)
```
Adding records into a table.  Use, for example, an INSERT...VALUES statement:
```mysql
INSERT INTO cats ( name, owner, birth) VALUES
  ( 'Sandy', 'Lennon', '2015-01-03' ),
  ( 'Cookie', 'Casey', '2013-11-13' ),
  ( 'Charlie', 'River', '2016-05-21' );
  ```
See Literal Values for how to write string, date, and other kinds of literals in MySQL.

Retrieving records from a table.  Use a SELECT statement, and “*” to match all columns:

mysql> SELECT * FROM cats;
+----+---------+--------+------------+
| id | name    | owner  | birth      |
+----+---------+--------+------------+
|  1 | Sandy   | Lennon | 2015-01-03 |
|  2 | Cookie  | Casey  | 2013-11-13 |
|  3 | Charlie | River  | 2016-05-21 |
+----+---------+--------+------------+
3 rows in set (0.00 sec)
To select specific columns and rows by a certain condition using the WHERE clause:

mysql> SELECT name FROM cats WHERE owner = 'Casey';
+--------+
| name   |
+--------+
| Cookie |
+--------+
1 row in set (0.00 sec)
Deleting a record from a table.  Use a DELETE statement to delete a record from a table, specifying the criterion for deletion with the WHERE clause:

mysql> DELETE FROM cats WHERE name='Cookie';
Query OK, 1 row affected (0.05 sec)

mysql> SELECT * FROM cats;
+----+---------+--------+------------+
| id | name    | owner  | birth      |
+----+---------+--------+------------+
|  1 | Sandy   | Lennon | 2015-01-03 |
|  3 | Charlie | River  | 2016-05-21 |
+----+---------+--------+------------+
2 rows in set (0.00 sec)
Adding or deleting a column from a table.  Use an ALTER TABLE...ADD statement to add a column. You can use, for example, an AFTER clause to specify the location of the new column:

mysql> ALTER TABLE cats ADD gender CHAR(1) AFTER name;
Query OK, 0 rows affected (0.24 sec)
Records: 0  Duplicates: 0  Warnings: 0
Use DESCRIBE to check the result:

mysql> DESCRIBE cats;
+--------+------------------+------+-----+---------+----------------+
| Field  | Type             | Null | Key | Default | Extra          |
+--------+------------------+------+-----+---------+----------------+
| id     | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| name   | varchar(150)     | NO   |     | NULL    |                |
| gender | char(1)          | YES  |     | NULL    |                |
| owner  | varchar(150)     | NO   |     | NULL    |                |
| birth  | date             | NO   |     | NULL    |                |
+--------+------------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)
SHOW CREATE TABLE shows a CREATE TABLE statement, which provides even more details on the table:

mysql> SHOW CREATE TABLE cats\G
*************************** 1. row ***************************
       Table: cats
Create Table: CREATE TABLE `cats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `owner` varchar(150) NOT NULL,
  `birth` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1
1 row in set (0.00 sec)
Use ALTER TABLE...DROP to delete a column:

mysql> ALTER TABLE cats DROP gender;
Query OK, 0 rows affected (0.19 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE cats;
+-------+------------------+------+-----+---------+----------------+
| Field | Type             | Null | Key | Default | Extra          |
+-------+------------------+------+-----+---------+----------------+
| id    | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| name  | varchar(150)     | NO   |     | NULL    |                |
| owner | varchar(150)     | NO   |     | NULL    |                |
| birth | date             | NO   |     | NULL    |                |
+-------+------------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)
See the Tutorial for more instructions on how to work with the MySQL server.

Other Important Tasks to Perform
Create more user accounts.  root is a superuser account for administration of the MySQL server which should not be used for general operations. On how to create user accounts of various kinds, see Adding Accounts, Assigning Privileges, and Dropping Accounts.

Configure MySQL to be managed with systemd.  If you have installed MySQL on a systemd platform using generic binaries and want it to be managed with systemd, see Managing MySQL Server with systemd.
