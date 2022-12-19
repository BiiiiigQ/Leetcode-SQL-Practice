-- ANSWER 1: GROUP BY

SELECT email AS Email
FROM Person
GROUP BY email
HAVING COUNT(email) >= 2

-- ANSWER 2: WINDOW FUNCTION

SELECT DISTINCT email AS Email
FROM
(
    SELECT *,
        COUNT(id) OVER(PARTITION BY email) AS email_cnt
    FROM Person
) AS p
WHERE email_cnt >= 2

**********************************************************

-- ANSWER 2: LEFT OUTER JOIN

SELECT DISTINCT p1.email AS Email
FROM Person p1
    LEFT OUTER JOIN Person p2
                 ON p1.email = p2.email AND p1.id <> p2.id
WHERE p2.id IS NOT NULL



-- ANSWER 3: INNER JOIN

SELECT DISTINCT p1.email AS Email
FROM Person p1
    INNER JOIN Person p2
            ON p1.email = p2.email AND p1.id <> p2.id


-- ANSWER4: SUBQUERY

SELECT DISTINCT p1.email AS Email
FROM Person p1
WHERE EXISTS (SELECT 1
              FROM Person p2
              WHERE p1.email = p2.email AND p1.id <> p2.id)
