# University Database Analysis Project

## Table of Contents

- [University Database Analysis Project](#university-database-analysis-project)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Tasks](#tasks)
- [Database Creation or Restoration](#database-creation-or-restoration)
- [**Data Analysis**](#data-analysis)
- [**Query Operations (Breakdown, Rollup, Cube)**](#query-operations-breakdown-rollup-cube)
- [**Result Reports with Charts or Graphs**](#result-reports-with-charts-or-graphs)

## Overview
* This project evaluates your proficiency in SQL, database creation, restoration, data analysis, and result reporting.
* You have the flexibility to choose any database for analysis.
* Examples and tasks are based on a hypothetical database named "UniversityDB."

## Tasks

# Database Creation or Restoration
  * Create a new database or restore an existing one.
  * Insert dummy data into it.

# **Data Analysis**
  * Write SQL queries to answer:
    - Count of students by department
      ```sql
      --a.Count of Students by Department:
      SELECT d.DepartmentName, COUNT(s.StudentID) AS StudentCount
      FROM department d
      JOIN student s ON s.DepartmentID = d.DepartmentID
      GROUP BY d.DepartmentName;
      ```
      **Output:**
      ```
      DepartmentName	StudentName
        Art	                2
        Computer Science	  2
        Engineering	        2
        Mathematics	        2
        Music	              2
        Physics	            2

      ```

    - **Total enrollment by year**
      ```sql
      --b. Total Enrollment by Year:
      SELECT AcademicYear, COUNT(DISTINCT EnrollmentID) AS total_enrollment
      FROM enrollment
      GROUP BY AcademicYear;
      ```
      **Output:**
      ```
      AcademicYear	Total_Enroliment
        2021-2022	       3
        2022-2023	       9

      ```

    - **Average GPA by course**
      ```sql
      --c. Average GPA by Course:
      SELECT CourseID, AVG(GPA) AS Average_Gpa
      FROM enrollment
      GROUP BY CourseID;
      ```
      **Output:**
      ```sql
        CourseId	CourseName	           AvgGpa
            1	Database Management	        3.8
            2	Statistics	                4
            3	Organic Chemistry	          3.5
            4	Cell Biology	              3.9
            5	Medieval History	          3.7
            6	Shakespearean Literature    3.2
            7	Microeconomics	            4
            8	Cognitive Psychology        3.6
            9	Mechanical Engineering      3.9

      ```

# **Query Operations (Breakdown, Rollup, Cube)**
  * Write SQL queries to perform breakdown, rollup, and cube operations.

    - **Breakdown of enrollment by department**
      ```sql
      USE UniversityDB;
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
      ```
      **Output:**
      ```sql
      DepartmentId	DepartmentName	EnrollmentCount
        1	    Computer Science	            2
        2	    Mathematics	                  2
        3	    Physics	                      2
        4	    Engineering	                  2
        5	    Art	                          2
        6	    Music	                        2

      ```
    
    - **Rollup of enrollment by year and department**
      ```sql
      USE UniversityDB;
      SELECT 
        e.AcademicYear, 
        d.DepartmentName, 
        COUNT(DISTINCT e.StudentID) AS EnrollmentCount
      FROM enrollment e
      JOIN student s ON e.StudentID = s.StudentID
      JOIN department d ON s.DepartmentID = d.DepartmentID
      GROUP BY e.AcademicYear, d.DepartmentName
      ORDER BY e.AcademicYear, d.DepartmentName;
      ```
      **Output:**
      ```sql
      AcadimicYear	DepartmentName	EnrollmentCount
            2021-2022	Art	                1
            2021-2022	Engineering	        1
            2021-2022	Music	              1
            2022-2023	Art	                1
            2022-2023	Computer Science	  2
            2022-2023	Engineering	        1
            2022-2023	Mathematics	        2
            2022-2023	Music	              1
            2022-2023	Physics	            2

      ```
    
    - **Cube of enrollment by course, year, and department**
      ```sql
      USE UniversityDB;
      SELECT 
          c.CourseID, 
          CourseName, 
          AcademicYear, 
          d.DepartmentID, 
          DepartmentName,
          COUNT(DISTINCT EnrollmentID) AS EnrollmentCount
      FROM enrollment e
      JOIN student s ON e.StudentID = s.StudentID
      JOIN department d ON s.DepartmentID = d.DepartmentID
      JOIN course c ON e.CourseID = c.CourseID
      GROUP BY c.CourseID, CourseName, AcademicYear, d.DepartmentID, DepartmentName;
      ```
      **Output:**
      ```sql
      CourseId CourseName AcadimicYear DepartmentId	DepartmentName EnrollmentCount
            1	Database Management	2021-2022	   4	        Engineering	      1
            1	Database Management	2022-2023	   1	        ComputerScience   1
            2	Statistics	        2021-2022	   5	        Art	              1
            2	Statistics      	  2021-2022    6        	Music	            1
            2	Statistics      	  2022-2023	   2	        Mathematics	      1
            3	Organic Chemistry	  2022-2023	   3	        Physics	          1
            4	Cell Biology	      2022-2023	   4	        Engineering	      1
            5	Medieval History	  2022-2023	   5	        Art	              1
            6	Literature	        2022-2023	   6	        Music	            1
            7	Microeconomics	    2022-2023	   1	        ComputerScience	  1
            8 Psychology	        2022-2023	   2	        Mathematics	      1
            9 Engineering	        2022-2023	   3	        Physics	          1

      ```

# **Result Reports with Charts or Graphs**
  * Power BI Visualization

    Utilizing the magic of Power BI, we've seamlessly connected our database to create an immersive experience of our data. The Visuals directory houses a captivating data visualization.pbix file, a treasure trove of multiple graphs and diagrams. These visuals not only bring our data to life but also enhance its analytical depth. Dive into the world of insights as each graph unfolds a unique perspective, making your data exploration not just informative but visually engaging. Unleash the power of visualization with a simple click on our Power BI project, and let the data tell its story! 📊✨
