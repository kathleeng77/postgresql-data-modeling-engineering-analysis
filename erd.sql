-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/HzK4ou
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Software Co. Analysis
CREATE TABLE "dept" (
    "id" VARCHAR   NOT NULL,
    "name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_dept" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "emp" (
    "id" INTEGER   NOT NULL,
    "dept_id" VARCHAR   NOT NULL,
    "from_date" VARCHAR   NOT NULL,
    "to_date" VARCHAR   NOT NULL
);

CREATE TABLE "man" (
    "id" INTEGER   NOT NULL,
    "dept_id" VARCHAR   NOT NULL,
    "from_date" VARCHAR   NOT NULL,
    "to_date" VARCHAR   NOT NULL
);

CREATE TABLE "info" (
    "id" INTEGER   NOT NULL,
    "birth_date" VARCHAR   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "gender" VARCHAR   NOT NULL,
    "hire_date" VARCHAR   NOT NULL,
    CONSTRAINT "pk_info" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "salary" (
    "id" INTEGER   NOT NULL,
    "salary" INTEGER   NOT NULL,
    "from_date" VARCHAR   NOT NULL,
    "to_date" VARCHAR   NOT NULL
);

CREATE TABLE "title" (
    "id" INTEGER   NOT NULL,
    "title" VARCHAR   NOT NULL,
    "from_date" VARCHAR   NOT NULL,
    "to_date" VARCHAR   NOT NULL
);

ALTER TABLE "emp" ADD CONSTRAINT "fk_emp_id" FOREIGN KEY("id")
REFERENCES "info" ("id");

ALTER TABLE "emp" ADD CONSTRAINT "fk_emp_dept_id" FOREIGN KEY("dept_id")
REFERENCES "dept" ("id");

ALTER TABLE "man" ADD CONSTRAINT "fk_man_id" FOREIGN KEY("id")
REFERENCES "info" ("id");

ALTER TABLE "man" ADD CONSTRAINT "fk_man_dept_id" FOREIGN KEY("dept_id")
REFERENCES "dept" ("id");

ALTER TABLE "salary" ADD CONSTRAINT "fk_salary_id" FOREIGN KEY("id")
REFERENCES "info" ("id");

ALTER TABLE "title" ADD CONSTRAINT "fk_title_id" FOREIGN KEY("id")
REFERENCES "info" ("id");

