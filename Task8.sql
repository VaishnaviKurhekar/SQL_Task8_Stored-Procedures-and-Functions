-- Task 8: Stored Procedures and Functions
-- Objective: Learn reusable SQL blocks

-- Deliverables: At least one stored procedure and one function


-- Stored Procedure Example
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10,2)
);
INSERT INTO employees (id, name, salary)
VALUES (101, 'Alice Johnson', 5000),	
		(102, 'Bob Smith', 6000),
		(103, 'Charlie Davis', 5500),
        (104, 'Diana Evans', 7000),
        (105, 'Ethan Brown', 6500);
-- a) Stored Procedure to Give Bonus
-- This procedure takes an employee ID and a bonus percentage, then increases that employee’s salary accordingly.
USE ecommerce;
-- sql
DELIMITER $$

CREATE PROCEDURE GiveIncrement(
    IN emp_id INT,
    IN percent DECIMAL(5,2)
)
BEGIN
    UPDATE employees
    SET salary = salary + (salary * percent / 100)
    WHERE id = emp_id;
END $$

DELIMITER ;
-- How to call:


CALL GiveBonus(101, 10);
-- This gives a 10% bonus to employee with ID 101.

-- 2. Stored Function Example
-- b) Function to Calculate Annual Salary
-- Let’s create a function that returns annual salary (monthly salary × 12):


DELIMITER $$

CREATE FUNCTION AnnualSalary(monthly DECIMAL(10,2))
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    RETURN monthly * 12;
END $$

DELIMITER ;
-- How to use:


SELECT name, salary, AnnualSalary(salary) AS annual_salary FROM employees;