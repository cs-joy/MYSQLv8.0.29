mysql> SELECT VERSION(), CURRENT_DATE;
+-----------+--------------+
| VERSION() | CURRENT_DATE |
+-----------+--------------+
| 8.0.29    | 2022-06-16   |
+-----------+--------------+
1 row in set (0.00 sec)

mysql> SELECT SIN(PI()/4), (4+5)*5;
+--------------------+---------+
| SIN(PI()/4)        | (4+5)*5 |
+--------------------+---------+
| 0.7071067811865476 |      45 |
+--------------------+---------+
1 row in set (0.00 sec)

mysql> SELECT NOW();
+---------------------+
| NOW()               |
+---------------------+
| 2022-06-16 06:00:20 |
+---------------------+
1 row in set (0.00 sec)

mysql> SELECT VERSION(); SELECT NOW();
+-----------+
| VERSION() |
+-----------+
| 8.0.29    |
+-----------+
1 row in set (0.00 sec)

+---------------------+
| NOW()               |
+---------------------+
| 2022-06-16 06:01:08 |
+---------------------+
1 row in set (0.00 sec)

mysql> SELECT USER(), CURRENT_DATE;
+--------------+--------------+
| USER()       | CURRENT_DATE |
+--------------+--------------+
| sj@localhost | 2022-06-16   |
+--------------+--------------+
1 row in set (0.00 sec)

mysql> SELECT USER()
    -> ;
+--------------+
| USER()       |
+--------------+
| sj@localhost |
+--------------+
1 row in set (0.00 sec)

mysql> USE cats;
ERROR 1049 (42000): Unknown database 'cats'
mysql> SELECT * FROM cats;
ERROR 1046 (3D000): No database selected
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
17 rows in set (0.02 sec)

mysql> USE mysql_learning;
Database changed
mysql> SELECT * FROM cats;
+----+--------+--------+------------+
| id | name   | owner  | birth      |
+----+--------+--------+------------+
|  1 | berry  | carret | 1991-01-01 |
|  2 | stathe | carrot | 1998-06-14 |
+----+--------+--------+------------+
2 rows in set (0.03 sec)

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
5 rows in set (0.01 sec)

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

mysql> SELECT * FROM cats WHERE birth='1991-01-01
    '> ' 
    -> ;
+----+-------+--------+------------+
| id | name  | owner  | birth      |
+----+-------+--------+------------+
|  1 | berry | carret | 1991-01-01 |
+----+-------+--------+------------+
1 row in set, 1 warning (0.00 sec)

mysql> select * from cats where name="
    "> stathe
    "> "
    -> ;
Empty set (0.00 sec)

mysql> SELECT * FROM cats WHERE name="berry
    "> ";
Empty set (0.00 sec)

mysql> INSERT INTO cats (name, owner, birth) VALUES('laugh cat', 'ruby jerry', '2003-04-12');
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM cats;
+----+-----------+------------+------------+
| id | name      | owner      | birth      |
+----+-----------+------------+------------+
|  1 | berry     | carret     | 1991-01-01 |
|  2 | stathe    | carrot     | 1998-06-14 |
|  4 | laugh cat | ruby jerry | 2003-04-12 |
+----+-----------+------------+------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM cats WHERE owner="
    "> ruby
    "> jerry"
    -> ;
Empty set (0.00 sec)

mysql> SELECT * FROM cats WHERE owner='ruby
    '> jerry
    '> '
    -> ;
Empty set (0.00 sec)

mysql> SELECT * FROM cats WHERE owner="ruby jerry";
+----+-----------+------------+------------+
| id | name      | owner      | birth      |
+----+-----------+------------+------------+
|  4 | laugh cat | ruby jerry | 2003-04-12 |
+----+-----------+------------+------------+
1 row in set (0.00 sec)

mysql> SELECT * FROM cats WHERE name='laugh cat' /*commen
   /*> ;
   /*> */
    -> ;
+----+-----------+------------+------------+
| id | name      | owner      | birth      |
+----+-----------+------------+------------+
|  4 | laugh cat | ruby jerry | 2003-04-12 |
+----+-----------+------------+------------+
1 row in set (0.00 sec)

mysql> SELECT * FROM cats WHERE name='laugh cat' /*multi line        
   /*> comment */ 
    -> ;
+----+-----------+------------+------------+
| id | name      | owner      | birth      |
+----+-----------+------------+------------+
|  4 | laugh cat | ruby jerry | 2003-04-12 |
+----+-----------+------------+------------+
1 row in set (0.00 sec)

mysql> SELECT birth FROM `cats
    `> `
    -> WHERE name="laugh cat 
    "> " /*this is a comment
   /*> and in this line, i close the comment section */
    -> ;
ERROR 1103 (42000): Incorrect table name 'cats
'
mysql> SELECT birth FROM `cats
    `> `;
ERROR 1103 (42000): Incorrect table name 'cats
'
mysql> SELECT birth FROM `cats`;      
+------------+
| birth      |
+------------+
| 1991-01-01 |
| 1998-06-14 |
| 2003-04-12 |
+------------+
3 rows in set (0.00 sec)