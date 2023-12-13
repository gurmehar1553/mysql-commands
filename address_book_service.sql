-- UC1

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| payroll_service    |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (1.39 sec)

mysql> CREATE database address_book_service;
Query OK, 1 row affected (0.24 sec)

mysql> show databases;
+----------------------+
| Database             |
+----------------------+
| address_book_service |
| information_schema   |
| mysql                |
| payroll_service      |
| performance_schema   |
| sys                  |
+----------------------+
6 rows in set (0.00 sec)

mysql> use address_book_service;
Database changed

-- UC2

mysql> CREATE TABLE address_book(
    ->     id INT NOT NULL AUTO_INCREMENT,
    ->     firstName VARCHAR(100) NOT NULL,
    ->     lastName VARCHAR(100),
    ->     address VARCHAR(255),
    ->     city VARCHAR(100),
    ->     state VARCHAR(100),
    ->     zip INT,
    ->     phone VARCHAR(20),
    ->     email VARCHAR(100),
    ->     PRIMARY KEY(id)
    -> );
Query OK, 0 rows affected (1.34 sec)

mysql> desc address_book;
+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| id        | int          | NO   | PRI | NULL    | auto_increment |
| firstName | varchar(100) | NO   |     | NULL    |                |
| lastName  | varchar(100) | YES  |     | NULL    |                |
| address   | varchar(255) | YES  |     | NULL    |                |
| city      | varchar(100) | YES  |     | NULL    |                |
| state     | varchar(100) | YES  |     | NULL    |                |
| zip       | int          | YES  |     | NULL    |                |
| phone     | varchar(20)  | YES  |     | NULL    |                |
| email     | varchar(100) | YES  |     | NULL    |                |
+-----------+--------------+------+-----+---------+----------------+
9 rows in set (0.20 sec)

-- UC3

mysql> INSERT INTO address_book
    -> (firstName, lastName, address, city,state,zip,phone,email) VALUES
    -> ('Mary','Dsouza','#12B','xyz','abc',123,'9876568739','mary@123'),
    -> ('Mark','Fernandz','#13C','rajpura','punjab',140401,'9829842819','mark@321'),
    -> ('Albert','Donal','#234', 'patiala','pb',1234,'912949201','albert@123');
Query OK, 3 rows affected (0.28 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM address_book;
+----+-----------+----------+---------+---------+--------+--------+------------+------------+
| id | firstName | lastName | address | city    | state  | zip    | phone      | email      |
+----+-----------+----------+---------+---------+--------+--------+------------+------------+
|  1 | Mary      | Dsouza   | #12B    | xyz     | abc    |    123 | 9876568739 | mary@123   |
|  2 | Mark      | Fernandz | #13C    | rajpura | punjab | 140401 | 9829842819 | mark@321   |
|  3 | Albert    | Donal    | #234    | patiala | pb     |   1234 | 912949201  | albert@123 |
+----+-----------+----------+---------+---------+--------+--------+------------+------------+
3 rows in set (0.00 sec)

mysql> INSERT INTO address_book
    -> (firstName,lastName,address,city,state,zip,phone,email) VALUES
    -> ('Ravi', 'Dubey','#23B','lucknow','UP',1234,'7892819283','ravi@dubey'),
    -> ('Shreya','Ghosal','#234','mumbai','maharashtra',345,'8928392819','shreay@23');
Query OK, 2 rows affected (0.34 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM address_book;
+----+-----------+----------+---------+---------+-------------+--------+------------+------------+
| id | firstName | lastName | address | city    | state       | zip    | phone      | email      |
+----+-----------+----------+---------+---------+-------------+--------+------------+------------+
|  1 | Mary      | Dsouza   | #12B    | xyz     | abc         |    123 | 9876568739 | mary@123   |
|  2 | Mark      | Fernandz | #13C    | rajpura | punjab      | 140401 | 9829842819 | mark@321   |
|  3 | Albert    | Donal    | #234    | patiala | pb          |   1234 | 912949201  | albert@123 |
|  4 | Ravi      | Dubey    | #23B    | lucknow | UP          |   1234 | 7892819283 | ravi@dubey |
|  5 | Shreya    | Ghosal   | #234    | mumbai  | maharashtra |    345 | 8928392819 | shreay@23  |
+----+-----------+----------+---------+---------+-------------+--------+------------+------------+
5 rows in set (0.00 sec)

-- UC4

mysql> UPDATE address_book set city = 'karnal' where firstName = 'Mary';
Query OK, 1 row affected (0.18 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM address_book;
+----+-----------+----------+---------+---------+-------------+--------+------------+------------+
| id | firstName | lastName | address | city    | state       | zip    | phone      | email      |
+----+-----------+----------+---------+---------+-------------+--------+------------+------------+
|  1 | Mary      | Dsouza   | #12B    | karnal  | abc         |    123 | 9876568739 | mary@123   |
|  2 | Mark      | Fernandz | #13C    | rajpura | punjab      | 140401 | 9829842819 | mark@321   |
|  3 | Albert    | Donal    | #234    | patiala | pb          |   1234 | 912949201  | albert@123 |
|  4 | Ravi      | Dubey    | #23B    | lucknow | UP          |   1234 | 7892819283 | ravi@dubey |
|  5 | Shreya    | Ghosal   | #234    | mumbai  | maharashtra |    345 | 8928392819 | shreay@23  |
+----+-----------+----------+---------+---------+-------------+--------+------------+------------+
5 rows in set (0.00 sec)

-- UC5

mysql> DELETE FROM address_book where firstName='Albert';
Query OK, 1 row affected (0.21 sec)

mysql> SELECT * FROM address_book;
+----+-----------+----------+---------+---------+-------------+--------+------------+------------+
| id | firstName | lastName | address | city    | state       | zip    | phone      | email      |
+----+-----------+----------+---------+---------+-------------+--------+------------+------------+
|  1 | Mary      | Dsouza   | #12B    | karnal  | abc         |    123 | 9876568739 | mary@123   |
|  2 | Mark      | Fernandz | #13C    | rajpura | punjab      | 140401 | 9829842819 | mark@321   |
|  4 | Ravi      | Dubey    | #23B    | lucknow | UP          |   1234 | 7892819283 | ravi@dubey |
|  5 | Shreya    | Ghosal   | #234    | mumbai  | maharashtra |    345 | 8928392819 | shreay@23  |
+----+-----------+----------+---------+---------+-------------+--------+------------+------------+
4 rows in set (0.00 sec)

-- UC6

mysql> SELECT firstName,lastName from address_book where city='rajpura' or state='UP';
+-----------+----------+
| firstName | lastName |
+-----------+----------+
| Mark      | Fernandz |
| Ravi      | Dubey    |
+-----------+----------+
2 rows in set (0.00 sec)

-- UC7

mysql> SELECT city,state,count(*) from address_book group by city,state;
+---------+-------------+----------+
| city    | state       | count(*) |
+---------+-------------+----------+
| karnal  | abc         |        1 |
| rajpura | punjab      |        1 |
| lucknow | UP          |        1 |
| mumbai  | maharashtra |        1 |
+---------+-------------+----------+
4 rows in set (0.02 sec)

-- UC8

mysql> update address_book set city='karnal' where firstName='Mark' or firstName='Ravi';
Query OK, 2 rows affected (0.21 sec)
Rows matched: 2  Changed: 2  Warnings: 0


mysql> SELECT firstName, lastName from address_book where city='karnal' order by firstName;
+-----------+----------+
| firstName | lastName |
+-----------+----------+
| Mark      | Fernandz |
| Mary      | Dsouza   |
| Ravi      | Dubey    |
+-----------+----------+
3 rows in set (0.03 sec)

-- UC9

mysql> ALTER TABLE address_book
    -> ADD COLUMN name VARCHAR(100),
    -> ADD COLUMN type VARCHAR(100);
Query OK, 0 rows affected (0.81 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM address_book;
+----+-----------+----------+---------+--------+-------------+--------+------------+------------+------+------+
| id | firstName | lastName | address | city   | state       | zip    | phone      | email      | name | type |
+----+-----------+----------+---------+--------+-------------+--------+------------+------------+------+------+
|  1 | Mary      | Dsouza   | #12B    | karnal | abc         |    123 | 9876568739 | mary@123   | NULL | NULL |
|  2 | Mark      | Fernandz | #13C    | karnal | punjab      | 140401 | 9829842819 | mark@321   | NULL | NULL |
|  4 | Ravi      | Dubey    | #23B    | karnal | UP          |   1234 | 7892819283 | ravi@dubey | NULL | NULL |
|  5 | Shreya    | Ghosal   | #234    | mumbai | maharashtra |    345 | 8928392819 | shreay@23  | NULL | NULL |
+----+-----------+----------+---------+--------+-------------+--------+------------+------------+------+------+
4 rows in set (0.00 sec)

mysql> update address_book set name='maryz contact',type='friend' where firstName='Mary';
Query OK, 1 row affected (0.34 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update address_book set name='markz contact',type='friend' where firstName='Mark';
Query OK, 1 row affected (0.11 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update address_book set name='raviz contact',type='family' where firstName='Ravi';
Query OK, 1 row affected (0.09 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update address_book set name='shreyaz contact',type='family' where firstName='Shreya';
Query OK, 1 row affected (7.31 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from address_book;
+----+-----------+----------+---------+--------+-------------+--------+------------+------------+-----------------+--------+
| id | firstName | lastName | address | city   | state       | zip    | phone      | email      | name            | type   |
+----+-----------+----------+---------+--------+-------------+--------+------------+------------+-----------------+--------+
|  1 | Mary      | Dsouza   | #12B    | karnal | abc         |    123 | 9876568739 | mary@123   | maryz contact   | friend |
|  2 | Mark      | Fernandz | #13C    | karnal | punjab      | 140401 | 9829842819 | mark@321   | markz contact   | friend |
|  4 | Ravi      | Dubey    | #23B    | karnal | UP          |   1234 | 7892819283 | ravi@dubey | raviz contact   | family |
|  5 | Shreya    | Ghosal   | #234    | mumbai | maharashtra |    345 | 8928392819 | shreay@23  | shreyaz contact | family |
+----+-----------+----------+---------+--------+-------------+--------+------------+------------+-----------------+--------+
4 rows in set (0.24 sec)

-- UC10

mysql> SELECT type,count(*) FROM address_book group by type;
+--------+----------+
| type   | count(*) |
+--------+----------+
| friend |        2 |
| family |        2 |
+--------+----------+
2 rows in set (0.00 sec)

-- UC11

mysql> INSERT INTO address_book
    -> (firstName,lastName,name,type) VALUES
    -> ('Mark','Fernandz','markz contact','family');
Query OK, 1 row affected (1.11 sec)

mysql> select * from address_book;
+----+-----------+----------+---------+--------+-------------+--------+------------+------------+-----------------+--------+
| id | firstName | lastName | address | city   | state       | zip    | phone      | email      | name            | type   |
+----+-----------+----------+---------+--------+-------------+--------+------------+------------+-----------------+--------+
|  1 | Mary      | Dsouza   | #12B    | karnal | abc         |    123 | 9876568739 | mary@123   | maryz contact   | friend |
|  2 | Mark      | Fernandz | #13C    | karnal | punjab      | 140401 | 9829842819 | mark@321   | markz contact   | friend |
|  4 | Ravi      | Dubey    | #23B    | karnal | UP          |   1234 | 7892819283 | ravi@dubey | raviz contact   | family |
|  5 | Shreya    | Ghosal   | #234    | mumbai | maharashtra |    345 | 8928392819 | shreay@23  | shreyaz contact | family |
|  6 | Mark      | Fernandz | NULL    | NULL   | NULL        |   NULL | NULL       | NULL       | markz contact   | family |
+----+-----------+----------+---------+--------+-------------+--------+------------+------------+-----------------+--------+
5 rows in set (0.00 sec)

mysql> INSERT INTO address_book
    -> (firstName,lastName,name,type) VALUES
    -> ('Shreya','Ghosal','shreyaz contact','friend');
Query OK, 1 row affected (0.59 sec)

mysql> select * from address_book;
+----+-----------+----------+---------+--------+-------------+--------+------------+------------+-----------------+--------+
| id | firstName | lastName | address | city   | state       | zip    | phone      | email      | name            | type   |
+----+-----------+----------+---------+--------+-------------+--------+------------+------------+-----------------+--------+
|  1 | Mary      | Dsouza   | #12B    | karnal | abc         |    123 | 9876568739 | mary@123   | maryz contact   | friend |
|  2 | Mark      | Fernandz | #13C    | karnal | punjab      | 140401 | 9829842819 | mark@321   | markz contact   | friend |
|  4 | Ravi      | Dubey    | #23B    | karnal | UP          |   1234 | 7892819283 | ravi@dubey | raviz contact   | family |
|  5 | Shreya    | Ghosal   | #234    | mumbai | maharashtra |    345 | 8928392819 | shreay@23  | shreyaz contact | family |
|  6 | Mark      | Fernandz | NULL    | NULL   | NULL        |   NULL | NULL       | NULL       | markz contact   | family |
|  7 | Shreya    | Ghosal   | NULL    | NULL   | NULL        |   NULL | NULL       | NULL       | shreyaz contact | friend |
+----+-----------+----------+---------+--------+-------------+--------+------------+------------+-----------------+--------+
6 rows in set (0.00 sec)