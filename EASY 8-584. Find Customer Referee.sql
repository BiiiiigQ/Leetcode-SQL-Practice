-- ANSWER 1: IFNULL()

SELECT name
FROM Customer
WHERE IFNULL(referee_id, 0) <> 2


-- ANSWER 2:

SELECT name
FROM Customer
WHERE referee_id IS NULL OR referee_id <> 2
