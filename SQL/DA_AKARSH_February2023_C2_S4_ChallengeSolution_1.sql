USE world;
-- PART ONE OF CHALLENGE: ANALYSING THE WORLD'S POPULATION DATA

-- Task 1
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));    -- to turn off ONLY FULL GROUP BY

SELECT count(*) as 'Number_of_rows' from country;

SELECT  country.Name, country.Population FROM country
WHERE code IN (Select code FROM country WHERE country.code = 'USA' or code = 'GBR' or code = 'ARE')
GROUP BY Name ORDER BY population DESC;

-- Task 2

SELECT Continent, sum(population) as Sum_of_population FROM country 
GROUP BY Continent Order by population DESC;

-- Task 3

-- Using subqueries
SELECT Name, Continent FROM country
WHERE continent = 'Europe' AND code IN ( SELECT countrycode FROM countrylanguage WHERE language = 'French')
GROUP BY continent;

-- using JOINS
SELECT Name, continent, language from country
JOIN countrylanguage 
ON country.code = countrylanguage.countrycode
WHERE continent = 'Europe' AND language = 'French'
Group by continent;

-- Task 4

SELECT Continent, Name as 'Name of  Country', Population FROM country 
WHERE population IN (SELECT Max(population) FROM country
GROUP BY continent) ORDER BY population DESC LIMIT 7;






