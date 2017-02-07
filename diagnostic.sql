DROP DATABASE IF EXISTS "sql-diagnostic";
CREATE DATABASE "sql-diagnostic";
\pset pager 0
\c "sql-diagnostic"

-- Question 1. Create a table called `licensees` to hold data in columns surname, given_name, gender, height, weight, born_on, eye_color, hair_color.  See `data/licensees.csv` for example data.  Don't forget that all tables should have an id column as a unique identifier for a row.

CREATE TABLE licenses(
  id SERIAL PRIMARY KEY,
  surname TEXT
  given_name TEXT,
  gender TEXT,
  height INTEGER,
  weight INTEGER,
  born_on DATE,
  eye_color TEXT,
  hair_color TEXT
);
--I was getting a syntax error on the "g" in given_name and I don't have time to figure out why it is causing an issue

-- Question 2. Add `Bishop, Caren, f, 63, 132, 1943-09-26, Brown, Black` into the table of licensees.

--I think we need to include the context of what we are putting the new data into with INSERT INTO first and then write VALUE to give it the new additions, but not sure if this syntax is correct for putting in the new data

INSERT INTO licenses (surname, given_name, gender, height, weight, born_on, eye_color, hair_color) VALUE (Bishop, Caren, f, 63, 132, 1943-09-26, Brown, Black)

-- After completing questions 1 and 2 uncomment the following to load data from `data/licensees.csv` into the `licensees` table.

 licensees(surname,given_name,gender,height,weight,born_on,eye_color,hair_color) FROM './data/licensees.csv' WITH (FORMAT csv, HEADER true)

-- Question 3. Write a query to get all attributes of licensees with Hazel eye color and Brown or Black hair color.


SELECT * FROM licenses WHERE eye_color = 'Hazel' AND hair_color= 'Brown' OR 'Black'

-- Question 4. Make each of Marilynn Escobar and Chris Whaley one inch shorter. Look them up by their names.

--height is in whole numbers in the example, so I think I can just assign its height to height - 1. I am not sure how I would convert the units otherwise and do not have time to look it up

UPDATE licenses (height = height - 1) WHERE (given_name = 'Marilynn' AND surname = 'Escobar') AND (given_name = 'Chris' AND surname = 'Whaley')

-- Question 5. Remove Dylan Rich and Teresita Myers from the table of licensees.

DELETE FROM licenses WHERE (surname = 'Rich' AND given_name = 'DYLAN') AND (surname = 'TERESITA' AND given_name = 'MYERS')
