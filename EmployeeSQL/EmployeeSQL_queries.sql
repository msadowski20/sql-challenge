SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s ON
    e.emp_no=s.emp_no;

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date::date >= '1/1/1986'
    AND hire_date::date <= '12/31/1986';

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager AS dm
INNER JOIN departments AS d ON 
	dm.dept_no=d.dept_no
    INNER JOIN employees AS e ON
	    dm.emp_no=e.emp_no;

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_employee AS de
INNER JOIN employees AS e ON
	de.emp_no=e.emp_no
    INNER JOIN departments AS d ON
	    de.dept_no=d.dept_no;

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
    AND last_name LIKE 'B%';

CREATE VIEW employee_name_dept AS
    SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
    FROM dept_employee AS de
    INNER JOIN employees AS e ON
	    de.emp_no=e.emp_no
        INNER JOIN departments AS d ON
	        de.dept_no=d.dept_no;

    SELECT * FROM employee_name_dept
    WHERE dept_name = 'Sales';

    DROP VIEW employee_name_dept;



