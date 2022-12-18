



SELECT emp.name AS Employee
FROM Employee emp
    LEFT OUTER JOIN Employee mag
                 ON emp.managerId = mag.id
WHERE emp.salary > mag.salary
