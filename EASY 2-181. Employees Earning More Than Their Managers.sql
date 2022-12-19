--ANSWER 1: LEFT OUTER JOIN 

SELECT emp.name AS Employee
FROM Employee emp
    LEFT OUTER JOIN Employee mag
                 ON emp.managerId = mag.id
WHERE emp.salary > mag.salary


-- ANSWER 2: SUBQUERY (1)

SELECT emp.name AS Employee
FROM Employee emp
WHERE emp.salary > (SELECT mag.salary
                    FROM Employee mag
                    WHERE emp.managerId = mag.id)


-- ANSWER 3: SUBQUERY (2)

SELECT emp.name AS Employee
FROM Employee emp
WHERE EXISTS (SELECT 1
              FROM Employee mag
              WHERE emp.managerId = mag.id AND emp.salary > mag.salary)


-- ANSWER 3: SUBQUERY (3)

SELECT name AS Employee
FROM
(
    SELECT *,
        (SELECT salary
         FROM Employee mag
         WHERE emp.managerId = mag.id) AS mag_salary
    FROM Employee emp
) em
WHERE salary > mag_salary
