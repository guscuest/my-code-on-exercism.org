-- Schema: CREATE TABLE "difference-of-squares" ("number" INT, "property" TEXT, "result" INT);
-- Task: update the difference-of-squares table and set the result based on the number and property fields.

WITH RECURSIVE CTE_Sum (number, property, sum, i) AS (  
  SELECT number, property, 0, 1 FROM "difference-of-squares"
  UNION ALL  
  SELECT number, property, sum + i, i + 1
  FROM CTE_Sum
  WHERE i <= number AND property = "squareOfSum"
)
INSERT INTO "difference-of-squares" (number, property, result) 
SELECT
  t.number,
  t.property,
  POWER(c.total_sum, 2) AS c_result
FROM
  "difference-of-squares" t
JOIN (
  SELECT
    number,
    property,
    MAX(sum) AS total_sum
  FROM CTE_Sum
  GROUP BY number
) AS c
ON t.number = c.number
WHERE t.property = "squareOfSum";

WITH RECURSIVE CTE_SumOf (number, property, sum, i) AS (  
  SELECT number, property, 0, 1 FROM "difference-of-squares"
  UNION ALL  
  SELECT number, property, sum + POWER(i, 2), i + 1
  FROM CTE_SumOf
  WHERE i <= number AND property = "sumOfSquares"
)
INSERT INTO "difference-of-squares" (number, property, result) 
SELECT
  t.number,
  t.property,
  c.total_sum AS c_result
FROM
  "difference-of-squares" t
JOIN (
  SELECT
    number,
    property,
    MAX(sum) AS total_sum
  FROM CTE_SumOf
  GROUP BY number
) AS c
ON t.number = c.number
WHERE t.property = "sumOfSquares";

DELETE FROM "difference-of-squares"
WHERE property = "squareOfSum"
AND result = "" OR NULL;

DELETE FROM "difference-of-squares"
WHERE property = "sumOfSquares"
AND result = "" OR NULL;

INSERT INTO "difference-of-squares" (number, property, result) 
SELECT
    t1.number,
    "differenceOfSquares",
    t1.result - t2.result AS result_difference
FROM "difference-of-squares" AS t1
JOIN "difference-of-squares" AS t2
  ON t1.number = t2.number
  WHERE t1.property = "squareOfSum" AND t2.property = "sumOfSquares";

SELECT * FROM "difference-of-squares";
