
USE StudentsDB;
select * from courses;
select * from enrollments;
select * from students;

/*DAY 5: SQL CODING CHALLENGE –JOINS & BUILDIN FUNTION
Database: School database
Question 1 – INNER JOIN
Scenario:
Show students with their enrolled course names.
Task:
Write a query joining Students and Courses through Enrollments.
Expected Output:
Only students who have valid enrollments (common in both tables).
*/
SELECT 
    s.StudentID,
    s.StudentName,
    c.CourseName,
    e.EnrollmentDate
FROM Students s
INNER JOIN Enrollments e
    ON s.StudentID = e.StudentID
INNER JOIN Courses c
    ON e.CourseID = c.CourseID;
/*Question 2 – LEFT JOIN and RIGHT JOIN
Scenario:
List all students and their courses, including those without matches.
Task:
Use both LEFT JOIN and RIGHT JOIN between Students and Enrollments.
Expected Output:
All students/courses are shown, with NULL where no match exists.
*/
SELECT
    s.StudentID,
    s.StudentName,
    c.CourseName
FROM Students s
LEFT JOIN Enrollments e
    ON s.StudentID = e.StudentID
LEFT JOIN Courses c
    ON e.CourseID = c.CourseID;
    
 -- right join   
    SELECT
    s.StudentID,
    s.StudentName,
    c.CourseName
FROM Students s
RIGHT JOIN Enrollments e
    ON s.StudentID = e.StudentID
RIGHT JOIN Courses c
    ON e.CourseID = c.CourseID;
    
/*Question 3 – ROUND()
Scenario:
While preparing numeric reports, analysts need to round off decimal values.
Task:
Round the value 123.4567 to two decimal places using the ROUND() function.
Expected Output:
Display a single column showing 123.46.
*/
SELECT ROUND(123.4567, 2) AS Rounded_Value;


SELECT
    ABS(-25) AS Absolute_Value,
    MOD(25, 4) AS Remainder;
    
   /* Question 5 – CONCAT()
Scenario:
The placement cell wants a full description combining each student’s name and city.
Task:
Use CONCAT() to merge StudentName and City into one column like
“Aarav from Chennai.”
Expected Output:
Full_Description showing combined values.*/

SELECT CONCAT(StudentName, ' from ', City, '.') AS Full_Description
FROM Students;

SELECT StudentName,
       LENGTH(StudentName) AS Name_Length
FROM Students;

SELECT CourseName,
       REPLACE(CourseName, 'SQL', 'Database') AS Updated_CourseName
FROM Courses;

SELECT StudentName,
       SUBSTRING(StudentName, 1, 3) AS Code_Prefix
FROM Students;

SELECT StudentName,
       UPPER(StudentName) AS UPPER_Name,
       LOWER(StudentName) AS LOWER_Name
FROM Students;

/*Question 10 – DATE FUNCTIONS (NOW, DATEDIFF, DATE_ADD)
Scenario:
The enrollment team needs to calculate report time, duration, and follow-up dates.
Task:
1.	Use NOW() to display the current date and time.
2.	Use DATEDIFF() to find the number of days between '2025-06-01' and '2025-05-10'.
3.	Use DATE_ADD() to add 10 days to each student’s EnrollmentDate.
Expected Output:
StudentName | EnrollmentDate | FollowUp_Date | Days_Difference | Current_DateTime
*/

SELECT 
    s.StudentName,
    e.EnrollmentDate,
    DATE_ADD(e.EnrollmentDate, INTERVAL 10 DAY) AS FollowUp_Date,
    DATEDIFF('2025-06-01', '2025-05-10') AS Days_Difference,
    NOW() AS Current_DateTime
FROM Students s
JOIN Enrollments e
    ON s.StudentID = e.StudentID;