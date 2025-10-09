CREATE TABLE students (student_id INT PRIMARY KEY, student_name VARCHAR(50));
CREATE TABLE courses (
course_id INT PRIMARY KEY,
course_name VARCHAR(50),
student_id INT,
FOREIGN KEY (student_id) REFERENCES students (student_id)
);
INSERT INTO students (student_id, student_name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David');
INSERT INTO courses (course_id, course_name, student_id) VALUES
(101, 'Math', 1),
(102, 'Science', 2),
(103,'History',1),
(104,'Art',3);

-- EXISTS

SELECT * FROM students s 
WHERE EXISTS 
( SELECT student_name FROM courses c WHERE c.student_id = s.student_id);

-- NOT EXISTS

SELECT student_name FROM students
WHERE NOT EXISTS(
    SELECT student_name
	FROM courses
    WHERE courses.student_id = students.student_id);
SELECT * FROM STUDENTS WHERE EXISTS (SELECT * FROM COURSES);
SELECT * FROM students
WHERE EXISTS(
    SELECT *
	FROM courses
    WHERE courses.student_id = students.student_id);
SELECT * FROM MYEMP WHERE SALARY >ANY(SELECT AVG(SALARY) FROM MYEMP);
SELECT * FROM MYEMP AS X WHERE SALARY >ANY(
SELECT AVG(SALARY) FROM MYEMP AS Y WHERE X.DEP_ID=Y.DEP_ID GROUP BY DEP_ID);