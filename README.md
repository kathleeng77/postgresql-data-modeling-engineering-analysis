# <p align="center"> Model, Engineer, and Analyze Software Co. Database with PostgreSQL</p>


## Data Modeling
![entity-relationship-diagram](entity-relationship-diagram.png)

## Data Engineering

Schemas:

```sql
CREATE TABLE department (
    id VARCHAR(255) PRIMARY KEY NOT NULL,
    name VARCHAR(255)
);

CREATE TABLE employee (
    emp_id INT,
    emp_dept VARCHAR(225),
    from_date DATE,
    to_date DATE,
    FOREIGN KEY (emp_dept) REFERENCES department(id)
);

CREATE TABLE manager (
    man_dept VARCHAR(225),
    man_id INT,
    from_date DATE,
    to_date DATE,
    FOREIGN KEY (man_dept) REFERENCES department(id),
    FOREIGN KEY (man_id) REFERENCES personal_info(id)
);

CREATE TABLE personal_info (
    id INT PRIMARY KEY NOT NULL,
    dob VARCHAR(225),
    first_name VARCHAR(225),
    last_name VARCHAR(225),
    gender VARCHAR(225),
    hire_date DATE
);

CREATE TABLE salary (
    salary_id INT,
    salary INT,
    from_date DATE,
    to_date DATE,
    FOREIGN KEY (salary_id) REFERENCES personal_info(id)
);

CREATE TABLE title (
    title_id INT,
    title VARCHAR(225),
    from_date DATE,
    to_date DATE,
    FOREIGN KEY (title_id) REFERENCES personal_info(id)
);

SELECT * FROM department;
SELECT * FROM employee;
SELECT * FROM manager;
SELECT * FROM personal_info;
SELECT * FROM salary;
SELECT * FROM title;

```

## Data Analysis
