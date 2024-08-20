CREATE TABLE scores (
    name VARCHAR(20) PRIMARY KEY,
    score INT NOT NULL
);

INSERT INTO
	scores(name, score)
VALUES
	('Smith',81),
	('Jones',55),
	('Williams',55),
	('Taylor',62),
	('Brown',62),
	('Davies',84),
	('Evans',87),
	('Wilson',72),
	('Thomas',72),
	('Johnson',100);
    
    SELECT 
  name, 
  score, 
  ROW_NUMBER() OVER (
    ORDER BY 
      score
  ) row_num, 
  CUME_DIST() OVER (
    ORDER BY 
      score
  ) cume_dist_val 
FROM 
  scores;
  
  CREATE TABLE sales(
    sales_employee VARCHAR(50) NOT NULL,
    fiscal_year INT NOT NULL,
    sale DECIMAL(14,2) NOT NULL,
    PRIMARY KEY(sales_employee,fiscal_year)
);

INSERT INTO sales(sales_employee,fiscal_year,sale)
VALUES('Bob',2016,100),
      ('Bob',2017,150),
      ('Bob',2018,200),
      ('Alice',2016,150),
      ('Alice',2017,100),
      ('Alice',2018,200),
       ('John',2016,200),
      ('John',2017,150),
      ('John',2018,250);

SELECT * FROM sales;
SELECT 
  sales_employee, 
  fiscal_year, 
  sale, 
  DENSE_RANK() OVER (
    PARTITION BY fiscal_year 
    ORDER BY sale DESC
  ) sales_rank 
FROM 
  sales;
  
  CREATE TABLE overtime (
    employee_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    hours INT NOT NULL,
    PRIMARY KEY (employee_name , department)
);
INSERT INTO overtime(employee_name, department, hours)
VALUES('Diane Murphy','Accounting',37),
('Mary Patterson','Accounting',74),
('Jeff Firrelli','Accounting',40),
('William Patterson','Finance',58),
('Gerard Bondur','Finance',47),
('Anthony Bow','Finance',66),
('Leslie Jennings','IT',90),
('Leslie Thompson','IT',88),
('Julie Firrelli','Sales',81),
('Steve Patterson','Sales',29),
('Foon Yue Tseng','Sales',65),
('George Vanauf','Marketing',89),
('Loui Bondur','Marketing',49),
('Gerard Hernandez','Marketing',66),
('Pamela Castillo','SCM',96),
('Larry Bott','SCM',100),
('Barry Jones','SCM',65);

SELECT
    employee_name,
    hours,
    FIRST_VALUE(employee_name) OVER (
        ORDER BY hours
    ) least_over_time
FROM
    overtime;
    SELECT
    employee_name,
    department,
    hours,
    FIRST_VALUE(employee_name) OVER (
        PARTITION BY department
        ORDER BY hours
    ) least_over_time
FROM
    overtime;
    
    SELECT 
  sales_employee,
  fiscal_year, 
  sale, 
  LEAD(sale) OVER (
    PARTITION BY sales_employee
    ORDER BY fiscal_year
  ) AS next_year_sale 
FROM 
  sales;
  
SELECT
    employee_name,
    hours,
    LAST_VALUE(employee_name) OVER (
        ORDER BY hours
        RANGE BETWEEN
            UNBOUNDED PRECEDING AND
            UNBOUNDED FOLLOWING
    ) highest_overtime_employee
FROM
    overtime;
    
    SELECT
    employee_name,
    department,
    hours,
    LAST_VALUE(employee_name) OVER (
		PARTITION BY department
        ORDER BY hours
        RANGE BETWEEN
	    UNBOUNDED PRECEDING AND
            UNBOUNDED FOLLOWING
	) most_overtime_employee
FROM
    overtime;
    
    
    CREATE TABLE sales(
    sales_employee VARCHAR(50) NOT NULL,
    fiscal_year INT NOT NULL,
    sale DECIMAL(14,2) NOT NULL,
    PRIMARY KEY(sales_employee,fiscal_year)
);

INSERT INTO sales(sales_employee,fiscal_year,sale)
VALUES('Bob',2016,100),
      ('Bob',2017,150),
      ('Bob',2018,200),
      ('Alice',2016,150),
      ('Alice',2017,100),
      ('Alice',2018,200),
       ('John',2016,200),
      ('John',2017,150),
      ('John',2018,250);

SELECT * FROM sales;
SELECT 
  sales_employee, 
  fiscal_year, 
  sale, 
  LAG(sale, 1 , 0) OVER (
    PARTITION BY sales_employee 
    ORDER BY fiscal_year
  ) 'previous year sale' 
FROM 
  sales;