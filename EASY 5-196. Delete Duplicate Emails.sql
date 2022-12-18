-- ANSWER 1: WINDOW FUNCTION
--           only keeps the smallest id for every unique email

DELETE 
FROM Person
WHERE id NOT IN (SELECT MIN(id) OVER(PARTITION BY email)
                 FROM (SELECT * FROM Person) AS p)


-- ANSWER 2: GROUP BY
--           only keeps the smallest id for every unique email

DELETE 
FROM Person
WHERE id NOT IN (SELECT MIN(id)
                 FROM (SELECT * FROM Person) AS p
                 GROUP BY email)


-- ANSWER 3: GROUP BY
--           only keeps the smallest id for every unique email

DELETE
FROM Person
WHERE id IN (SELECT p2.id
             FROM (SELECT * FROM Person) p1
                INNER JOIN (SELECT * FROM Person) p2
                        ON p1.email = p2.email AND p1.id <> p2.id
             WHERE p1.id < p2.id)
