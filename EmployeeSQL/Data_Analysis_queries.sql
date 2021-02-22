--01. employee demographics and salaries
SELECT 
	employees.emp_no
	, last_name
	, first_name
	, sex
	, salary
FROM 
	employees 
LEFT JOIN 
	salaries 
ON 
	employees.emp_no = salaries.emp_no
;


--02. List first name, last name, and hire date for employees who were hired in 1986
SELECT 
	first_name
	,last_name
	,hire_date
FROM 
	employees 
WHERE
	RIGHT(hire_date,4) = '1986'
	
;

--03. manager of each department with: department number, department name, the manager's employee number, last name, first name.
SELECT
	departments.dept_no
	,departments.dept_name
	,dept_manager.emp_no AS manager_emp_no
	,employees.last_name
	,employees.first_name
FROM 
	departments
JOIN 
	dept_manager 
ON 
	departments.dept_no = dept_manager.dept_no
LEFT JOIN
	employees
ON 
	dept_manager.emp_no = employees.emp_no
ORDER BY departments.dept_no
;

--04 employee number, last name, first name, and department name for all employees
SELECT
	employees.emp_no
	,employees.last_name
	,employees.first_name
	,departments.dept_name
FROM 
	employees
LEFT JOIN 
	dept_emp 
ON 
	employees.emp_no = dept_emp.emp_no
LEFT JOIN
	departments
ON
	dept_emp.dept_no = departments.dept_no
;

	
--05 List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT
	employees.first_name
	,employees.last_name
	,employees.sex
FROM
	employees
WHERE
	first_name = 'HERCULES' 
	AND last_name LIKE 'B%'
;

--06. all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT
	employees.emp_no
	,employees.last_name
	,employees.first_name
	,departments.dept_name
FROM 
	employees
JOIN 
	dept_emp 
ON 
	employees.emp_no = dept_emp.emp_no
JOIN
	departments
ON
	dept_emp.dept_no = departments.dept_no
WHERE
	departments.dept_name = 'Sales'
;

--07. same fields for sales OR development departments	
SELECT
	employees.emp_no
	,employees.last_name
	,employees.first_name
	,departments.dept_name
FROM 
	employees
JOIN 
	dept_emp 
ON 
	employees.emp_no = dept_emp.emp_no
JOIN
	departments
ON
	dept_emp.dept_no = departments.dept_no
WHERE
	departments.dept_name IN ('Sales', 'Development')
;

--08. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT
	employees.last_name
	,count(*) cnt_emp_with_last_name
FROM 
	employees
GROUP BY 
	last_name
ORDER BY 
	cnt_emp_with_last_name desc
;










































