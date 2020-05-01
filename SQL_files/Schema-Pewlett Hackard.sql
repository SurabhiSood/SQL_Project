-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/M7axZr
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DROP TABLE EMPLOYEES;
CREATE TABLE EMPLOYEES (
    emp_no INT   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR(255)   NOT NULL,
    last_name VARCHAR(255)   NOT NULL,
    gender VARCHAR(10)   NOT NULL,
    hire_date DATE   NOT NULL,
    CONSTRAINT pk_EMPLOYEES PRIMARY KEY (
        emp_no
     )
);

DROP TABLE departments;
CREATE TABLE DEPARTMENTS (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    CONSTRAINT pk_DEPARTMENTS PRIMARY KEY (
        dept_no
     )
);

DROP TABLE dept_emp;
CREATE TABLE DEPT_EMP (
    emp_no INT   NOT NULL,
    dept_no VARCHAR   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL
);

DROP TABLE dept_manager;
CREATE TABLE DEPT_MANAGER (
    dept_no VARCHAR   NOT NULL,
    emp_no INT   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL
);

DROP TABLE salaries;
CREATE TABLE SALARIES (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL
);

DROP TABLE titles;
CREATE TABLE TITLES (
    emp_no INT   NOT NULL,
    title VARCHAR(30)   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL
);

ALTER TABLE DEPT_EMP ADD CONSTRAINT fk_DEPT_EMP_dept_no FOREIGN KEY(dept_no)
REFERENCES DEPARTMENTS (dept_no);

ALTER TABLE DEPT_MANAGER ADD CONSTRAINT fk_DEPT_MANAGER_dept_no FOREIGN KEY(dept_no)
REFERENCES DEPARTMENTS (dept_no);

ALTER TABLE DEPT_MANAGER ADD CONSTRAINT fk_DEPT_MANAGER_emp_no FOREIGN KEY(emp_no)
REFERENCES DEPT_EMP (emp_no);

ALTER TABLE SALARIES ADD CONSTRAINT fk_SALARIES_emp_no FOREIGN KEY(emp_no)
REFERENCES EMPLOYEES (emp_no);

ALTER TABLE TITLES ADD CONSTRAINT fk_TITLES_emp_no FOREIGN KEY(emp_no)
REFERENCES EMPLOYEES (emp_no);
