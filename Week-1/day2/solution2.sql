-- 31. Sort employees by salary ascending
SELECT *
FROM Employee
ORDER BY salary ASC;

-- 32. Sort employees by salary descending
SELECT *
FROM Employee
ORDER BY salary DESC;

-- 33. Sort employees by age descending
SELECT *
FROM Employee
ORDER BY age DESC;

-- 34. Sort employees by hire date
SELECT *
FROM Employee
ORDER BY hire_date ASC;

-- 35. Sort employees by department and salary
SELECT *
FROM Employee
ORDER BY department_id, salary DESC;

-- 36. Employee names with department names
SELECT e.name, d.name AS department_name
FROM Employee e
JOIN Department d
ON e.department_id = d.department_id;

-- 37. Select project names along with department names
SELECT p.name AS project_name,
       d.name AS department_name
FROM Project p
JOIN Department d
ON p.department_id = d.department_id;

-- 38. Employees and corresponding project names
SELECT e.name, p.name AS project_name
FROM Employee e
JOIN Project p
ON e.department_id = p.department_id;

-- 39. Select all employees and their departments including those without department
SELECT e.name AS employee_name,
       d.name AS department_name
FROM Employee e
LEFT JOIN Department d
ON e.department_id = d.department_id;

-- 40. Select all departments and their employees including departments without employees
SELECT d.name AS department_name,
       e.name AS employee_name
FROM Department d
LEFT JOIN Employee e
ON d.department_id = e.department_id;

-- 41. Select employees who are not assigned to any project
SELECT e.name
FROM Employee e
LEFT JOIN Project p
ON e.department_id = p.department_id
WHERE p.project_id IS NULL;

-- 42. Select employees and the number of projects their department is working on
SELECT e.name,
       COUNT(p.project_id) AS total_projects
FROM Employee e
LEFT JOIN Project p
ON e.department_id = p.department_id
GROUP BY e.emp_id, e.name;

-- 43. Select departments that have no employees
SELECT d.name
FROM Department d
LEFT JOIN Employee e
ON d.department_id = e.department_id
WHERE e.emp_id IS NULL;

-- 44. Select employee names who share the same department with 'John Doe'
SELECT name
FROM Employee
WHERE department_id = (
    SELECT department_id
    FROM Employee
    WHERE name = 'John Doe'
)
AND name <> 'John Doe';

-- 45. Select department name with the highest average salary
SELECT d.name
FROM Department d
JOIN Employee e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.name
ORDER BY AVG(e.salary) DESC
LIMIT 1;

-- 46. Select employee with the highest salary
SELECT *
FROM Employee
WHERE salary = (
    SELECT MAX(salary)
    FROM Employee
);

-- 47. Select employees whose salary is above average salary
SELECT *
FROM Employee
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
);

-- 48. Select second highest salary from Employee table
SELECT MAX(salary) AS second_highest_salary
FROM Employee
WHERE salary < (
    SELECT MAX(salary)
    FROM Employee
);

-- 49. Select department with the most employees
SELECT department_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id
ORDER BY employee_count DESC
LIMIT 1;

-- 50. Select employees who earn more than average salary of their department
SELECT *
FROM Employee e1
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee e2
    WHERE e1.department_id = e2.department_id
);

-- 51. Select nth highest salary (example: 3rd highest)
SELECT DISTINCT salary
FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 2;

-- 52. Select employees older than all employees in HR department
SELECT *
FROM Employee
WHERE age > ALL (
    SELECT age
    FROM Employee
    WHERE department_id = (
        SELECT department_id
        FROM Department
        WHERE name = 'HR'
    )
);

-- 53. Select departments where average salary is greater than 55000
SELECT department_id, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;

-- 54. Select employees who work in a department with at least 2 projects
SELECT *
FROM Employee
WHERE department_id IN (
    SELECT department_id
    FROM Project
    GROUP BY department_id
    HAVING COUNT(project_id) >= 2
);

-- 55. Select employees hired on the same date as 'Jane Smith'
SELECT *
FROM Employee
WHERE hire_date = (
    SELECT hire_date
    FROM Employee
    WHERE name = 'Jane Smith'
);

-- 56. Total salary of employees hired in 2020
SELECT SUM(salary) AS total_salary
FROM Employee
WHERE YEAR(hire_date) = 2020;

-- 57. Average salary of employees in each department ordered descending
SELECT department_id, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
ORDER BY avg_salary DESC;

-- 58. Departments with more than 1 employee and average salary greater than 55000
SELECT department_id,
       COUNT(*) AS employee_count,
       AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 1
AND AVG(salary) > 55000;

-- 59. Employees hired in last 2 years ordered by hire date
SELECT *
FROM Employee
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR)
ORDER BY hire_date ASC;

-- 60. Total employees and average salary for departments with more than 2 employees
SELECT department_id,
       COUNT(*) AS total_employees,
       AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

-- 61. Employees whose salary is above department average
SELECT name, salary
FROM Employee e1
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee e2
    WHERE e1.department_id = e2.department_id
);

-- 62. Employees hired on same date as oldest employee
SELECT name
FROM Employee
WHERE hire_date = (
    SELECT MIN(hire_date)
    FROM Employee
);

-- 63. Department names with total number of projects ordered by project count
SELECT d.name,
       COUNT(p.project_id) AS total_projects
FROM Department d
LEFT JOIN Project p
ON d.department_id = p.department_id
GROUP BY d.department_id, d.name
ORDER BY total_projects DESC;

-- 64. Employee with highest salary in each department
SELECT *
FROM Employee e1
WHERE salary = (
    SELECT MAX(salary)
    FROM Employee e2
    WHERE e1.department_id = e2.department_id
);

-- 65. Employees older than average age of their department
SELECT name, salary
FROM Employee e1
WHERE age > (
    SELECT AVG(age)
    FROM Employee e2
    WHERE e1.department_id = e2.department_id
);
