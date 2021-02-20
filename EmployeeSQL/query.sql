--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT Employees.emp_no, Employees.last_name,Employees.first_name,Employees.sex, Salaries.salary 
FROM Employees
INNER JOIN Salaries ON Employees.emp_no=Salaries.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM Employees 
WHERE extract(year from hire_date) = 1986;

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT Dept_Manager.emp_no,Employees.first_name,Employees.last_name,Dept_Manager.dept_no,Departments.dept_name
FROM Dept_Manager
JOIN Employees ON Employees.emp_no=Dept_Manager.emp_no
JOIN Departments ON Departments.dept_no=Dept_Manager.dept_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT Dept_Emp.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Dept_Emp
JOIN Employees ON Dept_Emp.emp_no=Employees.emp_no
JOIN Departments ON Dept_emp.dept_no = Departments.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT Employees.last_name,Employees.first_name,Employees.sex
FROM Employees
WHERE Employees.first_name = 'Hercules'
AND Employees.last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT Dept_Emp.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Dept_Emp
JOIN Employees ON Dept_Emp.emp_no=Employees.emp_no
JOIN Departments ON Dept_emp.dept_no = Departments.dept_no
WHERE Departments.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT Dept_Emp.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Dept_Emp
JOIN Employees ON Dept_Emp.emp_no=Employees.emp_no
JOIN Departments ON Dept_emp.dept_no = Departments.dept_no
WHERE Departments.dept_name = 'Sales' 
OR Departments.dept_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT Employees.last_name, COUNT(Employees.last_name) AS "Frequency" FROM Employees
GROUP BY Employees.last_name
ORDER BY COUNT(Employees.last_name) DESC;
