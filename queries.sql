select * from departments;
select * from dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

-- List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s ON e.emp_no = s.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date
FROM employees AS e
WHERE e.hire_date LIKE '%1986';


-- List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT 
    dm.dept_no AS department_number,
    d.dept_name AS department_name,
    dm.emp_no AS employee_number,
    e.last_name,
    e.first_name
FROM
    dept_manager AS dm
INNER JOIN
    departments AS d ON dm.dept_no = d.dept_no
INNER JOIN
    employees AS e ON dm.emp_no = e.emp_no;
	
-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT 
    e.emp_no AS employee_number,
    e.last_name,
    e.first_name,
	d.dept_name
FROM
    employees AS e
INNER JOIN
    dept_emp AS sde ON e.emp_no = sde.emp_no
INNER JOIN
    departments AS d ON sde.dept_no = d.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT
    first_name AS FirstName,
    last_name AS LastName,
    sex AS Sex
FROM
    employees
WHERE
    first_name = 'Hercules'
    AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.

SELECT
    e.emp_no AS EmployeeNumber,
    e.last_name AS LastName,
    e.first_name AS FirstName
FROM
    employees AS e
INNER JOIN
    dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN
    departments AS d ON de.dept_no = d.dept_no
WHERE
    d.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT
    e.emp_no AS EmployeeNumber,
    e.last_name AS LastName,
    e.first_name AS FirstName,
    d.dept_name AS DepartmentName
FROM
    employees AS e
INNER JOIN
    dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN
    departments AS d ON de.dept_no = d.dept_no
WHERE
    d.dept_name IN ('Sales', 'Development');
	
-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT
    last_name AS LastName,
    COUNT(*) AS Frequency
FROM
    employees
GROUP BY
    last_name
ORDER BY
    Frequency DESC;

