/** -------- UC1 -----------**/

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (42.05 sec)

mysql> create database payroll_service;
Query OK, 1 row affected (5.56 sec)

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
5 rows in set (0.00 sec)

mysql> use payroll_service;
Database changed

/** -------- UC2 -----------**/

mysql> create table employee_payroll(
    -> id int NOT NULL auto_increment,
    -> name varchar(100) NOT NULL,
    -> salary int NOT NULL,
    -> start date,
    -> primary key(id)
    -> );
Query OK, 0 rows affected (8.51 sec)

mysql> desc employee_payroll;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int          | NO   | PRI | NULL    | auto_increment |
| name   | varchar(100) | NO   |     | NULL    |                |
| salary | int          | NO   |     | NULL    |                |
| start  | date         | YES  |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
4 rows in set (0.30 sec)

/** -------- UC3 -----------**/

mysql> INSERT INTO employee_payroll
    -> (name,salary,start) VALUES
    -> ('Bill',1000000,'2021-07-09');
Query OK, 1 row affected (0.35 sec)

mysql> INSERT INTO employee_payroll
    -> (name,salary,start) VALUES
    -> ('Mark',1200000,'2021-07-09'),('David',2200000,'2021-07-02'),('John',5000000,'2021-04-06');
Query OK, 3 rows affected (0.10 sec)
Records: 3  Duplicates: 0  Warnings: 0

/** -------- UC4 -----------**/

mysql> SELECT * FROM employee_payroll;
+----+-------+---------+------------+
| id | name  | salary  | start      |
+----+-------+---------+------------+
|  1 | Bill  | 1000000 | 2021-07-09 |
|  2 | Mark  | 1200000 | 2021-07-09 |
|  3 | David | 2200000 | 2021-07-02 |
|  4 | John  | 5000000 | 2021-04-06 |
+----+-------+---------+------------+
4 rows in set (0.00 sec)

/** -------- UC5 -----------**/

mysql> SELECT salary FROM employee_payroll where name='Bill';
+---------+
| salary  |
+---------+
| 1000000 |
+---------+
1 row in set (0.19 sec)

mysql> SELECT name from employee_payroll where start between CAST('2018-01-01' AS DATE) AND DATE(NOW());
+-------+
| name  |
+-------+
| Bill  |
| Mark  |
| David |
| John  |
+-------+
4 rows in set (0.14 sec)

/** -------- UC6 -----------**/

mysql> ALTER TABLE employee_payroll add gender CHAR(1) AFTER name;
Query OK, 0 rows affected (2.42 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> UPDATE employee_payroll set gender='M' where name='Mark' or name='John';
Query OK, 2 rows affected (0.22 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> SELECT * FROM employee_payroll;
+----+-------+--------+---------+------------+
| id | name  | gender | salary  | start      |
+----+-------+--------+---------+------------+
|  1 | Bill  | NULL   | 1000000 | 2021-07-09 |
|  2 | Mark  | M      | 1200000 | 2021-07-09 |
|  3 | David | NULL   | 2200000 | 2021-07-02 |
|  4 | John  | M      | 5000000 | 2021-04-06 |
+----+-------+--------+---------+------------+
4 rows in set (0.00 sec)
mysql> Update employee_payroll set name = 'Betty' where id = 3;
Query OK, 1 row affected (0.11 sec)
Rows matched: 1  Changed: 1  Warnings: 0
mysql> Update employee_payroll set gender='F' where name='Bill' or name='Betty';
Query OK, 2 rows affected (0.10 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> SELECT * FROM employee_payroll;
+----+-------+--------+---------+------------+
| id | name  | gender | salary  | start      |
+----+-------+--------+---------+------------+
|  1 | Bill  | F      | 1000000 | 2021-07-09 |
|  2 | Mark  | M      | 1200000 | 2021-07-09 |
|  3 | Betty | F      | 2200000 | 2021-07-02 |
|  4 | John  | M      | 5000000 | 2021-04-06 |
+----+-------+--------+---------+------------+
4 rows in set (0.00 sec)

/** -------- UC7 -----------**/

mysql> SELECT SUM(salary) from employee_payroll where gender='F' group by gender;
+-------------+
| SUM(salary) |
+-------------+
|     3200000 |
+-------------+
1 row in set (3.76 sec)

mysql> SELECT AVG(salary) from employee_payroll where gender='F' group by gender;
+--------------+
| AVG(salary)  |
+--------------+
| 1600000.0000 |
+--------------+
1 row in set (0.23 sec)

mysql> SELECT MAX(salary) from employee_payroll where gender='F' group by gender;
+-------------+
| MAX(salary) |
+-------------+
|     2200000 |
+-------------+
1 row in set (0.59 sec)

mysql> SELECT COUNT(salary) from employee_payroll where gender='F' group by gender;
+---------------+
| COUNT(salary) |
+---------------+
|             2 |
+---------------+
1 row in set (0.08 sec)

mysql> SELECT MIN(salary) from employee_payroll where gender='F' group by gender;
+-------------+
| MIN(salary) |
+-------------+
|     1000000 |
+-------------+
1 row in set (0.07 sec)

/** -------- UC8 -----------**/

mysql> ALTER TABLE employee_payroll
    -> ADD COLUMN phone VARCHAR(20),
    -> ADD COLUMN address VARCHAR(100) DEFAULT '#12',
    -> ADD COLUMN department VARCHAR(20) NOT NULL;
Query OK, 0 rows affected (8.40 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM employee_payroll;
+----+-------+--------+---------+------------+-------+---------+------------+
| id | name  | gender | salary  | start      | phone | address | department |
+----+-------+--------+---------+------------+-------+---------+------------+
|  1 | Bill  | F      | 1000000 | 2021-07-09 | NULL  | #12     |            |
|  2 | Mark  | M      | 1200000 | 2021-07-09 | NULL  | #12     |            |
|  3 | Betty | F      | 2200000 | 2021-07-02 | NULL  | #12     |            |
|  4 | John  | M      | 5000000 | 2021-04-06 | NULL  | #12     |            |
+----+-------+--------+---------+------------+-------+---------+------------+
4 rows in set (0.00 sec)

/** -------- UC9 -----------**/

mysql> ALTER TABLE employee_payroll RENAME COLUMN salary TO basic_pay;
Query OK, 0 rows affected (0.22 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE employee_payroll ADD deductions Double NOT NULL AFTER basic_pay;
Query OK, 0 rows affected (0.53 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE employee_payroll ADD taxable_pay Double NOT NULL AFTER deductions;
Query OK, 0 rows affected (5.20 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE employee_payroll ADD tax Double NOT NULL AFTER taxable_pay;
Query OK, 0 rows affected (0.30 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE employee_payroll ADD net_pay Double NOT NULL AFTER tax;
Query OK, 0 rows affected (6.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employee_payroll;
+----+-------+--------+-----------+------------+-------------+-----+---------+------------+-------+---------+------------+
| id | name  | gender | basic_pay | deductions | taxable_pay | tax | net_pay | start      | phone | address | department |
+----+-------+--------+-----------+------------+-------------+-----+---------+------------+-------+---------+------------+
|  1 | Bill  | F      |   1000000 |          0 |           0 |   0 |       0 | 2021-07-09 | NULL  | #12     |            |
|  2 | Mark  | M      |   1200000 |          0 |           0 |   0 |       0 | 2021-07-09 | NULL  | #12     |            |
|  3 | Betty | F      |   2200000 |          0 |           0 |   0 |       0 | 2021-07-02 | NULL  | #12     |            |
|  4 | John  | M      |   5000000 |          0 |           0 |   0 |       0 | 2021-04-06 | NULL  | #12     |            |
+----+-------+--------+-----------+------------+-------------+-----+---------+------------+-------+---------+------------+
4 rows in set (0.00 sec)

/** -------- UC10 -----------**/


mysql> INSERT INTO employee_payroll
    -> (name, department, gender, basic_pay, deductions, taxable_pay, tax, net_pay, start) VALUES
    -> ('Terisa', 'Marketting', 'F', 3000000.00, 1000000.00, 2000000.00, 500000.00, 1500000.00, '2018-01-03' );
Query OK, 1 row affected (0.12 sec)

mysql> select * from employee_payroll;
+----+--------+--------+-----------+------------+-------------+--------+---------+------------+-------+---------+------------+
| id | name   | gender | basic_pay | deductions | taxable_pay | tax    | net_pay | start      | phone | address | department |
+----+--------+--------+-----------+------------+-------------+--------+---------+------------+-------+---------+------------+
|  1 | Bill   | F      |   1000000 |          0 |           0 |      0 |       0 | 2021-07-09 | NULL  | #12     |            |
|  2 | Mark   | M      |   1200000 |          0 |           0 |      0 |       0 | 2021-07-09 | NULL  | #12     |            |
|  3 | Betty  | F      |   2200000 |          0 |           0 |      0 |       0 | 2021-07-02 | NULL  | #12     |            |
|  4 | John   | M      |   5000000 |          0 |           0 |      0 |       0 | 2021-04-06 | NULL  | #12     |            |
|  5 | Terisa | F      |   3000000 |    1000000 |     2000000 | 500000 | 1500000 | 2018-01-03 | NULL  | #12     | Marketting |
+----+--------+--------+-----------+------------+-------------+--------+---------+------------+-------+---------+------------+
5 rows in set (0.00 sec)

mysql> INSERT INTO employee_payroll
    -> (name,gender,basic_pay,deductions,taxable_pay,tax,net_pay,department) VALUES
    -> ('Terisa','F',3000000,0,0,0,0,'Sales');
Query OK, 1 row affected (0.12 sec)

mysql> select * from employee_payroll;
+----+--------+--------+-----------+------------+-------------+--------+---------+------------+-------+---------+------------+
| id | name   | gender | basic_pay | deductions | taxable_pay | tax    | net_pay | start      | phone | address | department |
+----+--------+--------+-----------+------------+-------------+--------+---------+------------+-------+---------+------------+
|  1 | Bill   | F      |   1000000 |          0 |           0 |      0 |       0 | 2021-07-09 | NULL  | #12     |            |
|  2 | Mark   | M      |   1200000 |          0 |           0 |      0 |       0 | 2021-07-09 | NULL  | #12     |            |
|  3 | Betty  | F      |   2200000 |          0 |           0 |      0 |       0 | 2021-07-02 | NULL  | #12     |            |
|  4 | John   | M      |   5000000 |          0 |           0 |      0 |       0 | 2021-04-06 | NULL  | #12     |            |
|  5 | Terisa | F      |   3000000 |    1000000 |     2000000 | 500000 | 1500000 | 2018-01-03 | NULL  | #12     | Marketting |
|  6 | Terisa | F      |   3000000 |          0 |           0 |      0 |       0 | NULL       | NULL  | #12     | Sales      |
+----+--------+--------+-----------+------------+-------------+--------+---------+------------+-------+---------+------------+
6 rows in set (0.00 sec)