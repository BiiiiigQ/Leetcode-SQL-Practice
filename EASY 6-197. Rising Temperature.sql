-- ANSWER 1: LEFT OUTER JOIN

SELECT w2.id
FROM Weather w1
    LEFT OUTER JOIN Weather w2
                 ON w2.recordDate = DATE_ADD(w1.recordDate, INTERVAL 1 DAY)
WHERE w2.temperature > w1.temperature


-- ANSWER 2: SUBQUERY, DATE_ADD()

SELECT w1.id
FROM Weather w1
WHERE w1.temperature > (SELECT w2.temperature
                        FROM Weather w2
                        WHERE w2.recordDate = DATE_ADD(w1.recordDate, INTERVAL -1 DAY))

-- ANSWER 3: SUBQUERY, DATEDIFF()

SELECT w1.id
FROM Weather w1
WHERE w1.temperature > (SELECT w2.temperature
                        FROM Weather w2
                        WHERE DATEDIFF(w1.recordDate, w2.recordDate)=1)


-- ANSWER 4: WINDOW FUNCTION
SELECT id
FROM
(
    SELECT id, recordDate, temperature,
           DATEDIFF(recordDate, LAG(recordDate) OVER(ORDER BY recordDate)) AS date_gap,
           temperature - LAG(temperature) OVER(ORDER BY recordDate) AS temp_gap
    FROM Weather
) AS w
WHERE date_gap = 1 AND temp_gap > 0



-- 本题是要根据题目中给出的条件：previous date，来链接两个表格（两个表格实际上都是同一个表格，self comparison）。
-- 通过条件链接好两个表格的信息以后，在根据给出的条件判断是否留下本行
