### Some Basic Operations with MySQL
Here are some basic operations with the MySQL server. SQL Statements explains in detail the rich syntax and functionality of the SQL statements that are illustrated below.

Showing existing databases.  Use a SHOW DATABASES statement:

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

### Creating a new database.  Use a CREATE DATABASE statement:

mysql> CREATE DATABASE pets;
Query OK, 1 row affected (0.01 sec)

Check if the database has been created:

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

Creating a table inside a database.  First, pick the database in which you want to create the table with a USE statement:

mysql> USE pets
Database changed
The USE statement tells MySQL to use pets as the default database for subsequent statements. Next, create a table with a CREATE TABLE statement:

CREATE TABLE cats
(
  id              INT unsigned NOT NULL AUTO_INCREMENT, # Unique ID for the record
  name            VARCHAR(150) NOT NULL,                # Name of the cat
  owner           VARCHAR(150) NOT NULL,                # Owner of the cat
  birth           DATE NOT NULL,                        # Birthday of the cat
  PRIMARY KEY     (id)                                  # Make the id the primary key
);
Data types you can use in each column are explained in Data Types. Primary Key Optimization explains the concept of a primary key. What follows a # on each line is a comment, which is ignored by the mysql client; see Comments for other comment styles.

Check if the table has been created with a SHOW TABLES statement:

mysql> SHOW TABLES;
+----------------+
| Tables_in_pets |
+----------------+
| cats           |
+----------------+
1 row in set (0.00 sec)
DESCRIBE shows information on all columns of a table:

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
Adding records into a table.  Use, for example, an INSERT...VALUES statement:

INSERT INTO cats ( name, owner, birth) VALUES
  ( 'Sandy', 'Lennon', '2015-01-03' ),
  ( 'Cookie', 'Casey', '2013-11-13' ),
  ( 'Charlie', 'River', '2016-05-21' );
See Literal Values for how to write string, date, and other kinds of literals in MySQL.
