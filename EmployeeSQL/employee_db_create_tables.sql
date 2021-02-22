
--01
CREATE TABLE departments (
	dept_no VARCHAR
	,dept_name VARCHAR
	,PRIMARY KEY (dept_no)
	);

--02
CREATE TABLE titles (
	title_id VARCHAR
	,title VARCHAR UNIQUE
	,PRIMARY KEY (title_id)
	);


--03
CREATE TABLE employees (
	emp_no INTEGER
	,emp_title_id VARCHAR
	,birth_date VARCHAR 
	,first_name  VARCHAR
	,last_name VARCHAR
	,sex VARCHAR
	,hire_date VARCHAR 
	,PRIMARY KEY (emp_no)
	,FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
	);
--04
CREATE TABLE dept_emp (
	emp_no INTEGER
	,dept_no VARCHAR 
	,PRIMARY KEY (emp_no, dept_no)
	,FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	,FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
	);

--05
CREATE TABLE salaries(
	emp_no INTEGER
	,salary INTEGER
	,PRIMARY KEY (emp_no) 
	,FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	);


--06
CREATE TABLE dept_manager (
	dept_no VARCHAR
	,emp_no INTEGER
	,PRIMARY KEY (emp_no)
	,FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	,FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
	);