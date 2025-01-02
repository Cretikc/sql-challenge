-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/sptcQW
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "titles" (
    "title_id" varchar(10)   NOT NULL,
    "title" varchar(50)   NOT NULL,
    "last_updated" timestamp default localtimestamp  NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "departments" (
    "dept_no" varchar(10)   NOT NULL,
    "dept_name" varchar(50)   NOT NULL,
    "last_updated" timestamp default localtimestamp  NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Employee" (
    "emp_no" int   NOT NULL,
    "emp_title_id" varchar(10)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(50)   NOT NULL,
    "last_name" varchar(50)   NOT NULL,
    "sex" varchar(5)   NOT NULL,
    "hire_date" date   NOT NULL,
    "last_updated" timestamp default localtimestamp  NOT NULL,
    CONSTRAINT "pk_Employee" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "DepartmentManager" (
    "dept_manag_id" serial   NOT NULL,
    "dept_no" varchar(10)   NOT NULL,
    "emp_no" int   NOT NULL,
    "last_updated" timestamp default localtimestamp  NOT NULL
);

CREATE TABLE "Salaries" (
    "salary_id" serial   NOT NULL,
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    "last_updated" timestamp default localtimestamp  NOT NULL
);

CREATE TABLE "Department_emp" (
    "dept_emp_id" serial   NOT NULL,
    "emp_no" int   NOT NULL,
    "dept_no" varchar(10)   NOT NULL,
    "last_updated" timestamp default localtimestamp  NOT NULL
);

ALTER TABLE "Employee" ADD CONSTRAINT "fk_Employee_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "DepartmentManager" ADD CONSTRAINT "fk_DepartmentManager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "DepartmentManager" ADD CONSTRAINT "fk_DepartmentManager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("emp_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("emp_no");

ALTER TABLE "Department_emp" ADD CONSTRAINT "fk_Department_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("emp_no");

ALTER TABLE "Department_emp" ADD CONSTRAINT "fk_Department_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");