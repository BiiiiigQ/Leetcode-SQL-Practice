-- ANSWER 1: LEFT OUTER JOIN

SELECT e.name, b.bonus
FROM Employee e
    LEFT OUTER JOIN Bonus b
                 ON e.empId = b.empId
WHERE b.bonus IS NULL OR b.bonus < 1000


-- ANSWER 2: LEFT OUTER JOIN
-- If the question want you to return 0 when there is no bonus for the employee

SELECT name, bonus
FROM
(
    SELECT e.empId, e.name, IFNULL(b.bonus,0) AS bonus
    FROM Employee e
        LEFT OUTER JOIN Bonus b
                    ON e.empId = b.empId
) AS eb
WHERE bonus < 1000
