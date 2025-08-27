-- Schema: CREATE TABLE "darts" ("x" REAL, "y" REAL, score INTEGER);
-- Task: update the darts table and set the score based on the x and y values.

alter table darts
add column distance;

update darts
set distance = sqrt(power(x, 2) + power(y, 2));

update darts
set score = 10
where distance <= 1;

update darts
set score = 5
where distance > 1 and distance <= 5;

update darts
set score = 1
where distance > 5 and distance <= 10;

update darts
set score = 0
where distance > 10;
