-- Enable readable output format
.mode columns
.headers on

-- Instructions for students:
-- 1. Open SQLite in terminal: sqlite3 university.db
-- 2. Load this script: .read example.sql
-- 3. Exit SQLite: .exit


-- write your sql code here

--SELECT name,COUNT(student_id) AS TotalStudents
--FROM
--Courses JOIN StudentCourses
--ON Courses.id=StudentCourses.course_id
--GROUP BY name HAVING TotalStudents<20;

/*
SELECT name, COUNT(student_id) AS TotalStudents
FROM
Courses LEFT JOIN StudentCourses
ON Courses.id=StudentCourses.course_id
GROUP BY name HAVING TotalStudents<20;
--*/
--Re-engineered zero-defect moderator has 0 students

/*
SELECT Courses.name as Course, Students.name as Student
FROM
Courses LEFT JOIN StudentCourses
ON Courses.id=StudentCourses.course_id RIGHT JOIN Students ON Students.id=StudentCourses.student_id
GROUP BY Courses.name;
*/

--SELECT Students.* FROM Students LEFT JOIN StudentCourses ON Students.id=StudentCourses.student_id ORDER BY Students.name;

--SELECT name as coursename, student_id as students from course left join studentcourse on Courses.id=student.id

SELECT Courses.name as Course, Students.name as Student
FROM StudentCourses RIGHT JOIN Courses ON Courses.id=StudentCourses.course_id
RIGHT JOIN Students ON Students.id=StudentCourses.student_id
;

--SELECT Courses.name as Course FROM Courses LEFT JOIN StudentCourses ON Courses.id=StudentCourses.course_id;