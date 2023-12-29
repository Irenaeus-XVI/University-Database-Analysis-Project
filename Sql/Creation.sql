-- create database
CREATE DATABASE UniversityDB;

-- use UniversityDB
USE UniversityDB;

-- create table department
CREATE TABLE department (
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName VARCHAR(30) NOT NULL
);

-- create table students
CREATE TABLE student (
    StudentID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender INT,
    DepartmentID INT ,
    CONSTRAINT fk_student_department FOREIGN KEY(DepartmentID)
        REFERENCES department(DepartmentID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- create table courses 
CREATE TABLE course (
    CourseID INT IDENTITY(1,1) PRIMARY KEY,
    CourseName VARCHAR(30) NOT NULL,
    Credits INT NOT NULL,
    DepartmentID INT ,
    CONSTRAINT fk_course_department FOREIGN KEY(DepartmentID)
        REFERENCES department(DepartmentID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- create table professors
CREATE TABLE professor (
    ProfessorID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    DepartmentID INT ,
    CONSTRAINT fk_professor_department FOREIGN KEY(DepartmentID)
        REFERENCES department(DepartmentID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- create table enrollment 
-- create table enrollment 
CREATE TABLE enrollment (
    EnrollmentID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    AcademicYear VARCHAR(10) NOT NULL,
    GPA DECIMAL(3,2) NOT NULL,
    CONSTRAINT fk_enrollment_student FOREIGN KEY(StudentID)
        REFERENCES student(StudentID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_enrollment_course FOREIGN KEY(CourseID)
        REFERENCES course(CourseID)
     
);
