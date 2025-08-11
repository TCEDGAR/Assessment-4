IF OBJECT_ID('employee', 'U') IS NOT NULL
    DROP TABLE employee;
GO

CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    exp INT,
    salary DECIMAL(10,2),
    departmentName VARCHAR(50)
);
GO

INSERT INTO employee (employee_id, name, exp, salary, departmentName) VALUES
(101, 'John Doe', 5, 45000.00, 'HR'),
(102, 'Jane Smith', 3, 40000.00, 'Finance'),
(103, 'Mike Johnson', 7, 55000.00, 'IT');
GO

IF OBJECT_ID('delete_employee', 'P') IS NOT NULL
    DROP PROCEDURE delete_employee;
GO

CREATE PROCEDURE delete_employee
    @employee_id INT
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT 1 FROM employee WHERE employee_id = @employee_id)
    BEGIN
        DELETE FROM employee
        WHERE employee_id = @employee_id;
        SELECT 'Employee ID ' + CAST(@employee_id AS VARCHAR) + ' deleted successfully' AS message;
    END
    ELSE
    BEGIN
        SELECT 'No record found with Employee ID ' + CAST(@employee_id AS VARCHAR) AS message;
    END
END
GO

EXEC delete_employee 102;
EXEC delete_employee 200;
GO
