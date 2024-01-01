use UniversityDB;
-- a. Breakdown by Department: Write a query to break down the enrollment by department.
SELECT
    d.DepartmentID,
    d.DepartmentName,
    COUNT(e.EnrollmentID) AS EnrollmentCount
FROM
    department d
LEFT JOIN
    student s ON d.DepartmentID = s.DepartmentID
LEFT JOIN
    enrollment e ON s.StudentID = e.StudentID
GROUP BY
    d.DepartmentID, d.DepartmentName;

-- b. Rollup by Year and Department:Write a query to roll up the enrollment by academic year and department.

-- SELECT 
--     e.AcademicYear, 
--     d.DepartmentName, 
--     COUNT(DISTINCT e.StudentID) AS EnrollmentCount
-- FROM enrollment e
-- JOIN student s ON e.StudentID = s.StudentID
-- JOIN department d ON s.DepartmentID = d.DepartmentID
-- GROUP BY e.AcademicYear, d.DepartmentName
-- ORDER BY e.AcademicYear, d.DepartmentName;

SELECT D.DepartmentName, YEAR(E.EnrollmentDate) AS AcademicYear, COUNT(E.EnrollmentID) AS EnrollmentCount
FROM Departments D
INNER JOIN Students S ON D.DepartmentID = S.DepartmentID
INNER JOIN Enrollments E ON S.StudentID = E.StudentID
GROUP BY ROLLUP (D.DepartmentName, YEAR(E.EnrollmentDate))
ORDER BY D.DepartmentName, AcademicYear;

--c. Cube by Course, Year, and Department:Write a query to crweate a cube of enrollment by course, academic year, and department.
-- SELECT 
--     c.CourseID, 
--     CourseName, 
--     AcademicYear, 
--     d.DepartmentID, 
--     DepartmentName,
--     COUNT(DISTINCT EnrollmentID) AS EnrollmentCount
-- FROM enrollment e
-- JOIN student s ON e.StudentID = s.StudentID
-- JOIN department d ON s.DepartmentID = d.DepartmentID
-- JOIN course c ON e.CourseID = c.CourseID
-- GROUP BY c.CourseID, CourseName, AcademicYear, d.DepartmentID, DepartmentName;


SELECT C.CourseName, D.DepartmentName, YEAR(E.EnrollmentDate) AS AcademicYear, COUNT(E.EnrollmentID) AS EnrollmentCount
FROM Courses C
INNER JOIN Enrollments E ON C.CourseID = E.CourseID
INNER JOIN Students S ON E.StudentID = S.StudentID
INNER JOIN Departments D ON S.DepartmentID = D.DepartmentID
GROUP BY CUBE (C.CourseName, D.DepartmentName, YEAR(E.EnrollmentDate))
ORDER BY C.CourseName, D.DepartmentName, AcademicYear;

