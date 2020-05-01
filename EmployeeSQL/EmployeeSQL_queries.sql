-- List the following details of each employee:
-- employee number, last name, first name, sex, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s ON
    e.emp_no=s.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date::date >= '1/1/1986'
    AND hire_date::date <= '12/31/1986';

-- List the manager of each department with the following information:
-- department number, department name, the manager's employee number, 
-- last name, first name.

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager AS dm
INNER JOIN departments AS d ON 
	dm.dept_no=d.dept_no
    INNER JOIN employees AS e ON
	    dm.emp_no=e.emp_no;

-- List the department of each employee with the following information:
-- employee number, last name, first name, and department name.

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_employee AS de
INNER JOIN employees AS e ON
	de.emp_no=e.emp_no
    INNER JOIN departments AS d ON
	    de.dept_no=d.dept_no
        ORDER BY emp_no;

-- List first name, last name, and sex for employees whose 
-- first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
    AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.

CREATE VIEW employee_name_dept AS
    SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
    FROM dept_employee AS de
    INNER JOIN employees AS e ON
	    de.emp_no=e.emp_no
        INNER JOIN departments AS d ON
	        de.dept_no=d.dept_no;

    SELECT *
    FROM employee_name_dept
    WHERE dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their
-- employee number, last name, first name, and department name.

    SELECT *
    FROM employee_name_dept
    WHERE dept_name = 'Sales'
        OR dept_name = 'Development';

    DROP VIEW employee_name_dept;

-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS count
FROM employees
GROUP BY last_name
ORDER BY count DESC;

-- Epilogue
SELECT first_name, last_name
FROM employees
WHERE emp_no = '499942';
-- (chuckle, chuckle, chuckle...)



