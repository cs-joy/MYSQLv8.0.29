>mysql -u sj -p
Enter password: *************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.29 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| cr                 |
| crud_application   |
| crud_operation     |
| crud_project       |
| information_schema |
| mysql              |
| mysql_learning     |
| performance_schema |
| php                |
| react_php          |
| rest_php           |
| sakila             |
| sales              |
| sql_file           |
| sys                |
| vscommuniy         |
| world              |
+--------------------+
17 rows in set (0.06 sec)

mysql> USE mysql_learning;
Database changed
mysql> SHOW TABLES:
    -> ^C
mysql> SHOW TABLES;
+--------------------------+
| Tables_in_mysql_learning |
+--------------------------+
| cats                     |
| employeer                |
| images                   |
| imgs                     |
| products                 |
+--------------------------+
5 rows in set (0.02 sec)

mysql> DESCRIBE cats;
+-------+--------------+------+-----+---------+----------------+
| Field | Type         | Null | Key | Default | Extra          |
+-------+--------------+------+-----+---------+----------------+
| id    | int unsigned | NO   | PRI | NULL    | auto_increment |
| name  | varchar(150) | NO   |     | NULL    |                |
| owner | varchar(150) | NO   |     | NULL    |                |
| birth | date         | NO   |     | NULL    |                |
+-------+--------------+------+-----+---------+----------------+
4 rows in set (0.01 sec)

mysql> SELECT * FROM cats;
+----+-------+--------+------------+
| id | name  | owner  | birth      |
+----+-------+--------+------------+
|  1 | berry | carret | 1991-01-01 |
+----+-------+--------+------------+
1 row in set (0.02 sec)

mysql> SELECT name FROM cats;
+-------+
| name  |
+-------+
| berry |
+-------+
1 row in set (0.00 sec)

mysql> INSERT INTO cats (name, owner, birth) VALUES('stathe', 'carrot', '1998-06-14');
Query OK, 1 row affected (0.02 sec)

mysql> SELECT name FROM cats;
+--------+
| name   |
+--------+
| berry  |
| stathe |
+--------+
2 rows in set (0.00 sec)

mysql> SELECT name FROM cats WHERE owner='carret';
+-------+
| name  |
+-------+
| berry |
+-------+
1 row in set (0.00 sec)

mysql> SELECT * FROM cats;
+----+--------+--------+------------+
| id | name   | owner  | birth      |
+----+--------+--------+------------+
|  1 | berry  | carret | 1991-01-01 |
|  2 | stathe | carrot | 1998-06-14 |
+----+--------+--------+------------+
2 rows in set (0.00 sec)

mysql> INSERT INTO cats (name, owner, birth) VALUES('luis', 'fonci', '2002-03-28');
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM cats;
+----+--------+--------+------------+
| id | name   | owner  | birth      |
+----+--------+--------+------------+
|  1 | berry  | carret | 1991-01-01 |
|  2 | stathe | carrot | 1998-06-14 |
|  3 | luis   | fonci  | 2002-03-28 |
+----+--------+--------+------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM cats WHERE id='3';
+----+------+-------+------------+
| id | name | owner | birth      |
+----+------+-------+------------+
|  3 | luis | fonci | 2002-03-28 |
+----+------+-------+------------+
1 row in set (0.00 sec)

mysql> DELETE FROM cats WHERE name='luis';
Query OK, 1 row affected (0.00 sec)

mysql> SELECT * FROM cats;
+----+--------+--------+------------+
| id | name   | owner  | birth      |
+----+--------+--------+------------+
|  1 | berry  | carret | 1991-01-01 |
|  2 | stathe | carrot | 1998-06-14 |
+----+--------+--------+------------+
2 rows in set (0.00 sec)

mysql> ALTER TABLE cats ADD gender CHAR(1) AFTER name;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM cats;
+----+--------+--------+--------+------------+
| id | name   | gender | owner  | birth      |
+----+--------+--------+--------+------------+
|  1 | berry  | NULL   | carret | 1991-01-01 |
|  2 | stathe | NULL   | carrot | 1998-06-14 |
+----+--------+--------+--------+------------+
2 rows in set (0.00 sec)

mysql> DESCRIBE cats;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int unsigned | NO   | PRI | NULL    | auto_increment |
| name   | varchar(150) | NO   |     | NULL    |                |
| gender | char(1)      | YES  |     | NULL    |                |
| owner  | varchar(150) | NO   |     | NULL    |                |
| birth  | date         | NO   |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> INSERT INTO cats(gender) VALUES('m') WHERE id='1';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'WHERE id='1'' at line 1
mysql> INSERT INTO cats(gender) VALUES('m');
ERROR 1364 (HY000): Field 'name' doesn't have a default value

mysql> DESCRIBE cats;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int unsigned | NO   | PRI | NULL    | auto_increment |
| name   | varchar(150) | NO   |     | NULL    |                |
| gender | char(1)      | YES  |     | NULL    |                |
| owner  | varchar(150) | NO   |     | NULL    |                |
| birth  | date         | NO   |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> SHOW CREATE TABLE cats\G
*************************** 1. row ***************************
       Table: cats
Create Table: CREATE TABLE `cats` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `owner` varchar(150) NOT NULL,
  `birth` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
1 row in set (0.00 sec)

mysql> ALTER TABLE cats DROP gender;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE cats;
+-------+--------------+------+-----+---------+----------------+
| Field | Type         | Null | Key | Default | Extra          |
+-------+--------------+------+-----+---------+----------------+
| id    | int unsigned | NO   | PRI | NULL    | auto_increment |
| name  | varchar(150) | NO   |     | NULL    |                |
| owner | varchar(150) | NO   |     | NULL    |                |
| birth | date         | NO   |     | NULL    |                |
+-------+--------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)
