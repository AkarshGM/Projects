-- Movie Rental Data Analysis

-- TASK 1 Display the full names of actors avalable in the database

Use sakila;

SELECT concat(first_name,' ', last_name) AS 'Full Name of Actors' FROM actor;

-- TASK 2A Display the number of times each first name appears in the database

SELECT first_name, COUNT(*) AS count FROM actor GROUP BY first_name;

-- TASK 2B Count of actors that have unique first names in the database. Display the first names of all these actors

SELECT COUNT(*) AS 'Count of Unique first names' FROM 
	(SELECT first_name, COUNT(*) AS name_count FROM actor
    GROUP BY first_name
    HAVING name_count = 1) AS unique_names;


SELECT COUNT(*) AS count, first_name FROM actor
GROUP BY first_name
HAVING COUNT(*) = 1;

-- TASK 3A Display the number of times each last name appears in the database

SELECT last_name, COUNT(*) AS count FROM actor
GROUP BY last_name;

-- TASK 3B Display all unique last names in the database

SELECT DISTINCT last_name FROM actor;

-- TASK 4A Display the list of records for the movies with the rating 'R'

SELECT * FROM film 
WHERE rating = 'R';

-- TASK 4B Display the list of records for the movies that are not rated 'R'

SELECT * FROM film
WHERE rating != 'R';

-- TASK 4C Display the list of records for the movies that are suitable for audience below 13 years of age

SELECT * FROM film
WHERE rating = 'PG-13';

-- TASK 5A Display the list of records for the movies where the replacement cost is up to $11

SELECT * FROM film
 WHERE replacement_cost <= 11;

-- TASK 5B Display the list of records for the movies where the replacement cost is between $11 and $20

SELECT * FROM film
 WHERE replacement_cost BETWEEN 11 AND 20;
 
 -- TASK 5C Display the list of records for all the movies in descending order of their replacement costs
 
 SELECT * FROM film
 ORDER BY replacement_cost DESC;
 
 -- TASK 6 Display the names of the Top 3 movies with the greatest number of actors
 
 SELECT title AS 'Movie Title', COUNT(*) AS actor_count FROM film
 JOIN film_actor
 JOIN actor
 ON film.film_id = film_actor.film_id
 AND film_actor.actor_id = actor.actor_id
 GROUP BY film.title ORDER BY actor_count DESC LIMIT 3;
 
 -- TASK 7 Display the titles of the movies with the letters 'K' and 'Q'
 
 SELECT title AS 'Movie Title' FROM film 
 WHERE title REGEXP '^K' OR title REGEXP '^Q';
 
 -- TASK 8 Display the names of all actors who appeared in this film
 
 SELECT concat(first_name,' ', last_name) AS 'Name of the actor' FROM actor
 JOIN film_actor
 JOIN film
 ON film.film_id = film_actor.film_id
 AND film_actor.actor_id = actor.actor_id
 WHERE title = 'Agent Truman';
 
 -- TASK 9 Identify all the movies categorized as family films
 
 SELECT title AS 'Movie Title' FROM film
 JOIN film_category
 JOIN category
 ON film.film_id = film_category.film_id
 AND film_category.category_id = category.category_id
 WHERE name = 'Family';
 
 -- TASK 10A Display the max, min, avg rental rates of movies based on their ratings 
 
 SELECT rating, MAX(rental_rate) AS max_rate, MIN(rental_rate) AS min_rate, AVG(rental_rate) AS avg_rate FROM film
GROUP BY rating
ORDER BY avg_rate DESC;

-- TASK 10B Display the movies in descending order of their rental frequencies

SELECT title, COUNT(film.film_id) AS rental_frequency FROM film
JOIN rental
JOIN inventory
ON film.film_id = inventory.film_id
AND inventory.inventory_id = rental.inventory_id
GROUP BY title
ORDER BY rental_frequency DESC;

-- TASK 11 In how many film categories, the difference between the average film replacement cost and the average film rental rate is greater than $15 
	-- Display the list of all film categories identified above, along with the corresponding average film replacement cost and average film rental rate

SELECT c.category_id, c.name AS 'Film Category', AVG(f.replacement_cost) AS avg_replacement_cost, AVG(f.rental_rate) AS avg_rental_rate
FROM film AS f
JOIN film_category AS fc ON f.film_id = fc.film_id
JOIN category AS c ON fc.category_id = c.category_id
GROUP BY c.category_id, c.name
HAVING (AVG(f.replacement_cost) - AVG(f.rental_rate)) > 15;

-- TASK 12 Display the film categories in which the number of movies is greater than 70

SELECT c.category_id, c.name AS 'Film Category', COUNT(*) AS movie_count
FROM category AS c
JOIN film_category AS fc ON c.category_id = fc.category_id
GROUP BY c.category_id, c.name
HAVING COUNT(*) > 70;


 
 
 
