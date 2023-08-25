-- CASE STUDY : Sakila Movie Rental Store Data
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));   -- to turn off ONLY FULL GROUP BY
-- Task 1
Use sakila;

SELECT first_name, last_name, actor_id, last_update FROM actor;

-- Task 2A

SELECT concat(first_name, ' ', last_name) as 'Full Name' FROM actor;

-- Task 2B

SELECT first_name, count(first_name) AS 'Count of Repeated first names' FROM actor GROUP BY first_name ORDER BY count(first_name) DESC;

-- Task 2C

SELECT last_name, count(last_name) AS 'Count of Repeated last names' FROM actor GROUP BY last_name ORDER BY count(last_name) DESC;

-- Task 3

SELECT rating as 'Rating', count(title) as 'Count of Movies' FROM film GROUP BY rating ORDER BY count(title) DESC;

-- Task 4

SELECT rating as 'Rating', AVG(rental_rate) as 'Average  Rent Rate (in $)' FROM film GROUP BY rating ORDER BY AVG(rental_rate) DESC ;

-- Task 5A

SELECT title, replacement_cost FROM film WHERE replacement_cost <= 9;   -- There are no movie titles whose replacement cost is upto $9. The minimumn replacement cost is $9.99

-- Task 5B

SELECT title, replacement_cost FROM film WHERE replacement_cost BETWEEN 15 and 20 ORDER BY replacement_cost;

-- Task 5C

SELECT title, MAX(replacement_cost) as 'Highest replacement cost', MIN(rental_rate) as 'Lowest rental cost' FROM film
GROUP BY title ORDER BY MAX(replacement_cost) DESC, MIN(rental_rate) ASC;

-- Task 6

SELECT title, count(actor.actor_id) as 'Number of actors' FROM film
INNER JOIN film_actor ON film.film_id = film_actor.film_id
INNER JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE film.film_id IN (SELECT film_id FROM film_actor WHERE actor_id IN (
SELECT actor_id FROM actor)) GROUP BY title;

-- TASK 7

SELECT title FROM film WHERE title LIKE 'K%' OR title LIKE'Q%';

-- Task 8

SELECT title, group_concat(concat(first_name,' ', last_name)) as 'Full Name' FROM film
INNER JOIN film_actor ON film.film_id = film_actor.film_id
INNER JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE title = 'Agent Truman' AND film.film_id IN (SELECT film_id FROM film_actor WHERE actor_id IN (
SELECT actor_id FROM actor)) GROUP BY 'Full name';

-- Task 9

SELECT title AS 'Names of Movies', category.name AS 'Category' FROM film
JOIN film_category
JOIN category
ON film.film_id = film_category.film_id 
AND film_category.category_id = category.category_id
WHERE name = 'Family' GROUP BY title;

-- Task 10

SELECT title as 'Movies', rental_duration as 'Frequently rented' FROM film ORDER BY rental_duration DESC;

-- Task 11

SELECT count(category.name) as 'Number of Movie categories', avg(replacement_cost - rental_rate) as 'Average Difference' FROM film
JOIN film_category
JOIN category
ON film.film_id = film_category.film_id 
AND film_category.category_id = category.category_id
GROUP BY name HAVING 'Average Difference' > '15';

-- Task 12

SELECT name as 'Names of Categories/Genres', count(title) as 'Number of Movies' FROM film
JOIN film_category
JOIN category
ON film.film_id = film_category.film_id 
AND film_category.category_id = category.category_id
GROUP BY name ORDER BY count(title) DESC;














