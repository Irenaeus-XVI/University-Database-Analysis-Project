use UniversityDB;

-- Insert into department table
INSERT INTO department (DepartmentName) VALUES
('Computer Science'),
('Mathematics'),
('Physics'),
('Engineering'),
('Art'),
('Music');

-- Insert into student table (continued)
INSERT INTO student (FirstName, LastName, DateOfBirth, Gender, DepartmentID) VALUES
('Emily', 'Davis', '1993-08-25', 2, 4),
('Michael', 'Clark', '1992-11-18', 1, 5),
('Sophia', 'Roberts', '1994-02-12', 2, 6),
('Ethan', 'Brown', '1990-07-03', 1, 1),
('Olivia', 'Taylor', '1995-04-30', 2, 2),
('Liam', 'Anderson', '1993-06-15', 1, 3),
('Ava', 'White', '1994-09-22', 2, 4),
('Noah', 'Miller', '1991-12-08', 1, 5),
('Isabella', 'Wilson', '1992-10-05', 2, 6),
('James', 'Moore', '1996-03-17', 1, 1),
('Sophie', 'Lee', '1994-05-28', 2,2),
('Lucas', 'Hill', '1993-01-09', 1, 3);

-- Insert into course table (continued)
INSERT INTO course (CourseName, Credits, DepartmentID) VALUES
('Database Management', 3, 1),
('Statistics', 4, 2),
('Organic Chemistry', 4, 3),
('Cell Biology', 3, 4),
('Medieval History', 3, 5),
('Shakespearean Literature', 3, 6),
('Microeconomics', 4, 1),
('Cognitive Psychology', 3, 2),
('Mechanical Engineering', 4, 3),
('International Relations', 3, 4),
('Digital Art', 3, 5),
('Music Theory', 2, 6),
('Geological Processes', 4, 1),
('Ethics', 3, 2),
('Artificial Intelligence', 4, 3);

-- Insert into professor table 
INSERT INTO professor (FirstName, LastName, DepartmentID) VALUES
('Professor4', 'Last4', 4),
('Professor5', 'Last5', 5),
('Professor6', 'Last6', 6),
('Professor7', 'Last7', 1),
('Professor8', 'Last8', 2),
('Professor9', 'Last9', 3),
('Professor10', 'Last10', 4),
('Professor11', 'Last11', 5),
('Professor12', 'Last12', 6),
('Professor13', 'Last13', 1),
('Professor14', 'Last14', 2),
('Professor15', 'Last15', 3);

-- Insert into enrollment table 
INSERT INTO enrollment (StudentID, CourseID, AcademicYear, GPA) VALUES
(1, 1, '2021-2022', 3.8),
(2, 2, '2021-2022', 4.0),
(3, 2, '2021-2022', 4.0),
(4, 1, '2022-2023', 3.8),
(5, 2, '2022-2023', 4.0),
(6, 3, '2022-2023', 3.5),
(7, 4, '2022-2023', 3.9),
(8, 5, '2022-2023', 3.7),
(9, 6, '2022-2023', 3.2),
(10, 7, '2022-2023', 4.0),
(11, 8, '2022-2023', 3.6),
(12, 9, '2022-2023', 3.9)

SELECT StudentID FROM student;