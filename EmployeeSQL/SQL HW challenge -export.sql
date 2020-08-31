--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.first_name,e.last_name, e.sex, s.salaries
FROM employees As e
INNER JOIN salaries As s ON
e.emp_no=s.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT e.first_name,e.last_name 
from employees as e
WHERE EXTRACT(YEAR FROM hire_date)= 1986;

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT e.emp_no, e.first_name,e.last_name,de.dept_no, de.emp_no, d.dept_no, d.dept_name
FROM employees As e
INNER Join Dept_employee As de ON
e.emp_no=de.emp_no
Left JOIN departments As d ON
de.dept_no=d.dept_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.first_name,e.last_name,de.dept_no, de.emp_no, d.dept_no, d.dept_name
FROM employees As e
INNER Join Dept_employee As de ON
e.emp_no=de.emp_no
Left JOIN departments As d ON
de.dept_no=d.dept_no;

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.first_name,e.last_name,de.dept_no, de.emp_no, d.dept_no, d.dept_name
FROM employees As e
INNER Join Dept_employee As de ON
e.emp_no=de.emp_no
Left JOIN departments As d ON
de.dept_no=d.dept_no
WHERE dept_name = 'Sales' ;

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.first_name,e.last_name,de.dept_no, de.emp_no, d.dept_no, d.dept_name
FROM employees As e
INNER Join Dept_employee As de ON
e.emp_no=de.emp_no
Left JOIN departments As d ON
de.dept_no=d.dept_no
WHERE dept_name in ('Sales', 'Development') ;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT e.first_name,e.last_name, e.sex  
FROM employees As e
WHERE first_name = 'Hercules'
AND last_name like 'B%';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name)AS Frequency
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC