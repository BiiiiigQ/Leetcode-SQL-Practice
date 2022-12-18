-- ANSWER 1: LEFT OUTER JOIN

SELECT c.name AS Customers
FROM Customers c
    LEFT OUTER JOIN Orders o
                 ON c.id = o.customerId
WHERE o.id IS NULL


-- ANSWER 2: SUBQUERY, NOT EXISTS

SELECT c.name AS Customers
FROM Customers c
WHERE NOT EXISTS (SELECT 1
                  FROM Orders o
                  WHERE c.id = o.customerId)


-- ANSWER 3: SUBQUERY, NOT IN

SELECT name AS Customers
FROM Customers c
WHERE id NOT IN (SELECT customerId
                 FROM Orders)
