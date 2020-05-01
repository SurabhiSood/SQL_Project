--1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT e.emp_no,last_name,first_name,gender,salary
FROM EMPLOYEES e
JOIN SALARIES s
ON e.emp_no=s.emp_no;

--2. List employees who were hired in 1986.
SELECT*FROM EMPLOYEES
LIMIT 10;

SELECT emp_no,last_name,first_name,hire_date
FROM EMPLOYEES
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT * FROM dept_manager
LIMIT 10;

SELECT dm.dept_no,d.dept_name,dm.emp_no AS "Manager Emp Num",e.first_name,e.last_name,dm.from_date AS "Start Date",dm.to_date AS "End Employment Date"
FROM dept_manager dm
JOIN departments d
ON dm.dept_no=d.dept_no
JOIN EMPLOYEES e
ON e.emp_no=dm.emp_no;

--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT d.emp_no AS "Employee Num",e.last_name,e.first_name,ds.dept_name AS "Department Name"
FROM EMPLOYEES e
JOIN DEPT_EMP d
ON d.emp_no=e.emp_no
JOIN DEPARTMENTS ds
ON ds.dept_no=d.dept_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT * 
FROM EMPLOYEES 
WHERE (first_name='Hercules' AND last_name LIKE 'B%');

--6. List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.

SELECT e.emp_no AS "Employee Num", e.last_name,e.first_name,d.dept_name
FROM EMPLOYEES e
JOIN DEPT_EMP dp
ON e.emp_no=dp.emp_no
JOIN DEPARTMENTS d
ON dp.dept_no=d.dept_no
WHERE dept_name='Sales';

--7. List all employees in the Sales and Development departments, including their 
--employee number, last name, first name, and department name.
SELECT e.emp_no AS "Employee Num",e.last_name,e.first_name,d.dept_name AS "Department Name"
FROM EMPLOYEES e
JOIN DEPT_EMP dp
on e.emp_no = dp.emp_no
JOIN DEPARTMENTS d
on d.dept_no = dp.dept_no;

--8. In descending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name.
SELECT last_name,count(last_name)
FROM EMPLOYEES
GROUP by last_name;


