-- Schema: CREATE TABLE "grains" ("task" TEXT, "square" INT, "result" INT);
-- Task: update the grains table and set the result based on the task (and square fields).

update grains set result = power(2, square - 1) where task = "single-square";

update grains set result = /*(select sum(result) from grains) + */2 * (select result from grains where square = 64) where square = 0;

select * from grains;
