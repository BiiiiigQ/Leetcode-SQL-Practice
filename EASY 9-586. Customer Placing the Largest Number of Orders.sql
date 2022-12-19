
-- ANSWER 1: LIMIT
-- only one customer has placed more orders than any other customers

--<1>
SELECT customer_number
FROM
(
    SELECT customer_number, COUNT(order_number) AS count_order 
    FROM Orders
    GROUP BY customer_number
) AS o
ORDER BY count_order DESC
LIMIT 1

--<2>
SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(order_number) DESC
LIMIT 1

*************************************************************************

-- ANSWER 2: 
-- if we have more than 1 customers who have placed the most orders

--<1>

WITH cte AS
(
    SELECT customer_number, COUNT(order_number) AS count_order
    FROM Orders o
    GROUP BY customer_number
)


SELECT customer_number
FROM cte
WHERE count_order = 
(
    SELECT MAX(count_order) AS max_count_order
    FROM cte
)

--<2>

SELECT customer_number
FROM Orders 
GROUP BY customer_number
HAVING COUNT(order_number) = (
                                SELECT MAX(cnt_order)
                                FROM
                                (
                                    SELECT customer_number, COUNT(order_number) AS cnt_order
                                    FROM Orders
                                    GROUP BY customer_number
                                ) AS o
                              )

-- ANSWER 3: 
-- if we have more than 1 customers who have placed the most orders

WITH cte AS
(
    SELECT customer_number, COUNT(order_number) AS cnt_order
    FROM Orders
    GROUP BY customer_number
)

SELECT customer_number
FROM cte
WHERE cnt_order >= ALL (SELECT cnt_order
                        FROM cte)

