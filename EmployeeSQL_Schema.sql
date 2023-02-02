DROP TABLE IF EXISTS public.dept_emp;
DROP TABLE IF EXISTS public.dept_manager;
DROP TABLE IF EXISTS public.departments;
DROP TABLE IF EXISTS public.salaries;
DROP TABLE IF EXISTS public.employees;
DROP TABLE IF EXISTS public.titles;

-- Departments
CREATE TABLE departments (
	dept_no VARCHAR(255) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(255) NOT NULL
);
COPY departments FROM 'C:\Users\Yuoro\OneDrive\Desktop\BootCamp_Projects\sql-challenge\Data\departments.csv' csv header;
SELECT * FROM departments;

-- Titles
CREATE TABLE titles (
	title_id VARCHAR(30) PRIMARY KEY NOT NULL,
	title VARCHAR(30) NOT NULL
);
COPY titles FROM 'C:\Users\Yuoro\OneDrive\Desktop\BootCamp_Projects\sql-challenge\Data\titles.csv' csv header;
SELECT * FROM titles;

-- Employee
CREATE TABLE employees(
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(30) NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	birth_date VARCHAR(30),
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex VARCHAR(10),
	hire_date VARCHAR(30)
);
COPY employees FROM 'C:\Users\Yuoro\OneDrive\Desktop\BootCamp_Projects\sql-challenge\Data\employees.csv' csv header;
SELECT * FROM employees;

-- Salaries
CREATE TABLE salaries(
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INT
);
COPY salaries FROM 'C:\Users\Yuoro\OneDrive\Desktop\BootCamp_Projects\sql-challenge\Data\salaries.csv' csv header;
SELECT * FROM salaries;

-- Department Manager
CREATE TABLE dept_manager(
	dept_no VARCHAR(30),
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
COPY dept_manager FROM 'C:\Users\Yuoro\OneDrive\Desktop\BootCamp_Projects\sql-challenge\Data\dept_manager.csv' csv header;
SELECT * FROM dept_manager;


-- Department Employee
CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR(30),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
COPY dept_emp FROM 'C:\Users\Yuoro\OneDrive\Desktop\BootCamp_Projects\sql-challenge\Data\dept_emp.csv' csv header;
SELECT * FROM dept_emp;

