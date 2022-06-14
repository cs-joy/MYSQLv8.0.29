## Creating and Selecting a Database
If the administrator creates your database for you when setting up your permissions, you can begin using it. Otherwise, you need to create it yourself:
```mysql
mysql> CREATE DATABASE menagerie;
```
Under Unix, database names are case-sensitive (unlike SQL keywords), so you must always refer to your database as menagerie, not as Menagerie, MENAGERIE, or some other variant. This is also true for table names. (Under Windows, this restriction does not apply, although you must refer to databases and tables using the same lettercase throughout a given query. However, for a variety of reasons, the recommended best practice is always to use the same lettercase that was used when the database was created.)

> ### Note
> If you get an error such as `ERROR 1044 (42000): Access denied for user 'micah'@'localhost' to database 'menagerie'` when attempting to create a database, this means that your user account does not have the necessary privileges to do so. Discuss this with the administrator or see Section 6.2, “Access Control and Account Management”.

Creating a database does not select it for use; you must do that explicitly. To make menagerie the current database, use this statement:
```mysql
mysql> USE menagerie
Database changed
```
Your database needs to be created only once, but you must select it for use each time you begin a mysql session. You can do this by issuing a USE statement as shown in the example. Alternatively, you can select the database on the command line when you invoke mysql. Just specify its name after any connection parameters that you might need to provide. For example:
```mysql
$> mysql -h host -u user -p menagerie
Enter password: ********
```

> ### Important
> `menagerie` in the command just shown is not your password. If you want to supply your password on the command line after the -p option, you must do so with no intervening space (for example, as -p`password`, not as -p `password`). However, putting your password on the command line is not recommended, because doing so exposes it to snooping by other users logged in on your machine.

 > ### Note
 > You can see at any time which database is currently selected using `SELECT DATABASE()`.
