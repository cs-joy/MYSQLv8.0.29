## Creating and Using a Database

- [Creating and Selecting a Database](https://github.com/cs-joy/MYSQLv8.0.29/blob/main/docs/creating_and_selectingDB.md)
- [Creating a Table](https://github.com/cs-joy/MYSQLv8.0.29/blob/main/docs/creating_table.md)
- [Loading Data into a Table](https://github.com/cs-joy/MYSQLv8.0.29/blob/main/docs/loading_table.md)
- [Retrieving Information from a Table](https://github.com/cs-joy/MYSQLv8.0.29/blob/main/docs/retrieving.md)

Once you know how to enter SQL statements, you are ready to access a database.

Suppose that you have several pets in your home (your menagerie) and you would like to keep track of various types of information about them. You can do so by creating tables to hold your data and loading them with the desired information. Then you can answer different sorts of questions about your animals by retrieving data from the tables. This section shows you how to perform the following operations:

- Create a database

- Create a table

- Load data into the table

- Retrieve data from the table in various ways

- Use multiple tables

The menagerie database is simple (deliberately), but it is not difficult to think of real-world situations in which a similar type of database might be used. For example, a database like this could be used by a farmer to keep track of livestock, or by a veterinarian to keep track of patient records. A menagerie distribution containing some of the queries and sample data used in the following sections can be obtained from the MySQL website. It is available in both compressed tar file and Zip formats at https://dev.mysql.com/doc/.

Use the SHOW statement to find out what databases currently exist on the server:
```mysql
mysql> SHOW DATABASES;
+----------+
| Database |
+----------+
| mysql    |
| test     |
| tmp      |
+----------+
```
The mysql database describes user access privileges. The test database often is available as a workspace for users to try things out.

The list of databases displayed by the statement may be different on your machine; SHOW DATABASES does not show databases that you have no privileges for if you do not have the SHOW DATABASES privilege. See Section 13.7.7.14, “SHOW DATABASES Statement”.

If the test database exists, try to access it:
```mysql
mysql> USE test
Database changed
```
USE, like QUIT, does not require a semicolon. (You can terminate such statements with a semicolon if you like; it does no harm.) The USE statement is special in another way, too: it must be given on a single line.

You can use the test database (if you have access to it) for the examples that follow, but anything you create in that database can be removed by anyone else with access to it. For this reason, you should probably ask your MySQL administrator for permission to use a database of your own. Suppose that you want to call yours menagerie. The administrator needs to execute a statement like this:
```mysql
mysql> GRANT ALL ON menagerie.* TO 'your_mysql_name'@'your_client_host';
```
where your_mysql_name is the MySQL user name assigned to you and your_client_host is the host from which you connect to the server.

s: https://dev.mysql.com/doc/refman/8.0/en/retrieving-data.html
