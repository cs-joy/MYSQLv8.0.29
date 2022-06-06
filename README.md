# MYSQLv8.0.29
MYSQL Server 8.0

MySQL is an open-source relational database management system (RDBMS).Its name is a combination of "My", the name of co-founder Michael Widenius's daughter, and "SQL", the abbreviation for Structured Query Language. A relational database organizes data into one or more data tables in which data may be related to each other; these relations help structure the data. SQL is a language programmers use to create, modify and extract data from the relational database, as well as control user access to the database. In addition to relational databases and SQL, an RDBMS like MySQL works with an operating system to implement a relational database in a computer's storage system, manages users, allows for network access and facilitates testing database integrity and creation of backups.

![SSmysql](https://github.com/cs-joy/MYSQLv8.0.29/blob/main/1024px-Mysql-screenshot.png "Screenshot of the default MySQL command-line banner and prompt")

###  EN

MySQL (/ˌmaɪˌɛsˌkjuːˈɛl/) is an open-source relational database management system (RDBMS). Its name is a combination of "My", the name of co-founder Michael Widenius's daughter, and "SQL", the abbreviation for Structured Query Language. A relational database organizes data into one or more data tables in which data may be related to each other; these relations help structure the data. SQL is a language programmers use to create, modify and extract data from the relational database, as well as control user access to the database. In addition to relational databases and SQL, an RDBMS like MySQL works with an operating system to implement a relational database in a computer's storage system, manages users, allows for network access and facilitates testing database integrity and creation of backups.

MySQL is free and open-source software under the terms of the GNU General Public License, and is also available under a variety of proprietary licenses. MySQL was owned and sponsored by the Swedish company MySQL AB, which was bought by Sun Microsystems (now Oracle Corporation). In 2010, when Oracle acquired Sun, Widenius forked the open-source MySQL project to create MariaDB.

MySQL has stand-alone clients that allow users to interact directly with a MySQL database using SQL, but more often, MySQL is used with other programs to implement applications that need relational database capability. MySQL is a component of the LAMP web application software stack (and others), which is an acronym for Linux, Apache, MySQL, Perl/PHP/Python. MySQL is used by many database-driven web applications, including Drupal, Joomla, phpBB, and WordPress. MySQL is also used by many popular websites, including Facebook, Flickr, MediaWiki, Twitter, and YouTube.

### Overview
MySQL is written in C and C++. Its SQL parser is written in yacc, but it uses a home-brewed lexical analyzer. MySQL works on many system platforms, including AIX, BSDi, FreeBSD, HP-UX, ArcaOS, eComStation, IBM i, IRIX, Linux, macOS, Microsoft Windows, NetBSD, Novell NetWare, OpenBSD, OpenSolaris, OS/2 Warp, QNX, Oracle Solaris, Symbian, SunOS, SCO OpenServer, SCO UnixWare, Sanos and Tru64. A port of MySQL to OpenVMS also exists.

The MySQL server software itself and the client libraries use dual-licensing distribution. They are offered under GPL version 2, or a proprietary license.

Support can be obtained from the official manual. Free support additionally is available in different IRC channels and forums. Oracle offers paid support via its MySQL Enterprise products. They differ in the scope of services and in price. Additionally, a number of third party organisations exist to provide support and services.

MySQL has received positive reviews, and reviewers noticed it "performs extremely well in the average case" and that the "developer interfaces are there, and the documentation (not to mention feedback in the real world via Web sites and the like) is very, very good". It has also been tested to be a "fast, stable and true multi-user, multi-threaded SQL database server".

### Limitations
When using some storage engines other than the default of InnoDB, MySQL does not comply with the full SQL standard for some of the implemented functionality, including foreign key references. Check constraints are parsed but ignored by all storage engines before MySQL version 8.0.15.

Up until MySQL 5.7, triggers are limited to one per action / timing, meaning that at most one trigger can be defined to be executed after an INSERT operation, and one before INSERT on the same table. No triggers can be defined on views.

MySQL database's inbuilt functions like UNIX_TIMESTAMP() will return 0 after 03:14:07 UTC on 19 January 2038.[94] Recently,[when?] there had been an attempt to solve the problem which had been assigned to the internal queue.

### Deployment
MySQL can be built and installed manually from source code, but it is more commonly installed from a binary package unless special customizations are required. On most Linux distributions, the package management system can download and install MySQL with minimal effort, though further configuration is often required to adjust security and optimization settings.

![LAMP Bundle](https://github.com/cs-joy/MYSQLv8.0.29/blob/main/1024px-LAMP_software_bundle.png "LAMP software bundle, displayed here together with Squid")

Though MySQL began as a low-end alternative to more powerful proprietary databases, it has gradually evolved to support higher-scale needs as well. It is still most commonly used in small to medium scale single-server deployments, either as a component in a LAMP-based web application or as a standalone database server. Much of MySQL's appeal originates in its relative simplicity and ease of use, which is enabled by an ecosystem of open source tools such as phpMyAdmin. In the medium range, MySQL can be scaled by deploying it on more powerful hardware, such as a multi-processor server with gigabytes of memory.

There are, however, limits to how far performance can scale on a single server ('scaling up'), so on larger scales, multi-server MySQL ('scaling out') deployments are required to provide improved performance and reliability. A typical high-end configuration can include a powerful master database which handles data write operations and is replicated to multiple slaves that handle all read operations.[96] The master server continually pushes binlog events to connected slaves so in the event of failure a slave can be promoted to become the new master, minimizing downtime. Further improvements in performance can be achieved by caching the results from database queries in memory using memcached, or breaking down a database into smaller chunks called shards which can be spread across a number of distributed server clusters.

### High availability software
Oracle MySQL offers a high availability solution with a mix of tools including the MySQL router and the MySQL shell. They are based on Group Replication, open source tools.

MariaDB offers a similar offer in terms of products.

### Cloud deployment
Main article: Cloud database
MySQL can also be run on cloud computing platforms such as Microsoft Azure, Amazon EC2, Oracle Cloud Infrastructure. Some common deployment models for MySQL on the cloud are:

### Virtual machine image
In this implementation, cloud users can upload a machine image of their own with MySQL installed, or use a ready-made machine image with an optimized installation of MySQL on it, such as the one provided by Amazon EC2.

### MySQL as a service
Some cloud platforms offer MySQL "as a service". In this configuration, application owners do not have to install and maintain the MySQL database on their own. Instead, the database service provider takes responsibility for installing and maintaining the database, and application owners pay according to their usage. Notable cloud-based MySQL services are the Amazon Relational Database Service; Oracle MySQL Cloud Service, Azure Database for MySQL, Rackspace; HP Converged Cloud; Heroku and Jelastic. In this model the database service provider takes responsibility for maintaining the host and database.

## User interfaces

### Graphical user interfaces
A graphical user interface (GUI) is a type of interface that allows users to interact with electronic devices or programs through graphical icons and visual indicators such as secondary notation, as opposed to text-based interfaces, typed command labels or text navigation.

Third-party proprietary and free graphical administration applications (or "front ends") are available that integrate with MySQL and enable users to work with database structure and data visually.


MySQL Workbench running on macOS
MySQL Workbench
Main article: MySQL Workbench
MySQL Workbench is the integrated environment for MySQL. It was developed by MySQL AB, and enables users to graphically administer MySQL databases and visually design database structures.

MySQL Workbench is available in three editions, the regular free and open source Community Edition which may be downloaded from the MySQL website, and the proprietary Standard Edition which extends and improves the feature set of the Community Edition, and the MySQL Cluster CGE.

### Other GUI tools
Adminer
Database Workbench
DBeaver
DBEdit
HeidiSQL
LibreOffice Base
Navicat
OpenOffice.org Base
phpMyAdmin
SQLBuddy
SQLyog
Toad for MySQL
Webmin

### Command-line interfaces
A command-line interface is a means of interacting with a computer program where the user issues commands to the program by typing in successive lines of text (command lines). MySQL ships with many command line tools, from which the main interface is the mysql client.

MySQL Utilities is a set of utilities designed to perform common maintenance and administrative tasks. Originally included as part of the MySQL Workbench, the utilities are a stand-alone download available from Oracle.

Percona Toolkit is a cross-platform toolkit for MySQL, developed in Perl.[106] Percona Toolkit can be used to prove replication is working correctly, fix corrupted data, automate repetitive tasks, and speed up servers. Percona Toolkit is included with several Linux distributions such as CentOS and Debian, and packages are available for Fedora and Ubuntu as well. Percona Toolkit was originally developed as Maatkit, but as of late 2011, Maatkit is no longer developed.

MySQL shell is a tool for interactive use and administration of the MySQL database. It supports JavaScript, Python or SQL modes and it can be used for administration and access purposes.

### Application programming interfaces
Many programming languages with language-specific APIs include libraries for accessing MySQL databases. These include MySQL Connector/Net for .NET/CLI Languages, and the JDBC driver for Java.

In addition, an ODBC interface called MySQL Connector/ODBC allows additional programming languages that support the ODBC interface to communicate with a MySQL database, such as ASP or ColdFusion. The HTSQL – URL-based query method also ships with a MySQL adapter, allowing direct interaction between a MySQL database and any web client via structured URLs. Other drivers exists for languages like Python or Node.js.

### Project forks
A variety of MySQL forks exist, including the following.

### Current
#### MariaDB
MariaDB is a community-developed fork of the MySQL relational database management system intended to remain free under the GNU GPL. The fork has been led by the original developers of MySQL, who forked it due to concerns over its acquisition by Oracle.[33]

#### Percona Server for MySQL
Percona Server for MySQL, forked by Percona, aims to retain close compatibility to the official MySQL releases.[112] Also included in Percona Server for MySQL is XtraDB, Percona's fork of the InnoDB Storage Engine.[113]

### Abandoned
####Drizzle
Drizzle was a free software/open source relational database management system (DBMS) that was forked from the now-defunct 6.0 development branch of the MySQL DBMS. Like MySQL, Drizzle had a client/server architecture and uses SQL as its primary command language. Drizzle was distributed under version 2 and 3 of the GNU General Public License (GPL) with portions, including the protocol drivers and replication messaging under the BSD license.

#### WebScaleSQL
WebScaleSQL was a software branch of MySQL 5.6, and was announced on 27 March 2014 by Facebook, Google, LinkedIn and Twitter as a joint effort to provide a centralized development structure for extending MySQL with new features specific to its large-scale deployments, such as building large replicated databases running on server farms. Thus, WebScaleSQL opened a path toward deduplicating the efforts each company had been putting into maintaining its own branch of MySQL, and toward bringing together more developers. By combining the efforts of these companies and incorporating various changes and new features into MySQL, WebScaleSQL aimed at supporting the deployment of MySQL in large-scale environments.[115][116] The project's source code is licensed under version 2 of the GNU General Public License, and is hosted on GitHub.

#### OurDelta
The OurDelta distribution, created by the Australian company Open Query (later acquired by Catalyst IT Australia), had two versions: 5.0, which was based on MySQL, and 5.1, which was based on MariaDB. It included patches developed by Open Query and by other notable members of the MySQL community including Jeremy Cole and Google. Once the patches were incorporated into the MariaDB mainline, OurDelta's objectives were achieved and OurDelta passed on its build and packaging toolchain to Monty Program (now MariaDB Corp).
