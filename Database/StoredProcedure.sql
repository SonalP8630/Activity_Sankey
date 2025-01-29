show databases;

CREATE DATABASE EmployeeSankeyDB;

USE EmployeeSankeyDB;

CREATE TABLE Employee (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY, 
    FirstName VARCHAR(100),                    
    LastName VARCHAR(100),                     
    DateOfBirth DATE,                         
    Email VARCHAR(100) UNIQUE,                
    Salary DECIMAL(10, 2),                     
    IsActive BOOLEAN                           
);


DELIMITER //

CREATE PROCEDURE InsertEmployee(
    IN p_FirstName VARCHAR(100),
    IN p_LastName VARCHAR(100),
    IN p_DateOfBirth DATE,
    IN p_Email VARCHAR(100),
    IN p_Salary DECIMAL(10, 2),
    IN p_IsActive BOOLEAN,
    IN p_Position VARCHAR(100)
)
BEGIN
    INSERT INTO Employee (FirstName, LastName, DateOfBirth, Email, Salary, IsActive, Position)
    VALUES (p_FirstName, p_LastName, p_DateOfBirth, p_Email, p_Salary, p_IsActive, p_Position);
END //

DELIMITER ;

-- DROP PROCEDURE IF EXISTS InsertEmployee;

-- update query

DELIMITER //

CREATE PROCEDURE UpdateEmployee(
    IN p_EmployeeID INT,
    IN p_FirstName VARCHAR(100),
    IN p_LastName VARCHAR(100),
    IN p_DateOfBirth DATE,
    IN p_Email VARCHAR(100),
    IN p_Salary DECIMAL(10, 2),
    IN p_IsActive BOOLEAN,
    IN p_Position VARCHAR(100)
)
BEGIN
    UPDATE Employee
    SET FirstName = p_FirstName,
        LastName = p_LastName,
        DateOfBirth = p_DateOfBirth,
        Email = p_Email,
        Salary = p_Salary,
        IsActive = p_IsActive,
        Position = p_Position
    WHERE EmployeeID = p_EmployeeID;
END //

DELIMITER ;


-- read data
DELIMITER //

CREATE PROCEDURE ReadEmployee(IN p_EmployeeID INT)
BEGIN
    SELECT * FROM Employee WHERE EmployeeID = p_EmployeeID;
END //

DELIMITER ;


-- Delete employee

DELIMITER //

CREATE PROCEDURE DeleteEmployee(IN p_EmployeeID INT)
BEGIN
    DELETE FROM Employee WHERE EmployeeID = p_EmployeeID;
END //

DELIMITER ;

ALTER TABLE Employee
ADD COLUMN Position VARCHAR(100);


-- insert data to tablr
CALL InsertEmployee('Raju', 'Patil', '2015-03-15', 'raju.patil@gmail.com', 60000.00, TRUE, 'Manager');

-- raed data
CALL ReadEmployee(1); 


