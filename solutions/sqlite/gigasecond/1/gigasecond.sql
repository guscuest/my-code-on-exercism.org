-- Schema: CREATE TABLE "gigasecond" ("moment" TEXT, "result" TEXT);
-- Task: update the gigasecond table and set the result based on the moment.

update gigasecond
set result = datetime(moment, '+1000000000 seconds');

update gigasecond
set result = substr(result, 1, 10) || "T" || substr(result, 12);