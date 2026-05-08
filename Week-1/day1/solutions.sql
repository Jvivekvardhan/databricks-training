```sql
-- =========================
-- BASIC QUERIES
-- =========================

-- Question 1
SELECT * FROM Employee;

-- Question 2
SELECT name, salary
FROM Employee;

-- Question 3
SELECT *
FROM Employee
WHERE age > 30;

-- Question 4
SELECT name
FROM Department;

-- Question 5
SELECT *
FROM Employee
WHERE department_id = 1;


-- =========================
-- STRING MATCHING QUERIES
-- =========================

-- Question 6
SELECT *
FROM Employee
WHERE name LIKE 'J%';

-- Question 7
SELECT *
FROM Employee
WHERE name LIKE '%e';

-- Question 8
SELECT *
FROM Employee
WHERE name LIKE '%a%';

-- Question 9
SELECT *
FROM Employee
WHERE LENGTH(name) = 9;

-- Question 10
SELECT *
FROM Employee
WHERE name LIKE '_o%';


-- =========================
-- DATE QUERIES
-- =========================

-- Question 11
SELECT *
FROM Employee
WHERE YEAR(hire_date) = 2020;

-- Question 12
SELECT *
FROM Employee
WHERE MONTH(hire_date) = 1;

-- Question 13
SELECT *
FROM Employee
WHERE hire_date < '2019-01-01';

-- Question 14
SELECT *
FROM Employee
WHERE hire_date >= '2021-03-01';

-- Question 15
SELECT *
FROM Employee
WHERE hire_date >= CURDATE() - INTERVAL 2 YEAR;


-- =========================
-- AGGREGATE QUERIES
-- =========================

-- Question 16
SELECT SUM(salary) AS total_salary
FROM Employee;

-- Question 17
SELECT AVG(salary) AS average_salary
FROM Employee;

-- Question 18
SELECT MIN(salary) AS minimum_salary
FROM Employee;

-- Question 19
SELECT department_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id;

-- Question 20
SELECT department_id, AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id;


-- =========================
-- GROUP BY QUERIES
-- =========================

-- Question 21
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id;

-- Question 22
SELECT department_id, AVG(age) AS average_age
FROM Employee
GROUP BY department_id;

-- Question 23
SELECT YEAR(hire_date) AS hire_year,
       COUNT(*) AS employee_count
FROM Employee
GROUP BY YEAR(hire_date);

-- Question 24
SELECT department_id, MAX(salary) AS highest_salary
FROM Employee
GROUP BY department_id;

-- Question 25
SELECT department_id, AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id
ORDER BY average_salary DESC
LIMIT 1;


-- =========================
-- HAVING QUERIES
-- =========================

-- Question 26
SELECT department_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

-- Question 27
SELECT department_id, AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;

-- Question 28
SELECT YEAR(hire_date) AS hire_year,
       COUNT(*) AS employee_count
FROM Employee
GROUP BY YEAR(hire_date)
HAVING COUNT(*) > 1;

-- Question 29
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id
HAVING SUM(salary) < 100000;

-- Question 30
SELECT department_id, MAX(salary) AS maximum_salary
FROM Employee
GROUP BY department_id
HAVING MAX(salary) > 75000;
```
