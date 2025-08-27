-- CREATE TABLE "twofer" ("input" TEXT, "response" TEXT);

UPDATE twofer SET response = "One for you, one for me."
WHERE LENGTH(input) < 1;

UPDATE twofer 
SET response = "One for " || input || ", one for me." 
WHERE LENGTH(input) > 1;

SELECT * FROM twofer;

--UPDATE twofer 
--SET response = "One for " + input + ", one for me."
--WHERE input IS 0 OR NOT NULL;
-- Task: update the twofer table and set the response based on the input.
