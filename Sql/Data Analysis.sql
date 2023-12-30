use UniversityDB;
--a. Count of Students by Department:

SELECT d.DepartmentName, COUNT(s.StudentID) AS StudentCount
FROM department d
JOIN student s ON s.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;



--b. Total Enrollment by Year:
SELECT 
    AcademicYear,
    COUNT(DISTINCT EnrollmentID) AS total_enrollment
FROM 
    enrollment
GROUP BY 
    AcademicYear;


--c. Average GPA by Course:
SELECT
    c.CourseID,
    c.CourseName,
    AVG(e.GPA) AS Average_Gpa
FROM 
    enrollment e
    INNER JOIN course c ON e.CourseID = c.CourseID
GROUP BY 
    c.CourseID, c.CourseName;

