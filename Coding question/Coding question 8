CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    exp INT,
    salary DECIMAL(10,2),
    departmentName VARCHAR(50)
);

DELIMITER $$

CREATE PROCEDURE add_or_update_employee (
    IN p_employee_id INT,
    IN p_name VARCHAR(50),
    IN p_exp INT,
    IN p_salary DECIMAL(10,2),
    IN p_departmentName VARCHAR(50)
)
BEGIN
    DECLARE record_count INT;

    SELECT COUNT(*) INTO record_count
    FROM employee
    WHERE employee_id = p_employee_id;

    IF record_count > 0 THEN
        UPDATE employee
        SET name = p_name,
            exp = p_exp,
            salary = p_salary,
            departmentName = p_departmentName
        WHERE employee_id = p_employee_id;

        SELECT CONCAT('Employee ID ', p_employee_id, ' updated successfully') AS message;
    ELSE
        INSERT INTO employee (employee_id, name, exp, salary, departmentName)
        VALUES (p_employee_id, p_name, p_exp, p_salary, p_departmentName);

        SELECT CONCAT('Employee ID ', p_employee_id, ' inserted successfully') AS message;
    END IF;
END$$

DELIMITER ;
