Enter password: ********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 11
Server version: 9.5.0 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| ab                 |
| company_db         |
| data_digger        |
| data_transformer   |
| information_schema |
| mysql              |
| performance_schema |
| rw8                |
| schooldb           |
| sys                |
| universitydb       |
| workforce_db       |
+--------------------+
12 rows in set (0.410 sec)

mysql> create database student_tracker;
Query OK, 1 row affected (0.143 sec)

mysql> use student_tracker;
Database changed
mysql> CREATE TABLE Students (
    ->     student_id INT AUTO_INCREMENT PRIMARY KEY,
    ->     name VARCHAR(100),
    ->     dob DATE,
    ->     gender ENUM('Male','Female','Other'),
    ->     email VARCHAR(100),
    ->     phone_number VARCHAR(15),
    ->     address VARCHAR(255),
    ->     admission_date DATE,
    ->     department_id INT
    -> );
Query OK, 0 rows affected (0.382 sec)

mysql> CREATE TABLE Faculty (
    ->     faculty_id INT AUTO_INCREMENT PRIMARY KEY,
    ->     name VARCHAR(100),
    ->     email VARCHAR(100),
    ->     phone_number VARCHAR(15),
    ->     department_id INT
    -> );
Query OK, 0 rows affected (0.172 sec)

mysql>
mysql> CREATE TABLE Departments (
    ->     department_id INT AUTO_INCREMENT PRIMARY KEY,
    ->     department_name VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.218 sec)

mysql> CREATE TABLE Courses (
    ->     course_id INT AUTO_INCREMENT PRIMARY KEY,
    ->     course_name VARCHAR(100),
    ->     faculty_id INT,
    ->     FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id)
    -> );
Query OK, 0 rows affected (0.481 sec)

mysql> CREATE TABLE Enrollments (
    ->     enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    ->     student_id INT,
    ->     course_id INT,
    ->     enrollment_date DATE,
    ->     UNIQUE(student_id, course_id),
    ->     FOREIGN KEY (student_id) REFERENCES Students(student_id),
    ->     FOREIGN KEY (course_id) REFERENCES Courses(course_id)
    -> );
Query OK, 0 rows affected (0.699 sec)

mysql> CREATE TABLE Attendance (
    ->     attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    ->     student_id INT,
    ->     course_id INT,
    ->     attendance_date DATE,
    ->     status ENUM('Present','Absent','Late'),
    ->     FOREIGN KEY (student_id) REFERENCES Students(student_id),
    ->     FOREIGN KEY (course_id) REFERENCES Courses(course_id)
    -> );
Query OK, 0 rows affected (0.528 sec)

mysql> CREATE TABLE Grades (
    ->     grade_id INT AUTO_INCREMENT PRIMARY KEY,
    ->     student_id INT,
    ->     course_id INT,
    ->     marks_obtained INT,
    ->     FOREIGN KEY (student_id) REFERENCES Students(student_id),
    ->     FOREIGN KEY (course_id) REFERENCES Courses(course_id)
    -> );
Query OK, 0 rows affected (0.472 sec)

mysql> INSERT INTO Departments (department_name) VALUES
    -> ('Computer Science'),
    -> ('Math'),
    -> ('English');
Query OK, 3 rows affected (0.110 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Faculty (name,email,phone_number,department_id) VALUES
    -> ('John Doe','john@uni.com','1234567890',1),
    -> ('Jane Smith','jane@uni.com','9876543210',2);
Query OK, 2 rows affected (0.056 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql>
mysql> INSERT INTO Students (name,dob,gender,email,phone_number,address,admission_date,department_id) VALUES
    -> ('Alice','2004-03-20','Female','alice@mail.com','1111111111','Street 1','2022-08-15',1),
    -> ('Bob','2005-01-10','Male','bob@mail.com','2222222222','Street 2','2023-01-10',1),
    -> ('Carl','2003-05-05','Male',NULL,'3333333333','Street 3','2021-07-20',2);
Query OK, 3 rows affected (0.075 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Courses (course_name, faculty_id) VALUES
    -> ('Database Systems',1),
    -> ('Calculus',2),
    -> ('English Lit',NULL)
    -> ;
Query OK, 3 rows affected (0.079 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Enrollments (student_id,course_id,enrollment_date) VALUES
    -> (1,1,'2023-09-01'),
    -> (1,2,'2023-09-01'),
    -> (2,1,'2023-09-01');
Query OK, 3 rows affected (0.088 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Attendance (student_id,course_id,attendance_date,status) VALUES
    -> (1,1,'2023-09-01','Present'),
    -> (1,2,'2023-09-01','Absent'),
    -> (2,1,'2023-09-01','Present');
Query OK, 3 rows affected (0.070 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Grades (student_id,course_id,marks_obtained) VALUES
    -> (1,1,95),
    -> (1,2,88),
    -> (2,1,72);
Query OK, 3 rows affected (0.070 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Students(name,dob,gender,email) VALUES('Diana','2004-10-12','Female','diana@mail.com');
Query OK, 1 row affected (0.034 sec)

mysql> SELECT* FROM Students;
+------------+-------+------------+--------+----------------+--------------+----------+----------------+---------------+
| student_id | name  | dob        | gender | email          | phone_number | address  | admission_date | department_id |
+------------+-------+------------+--------+----------------+--------------+----------+----------------+---------------+
|          1 | Alice | 2004-03-20 | Female | alice@mail.com | 1111111111   | Street 1 | 2022-08-15     |             1 |
|          2 | Bob   | 2005-01-10 | Male   | bob@mail.com   | 2222222222   | Street 2 | 2023-01-10     |             1 |
|          3 | Carl  | 2003-05-05 | Male   | NULL           | 3333333333   | Street 3 | 2021-07-20     |             2 |
|          4 | Diana | 2004-10-12 | Female | diana@mail.com | NULL         | NULL     | NULL           |          NULL |
+------------+-------+------------+--------+----------------+--------------+----------+----------------+---------------+
4 rows in set (0.010 sec)

mysql> SELECT* FROM Faculty;
+------------+------------+--------------+--------------+---------------+
| faculty_id | name       | email        | phone_number | department_id |
+------------+------------+--------------+--------------+---------------+
|          1 | John Doe   | john@uni.com | 1234567890   |             1 |
|          2 | Jane Smith | jane@uni.com | 9876543210   |             2 |
+------------+------------+--------------+--------------+---------------+
2 rows in set (0.007 sec)

mysql> SELECT* FROM Departments;
+---------------+------------------+
| department_id | department_name  |
+---------------+------------------+
|             1 | Computer Science |
|             2 | Math             |
|             3 | English          |
+---------------+------------------+
3 rows in set (0.008 sec)

mysql> SELECT* FROM Courses;
+-----------+------------------+------------+
| course_id | course_name      | faculty_id |
+-----------+------------------+------------+
|         1 | Database Systems |          1 |
|         2 | Calculus         |          2 |
|         3 | English Lit      |       NULL |
+-----------+------------------+------------+
3 rows in set (0.008 sec)

mysql> SELECT* FROM Enrollments;
+---------------+------------+-----------+-----------------+
| enrollment_id | student_id | course_id | enrollment_date |
+---------------+------------+-----------+-----------------+
|             1 |          1 |         1 | 2023-09-01      |
|             2 |          1 |         2 | 2023-09-01      |
|             3 |          2 |         1 | 2023-09-01      |
+---------------+------------+-----------+-----------------+
3 rows in set (0.018 sec)

mysql> SELECT* FROM Attendance;
+---------------+------------+-----------+-----------------+---------+
| attendance_id | student_id | course_id | attendance_date | status  |
+---------------+------------+-----------+-----------------+---------+
|             1 |          1 |         1 | 2023-09-01      | Present |
|             2 |          1 |         2 | 2023-09-01      | Absent  |
|             3 |          2 |         1 | 2023-09-01      | Present |
+---------------+------------+-----------+-----------------+---------+
3 rows in set (0.023 sec)

mysql> SELECT* FROM Grades;
+----------+------------+-----------+----------------+
| grade_id | student_id | course_id | marks_obtained |
+----------+------------+-----------+----------------+
|        1 |          1 |         1 |             95 |
|        2 |          1 |         2 |             88 |
|        3 |          2 |         1 |             72 |
+----------+------------+-----------+----------------+
3 rows in set (0.009 sec)

mysql> INSERT INTO Students(name,dob,gender,email) VALUES('Diana','2004-10-12','Female','diana@mail.com');
Query OK, 1 row affected (0.039 sec)

mysql> UPDATE Students SET phone_number='9999999999' WHERE student_id=1;
Query OK, 1 row affected (0.042 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> DELETE FROM Students WHERE student_id=3;
Query OK, 1 row affected (0.049 sec)

mysql> SELECT * FROM Courses;
+-----------+------------------+------------+
| course_id | course_name      | faculty_id |
+-----------+------------------+------------+
|         1 | Database Systems |          1 |
|         2 | Calculus         |          2 |
|         3 | English Lit      |       NULL |
+-----------+------------------+------------+
3 rows in set (0.010 sec)

mysql> -- Students in Computer Science
Query OK, 0 rows affected (0.003 sec)

mysql> SELECT * FROM Students
    -> WHERE department_id = 1;
+------------+-------+------------+--------+----------------+--------------+----------+----------------+---------------+
| student_id | name  | dob        | gender | email          | phone_number | address  | admission_date | department_id |
+------------+-------+------------+--------+----------------+--------------+----------+----------------+---------------+
|          1 | Alice | 2004-03-20 | Female | alice@mail.com | 9999999999   | Street 1 | 2022-08-15     |             1 |
|          2 | Bob   | 2005-01-10 | Male   | bob@mail.com   | 2222222222   | Street 2 | 2023-01-10     |             1 |
+------------+-------+------------+--------+----------------+--------------+----------+----------------+---------------+
2 rows in set (0.003 sec)

mysql>
mysql> -- Top 10 highest scoring
Query OK, 0 rows affected (0.002 sec)

mysql> SELECT * FROM Grades
    -> ORDER BY marks_obtained DESC
    -> LIMIT 10;
+----------+------------+-----------+----------------+
| grade_id | student_id | course_id | marks_obtained |
+----------+------------+-----------+----------------+
|        1 |          1 |         1 |             95 |
|        2 |          1 |         2 |             88 |
|        3 |          2 |         1 |             72 |
+----------+------------+-----------+----------------+
3 rows in set (0.011 sec)

mysql>
mysql> -- Students with attendance < 75%
Query OK, 0 rows affected (0.004 sec)

mysql> SELECT student_id,
    -> ROUND( (SUM(status='Present')/COUNT(*))*100 ,2) AS attendance_pct
    -> FROM Attendance
    -> GROUP BY student_id
    -> HAVING attendance_pct<75;
+------------+----------------+
| student_id | attendance_pct |
+------------+----------------+
|          1 |          50.00 |
+------------+----------------+
1 row in set (0.051 sec)

mysql> SELECT s.student_id FROM Students s
    -> JOIN Attendance a ON s.student_id=a.student_id
    -> JOIN Grades g ON s.student_id=g.student_id
    -> GROUP BY s.student_id
    -> HAVING SUM(a.status='Present')/COUNT(*)<0.50
    -> AND AVG(g.marks_obtained)<40;
Empty set (0.042 sec)

mysql> SELECT student_id FROM Grades
    -> WHERE marks_obtained>90
    -> UNION
    -> SELECT student_id FROM (
    ->     SELECT student_id, SUM(status='Present')/COUNT(*) perfection
    ->     FROM Attendance
    ->     GROUP BY student_id
    ->     HAVING perfection=1
    -> ) t;
+------------+
| student_id |
+------------+
|          1 |
|          2 |
+------------+
2 rows in set (0.026 sec)

mysql> SELECT * FROM Faculty
    -> WHERE faculty_id NOT IN (SELECT faculty_id FROM Courses);
Empty set (0.019 sec)

mysql> SELECT * FROM Students ORDER BY name;
+------------+-------+------------+--------+----------------+--------------+----------+----------------+---------------+
| student_id | name  | dob        | gender | email          | phone_number | address  | admission_date | department_id |
+------------+-------+------------+--------+----------------+--------------+----------+----------------+---------------+
|          1 | Alice | 2004-03-20 | Female | alice@mail.com | 9999999999   | Street 1 | 2022-08-15     |             1 |
|          2 | Bob   | 2005-01-10 | Male   | bob@mail.com   | 2222222222   | Street 2 | 2023-01-10     |             1 |
|          4 | Diana | 2004-10-12 | Female | diana@mail.com | NULL         | NULL     | NULL           |          NULL |
|          5 | Diana | 2004-10-12 | Female | diana@mail.com | NULL         | NULL     | NULL           |          NULL |
+------------+-------+------------+--------+----------------+--------------+----------+----------------+---------------+
4 rows in set (0.013 sec)

mysql> SELECT department_id, COUNT(*) FROM Students GROUP BY department_id;
+---------------+----------+
| department_id | COUNT(*) |
+---------------+----------+
|             1 |        2 |
|          NULL |        2 |
+---------------+----------+
2 rows in set (0.008 sec)

mysql> SELECT course_id, AVG(marks_obtained) FROM Grades GROUP BY course_id;
+-----------+---------------------+
| course_id | AVG(marks_obtained) |
+-----------+---------------------+
|         1 |             83.5000 |
|         2 |             88.0000 |
+-----------+---------------------+
2 rows in set (0.007 sec)

mysql> SELECT AVG(present_pct) FROM (
    ->   SELECT student_id,
    ->   ROUND((SUM(status='Present')/COUNT(*))*100,2) present_pct
    ->   FROM Attendance GROUP BY student_id
    -> ) t;
+------------------+
| AVG(present_pct) |
+------------------+
|        75.000000 |
+------------------+
1 row in set (0.012 sec)

mysql> SELECT course_id, MAX(marks_obtained), MIN(marks_obtained) FROM Grades GROUP BY course_id;
+-----------+---------------------+---------------------+
| course_id | MAX(marks_obtained) | MIN(marks_obtained) |
+-----------+---------------------+---------------------+
|         1 |                  95 |                  72 |
|         2 |                  88 |                  88 |
+-----------+---------------------+---------------------+
2 rows in set (0.012 sec)

mysql> SELECT department_id, COUNT(*) FROM Students GROUP BY department_id;
+---------------+----------+
| department_id | COUNT(*) |
+---------------+----------+
|             1 |        2 |
|          NULL |        2 |
+---------------+----------+
2 rows in set (0.009 sec)

mysql> SELECT s.name, d.department_name
    -> FROM Students s
    -> JOIN Departments d ON s.department_id=d.department_id;
+-------+------------------+
| name  | department_name  |
+-------+------------------+
| Alice | Computer Science |
| Bob   | Computer Science |
+-------+------------------+
2 rows in set (0.011 sec)

mysql> SELECT s.* FROM Students s
    -> LEFT JOIN Enrollments e ON s.student_id=e.student_id
    -> WHERE e.student_id IS NULL;
+------------+-------+------------+--------+----------------+--------------+---------+----------------+---------------+
| student_id | name  | dob        | gender | email          | phone_number | address | admission_date | department_id |
+------------+-------+------------+--------+----------------+--------------+---------+----------------+---------------+
|          4 | Diana | 2004-10-12 | Female | diana@mail.com | NULL         | NULL    | NULL           |          NULL |
|          5 | Diana | 2004-10-12 | Female | diana@mail.com | NULL         | NULL    | NULL           |          NULL |
+------------+-------+------------+--------+----------------+--------------+---------+----------------+---------------+
2 rows in set (0.010 sec)

mysql> SELECT c.* FROM Faculty f
    -> RIGHT JOIN Courses c ON c.faculty_id=f.faculty_id
    -> WHERE f.faculty_id IS NULL;
+-----------+-------------+------------+
| course_id | course_name | faculty_id |
+-----------+-------------+------------+
|         3 | English Lit |       NULL |
+-----------+-------------+------------+
1 row in set (0.010 sec)

mysql> SELECT COALESCE(s.student_id,g.student_id) AS student_id
    -> FROM Students s
    -> LEFT JOIN Grades g ON s.student_id=g.student_id
    -> WHERE g.student_id IS NULL;
+------------+
| student_id |
+------------+
|          4 |
|          5 |
+------------+
2 rows in set (0.018 sec)

mysql> SELECT student_id FROM Grades g1
    -> WHERE marks_obtained > (
    ->   SELECT AVG(marks_obtained) FROM Grades WHERE course_id=g1.course_id
    -> );
+------------+
| student_id |
+------------+
|          1 |
+------------+
1 row in set (0.017 sec)

mysql> SELECT course_name FROM Courses
    -> WHERE faculty_id IN (
    ->   SELECT faculty_id FROM Faculty WHERE years_experience>=5
    -> );
ERROR 1054 (42S22): Unknown column 'years_experience' in 'where clause'
mysql>
mysql> SELECT student_id FROM (
    ->   SELECT student_id, SUM(status='Absent') AS absences
    ->   FROM Attendance GROUP BY student_id
    -> ) t WHERE absences>10;
Empty set (0.009 sec)

mysql> SELECT student_id FROM (
    ->   SELECT student_id, SUM(status='Absent') AS absences
    ->   FROM Attendance GROUP BY student_id
    -> ) t WHERE absences>10;
Empty set (0.013 sec)

mysql> SELECT MONTH(attendance_date) AS month,
    -> COUNT(*) FROM Attendance GROUP BY month;
+-------+----------+
| month | COUNT(*) |
+-------+----------+
|     9 |        3 |
+-------+----------+
1 row in set (0.018 sec)

mysql> SELECT student_id,
    -> TIMESTAMPDIFF(YEAR,admission_date,CURDATE()) AS years_enrolled
    -> FROM Students;
+------------+----------------+
| student_id | years_enrolled |
+------------+----------------+
|          1 |              3 |
|          2 |              3 |
|          4 |           NULL |
|          5 |           NULL |
+------------+----------------+
4 rows in set (0.012 sec)

mysql> SELECT DATE_FORMAT(attendance_date,'%d-%m-%Y') AS formatted FROM Attendance;
+------------+
| formatted  |
+------------+
| 01-09-2023 |
| 01-09-2023 |
| 01-09-2023 |
+------------+
3 rows in set (0.018 sec)

mysql> SELECT UPPER(name) FROM Faculty;
+-------------+
| UPPER(name) |
+-------------+
| JOHN DOE    |
| JANE SMITH  |
+-------------+
2 rows in set (0.018 sec)

mysql> SELECT TRIM(name) FROM Students;
+------------+
| TRIM(name) |
+------------+
| Alice      |
| Bob        |
| Diana      |
| Diana      |
+------------+
4 rows in set (0.006 sec)

mysql> SELECT IFNULL(email,'Email Not Provided') FROM Students;
+------------------------------------+
| IFNULL(email,'Email Not Provided') |
+------------------------------------+
| alice@mail.com                     |
| bob@mail.com                       |
| diana@mail.com                     |
| diana@mail.com                     |
+------------------------------------+
4 rows in set (0.012 sec)

mysql> -- Performance levels
Query OK, 0 rows affected (0.002 sec)

mysql> SELECT student_id, marks_obtained,
    -> CASE
    ->     WHEN marks_obtained >90 THEN 'Excellent'
    ->     WHEN marks_obtained BETWEEN 75 AND 90 THEN 'Good'
    ->     ELSE 'Needs Improvement'
    -> END AS performance
    -> FROM Grades;
+------------+----------------+-------------------+
| student_id | marks_obtained | performance       |
+------------+----------------+-------------------+
|          1 |             95 | Excellent         |
|          1 |             88 | Good              |
|          2 |             72 | Needs Improvement |
+------------+----------------+-------------------+
3 rows in set (0.004 sec)

mysql>
mysql> -- Attendance categories
Query OK, 0 rows affected (0.002 sec)

mysql> SELECT student_id,
    -> ROUND((SUM(status='Present')/COUNT(*))*100,2) pct,
    -> CASE
    ->   WHEN ROUND((SUM(status='Present')/COUNT(*))*100,2)>80 THEN 'Regular'
    ->   WHEN ROUND((SUM(status='Present')/COUNT(*))*100,2) BETWEEN 50 AND 80 THEN 'Irregular'
    ->   ELSE 'Defaulter'
    -> END AS category
    -> FROM Attendance
    -> GROUP BY student_id;
+------------+--------+-----------+
| student_id | pct    | category  |
+------------+--------+-----------+
|          1 |  50.00 | Irregular |
|          2 | 100.00 | Regular   |
+------------+--------+-----------+
2 rows in set (0.005 sec)

mysql>
mysql> -- Rank students by total marks
Query OK, 0 rows affected (0.004 sec)

mysql> SELECT student_id, SUM(marks_obtained) total,
    -> RANK() OVER (ORDER BY SUM(marks_obtained) DESC) rank
    -> FROM Grades
    -> GROUP BY student_id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'rank
FROM Grades
GROUP BY student_id' at line 2
mysql>
mysql> -- Cumulative attendance % per course
Query OK, 0 rows affected (0.001 sec)

mysql> SELECT student_id,
    -> attendance_date,
    -> status,
    -> SUM(status='Present') OVER (PARTITION BY course_id ORDER BY attendance_date)
    -> AS cum_present
    -> FROM Attendance;
+------------+-----------------+---------+-------------+
| student_id | attendance_date | status  | cum_present |
+------------+-----------------+---------+-------------+
|          1 | 2023-09-01      | Present |           2 |
|          2 | 2023-09-01      | Present |           2 |
|          1 | 2023-09-01      | Absent  |           0 |
+------------+-----------------+---------+-------------+
3 rows in set (0.035 sec)

mysql>
mysql> -- Running total of enrollments per month
Query OK, 0 rows affected (0.003 sec)

mysql> SELECT MONTH(enrollment_date) m,
    -> COUNT(*) OVER (ORDER BY MONTH(enrollment_date))
    -> AS running_total
    -> FROM Enrollments;
+------+---------------+
| m    | running_total |
+------+---------------+
|    9 |             3 |
|    9 |             3 |
|    9 |             3 |
+------+---------------+
3 rows in set (0.006 sec)

mysql>