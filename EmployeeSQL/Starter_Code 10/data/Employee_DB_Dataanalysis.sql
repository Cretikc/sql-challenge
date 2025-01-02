1.--List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
	"Employee".emp_no, 
	"Employee".last_name,
	"Employee".first_name,
	"Employee".sex
FROM
	"Employee"
	
INNER JOIN
	"Salaries"
ON
	"Employee".emp_no = "Salaries".emp_no;

--2.List the first name, last name, and hire date for the employees who were hired in 1986 

SELECT
	first_name,
	last_name,
	hire_date
FROM 
	"Employee"
WHERE
	extract(year from hire_date) = 1986
ORDER BY 
	hire_date ASC, last_name ASC, first_name ASC;

3. List the manager of each department along with their department number, department name, employee number, last name, and first name 
SELECT E.emp_no, E.last_name, E.first_name, D.dept_no, D.dept_name
FROM "Employee" E
JOIN "DepartmentManager" DM ON E.emp_no = DM.emp_no
JOIN "departments" D ON DM.dept_no = D.dept_no;


--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name 
SELECT E.emp_no, E.last_name, E.first_name, D.dept_no, D.dept_name
FROM "Employee" E
JOIN "Department_emp" DE ON E.emp_no = DE.emp_no
JOIN "departments" D ON DE.dept_no = D.dept_no;

--5.List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B 	 

SELECT
	first_name,
	last_name,
	sex
FROM 
	"Employee"
WHERE first_name = 'Hercules'
  AND last_name LIKE 'B%';

--6.List each employee in the Sales department, including their employee number, last name, and first name

SELECT 
	E.emp_no, 
	E.last_name, 
	E.first_name
FROM
	"Employee" E
JOIN "Department_emp" DE ON E.emp_no = DE.emp_no
JOIN "departments" D ON DE.dept_no = D.dept_no
WHERE D.dept_name = 'Sales';


7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)

SELECT E.emp_no, E.last_name, E.first_name, D.dept_no, D.dept_name
FROM "Employee" E
JOIN "Department_emp" DE ON E.emp_no = DE.emp_no
JOIN "departments" D ON DE.dept_no = D.dept_no
WHERE D.dept_name IN ('Sales', 'Development');

--8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)

SELECT last_name, COUNT(*) AS frequency
FROM "Employee"
GROUP BY last_name
ORDER BY frequency DESC, last_name;
