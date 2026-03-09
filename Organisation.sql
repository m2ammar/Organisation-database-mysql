-- DATABASE: Organisation

CREATE DATABASE IF NOT EXISTS Organisation;
USE Organisation;

-- Table: DEPT
CREATE TABLE DEPT (
  id   INT         NOT NULL,
  name VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (id)
);

INSERT INTO DEPT VALUES
(1, 'Science'),
(2, 'IT'),
(3, 'Sales');

-- Table: TEACHER (depends on DEPT)
CREATE TABLE TEACHER (
  id     INT         NOT NULL,
  name   VARCHAR(50) DEFAULT NULL,
  deptID INT         DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT teacher_ibfk_1 FOREIGN KEY (deptID)
    REFERENCES DEPT(id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO TEACHER VALUES
(1, 'James Carter',  2),
(2, 'Ayesha Malik',  1),
(3, 'Carlos Mendes', 3);

-- Table: department
CREATE TABLE department (
  deptID   INT         NOT NULL,
  deptname VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (deptID)
);

INSERT INTO department VALUES
(1, 'HR'),
(3, 'Sales'),
(4, 'Marketing');

-- Table: employees
CREATE TABLE employees (
  empID      INT         NOT NULL,
  name       VARCHAR(50) NOT NULL,
  department VARCHAR(50) NOT NULL,
  salary     DOUBLE      NOT NULL,
  city       VARCHAR(40) DEFAULT NULL,
  PRIMARY KEY (empID)
);

INSERT INTO employees VALUES
(101, 'Ali',    'HR',    51000, 'Karachi'),
(102, 'Sara',   'IT',    76000, 'Lahore'),
(103, 'Bilal',  'IT',    71000, 'Karachi'),
(104, 'Ayesha', 'Sales', 61000, 'Islamabad'),
(105, 'Hassan', 'HR',    53000, 'Lahore'),
(106, 'Nadia',  'IT',    81000, 'Karachi');

-- Table: projects
CREATE TABLE projects (
  projID   INT         NOT NULL,
  projname VARCHAR(50) DEFAULT NULL,
  empID    INT         DEFAULT NULL,
  budget   DOUBLE      NOT NULL,
  PRIMARY KEY (projID)
);

INSERT INTO projects VALUES
(201, 'Website Upgrade', 102, 20000),
(202, 'App Launch',      103, 30000),
(203, 'Sales Campaign',  104, 15000),
(204, 'HR Automation',   101, 10000),
(205, 'Data Migration',  106, 25000);

-- Table: worker
CREATE TABLE worker (
  emp_id     INT         NOT NULL,
  name       VARCHAR(50) NOT NULL,
  department VARCHAR(50) DEFAULT NULL,
  salary     INT         NOT NULL,
  PRIMARY KEY (emp_id)
);

INSERT INTO worker VALUES
(1, 'Ali',    'IT',      80000),
(2, 'Sara',   'HR',      60000),
(3, 'Ahmed',  'IT',      90000),
(4, 'Zain',   'Finance', 70000),
(5, 'Ayesha', 'HR',      65000);

-- Table: student
CREATE TABLE student (
  STUDENT_ID   INT         NOT NULL,
  STUDENT_NAME VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (STUDENT_ID)
);

INSERT INTO student VALUES
(101, 'Adam'),
(102, 'Bob'),
(103, 'Sohair'),
(104, 'Maham'),
(105, 'Hamza');

-- Table: course
CREATE TABLE course (
  STUDENT_ID INT         NOT NULL,
  course     VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (STUDENT_ID)
);

INSERT INTO course VALUES
(101, 'English'),
(102, 'Maths'),
(104, 'Physics'),
(105, 'Science'),
(108, 'Biology');

-- Queries practiced on worker
SELECT department, AVG(salary) AS avg_salary
FROM worker
GROUP BY department;

SELECT department, AVG(salary) AS avg_salary
FROM worker
GROUP BY department
HAVING AVG(salary) = (
  SELECT MAX(avg_salary)
  FROM (
    SELECT AVG(salary) AS avg_salary
    FROM worker
    GROUP BY department
  ) AS dept_avg
);
