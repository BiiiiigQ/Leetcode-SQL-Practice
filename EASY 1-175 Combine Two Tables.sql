-- ***MY ANALYSIS AND ANSWER***

-- Key Points to Learn:
-- Left Outer Join


SELECT p.firstName, p.lastName, a.city, a.state
FROM Person p
    LEFT OUTER JOIN Address a
                 ON p.personId = a.personId


SELECT firstName, lastName,
       (SELECT city
        FROM Address a
        WHERE p.personId = a.personId) AS city,
       (SELECT state
        FROM Address a
        WHERE p.personId = a.personId) AS state
FROM Person p
