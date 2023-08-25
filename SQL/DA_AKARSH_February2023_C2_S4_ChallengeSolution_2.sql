USE sakila;
-- PART TWO OF CHALLENGE: Movie Streaming via OTT 

-- Task 1 

SELECT film_id, title, count(title) as 'Number of Copies' FROM film
WHERE film_id IN ( SELECT film_id from film WHERE title = 'Brotherhood blanket' OR title = 'Soup Wisdom') GROUP BY Title;

-- Task 2

-- Using subqueries 
SELECT name, count(title) as 'Number of Movies' FROM film
INNER JOIN film_category ON film.film_id = film_category.film_id
INNER JOIN category ON category.category_id = film_category.category_id
WHERE film.film_id IN (SELECT film_id FROM film_category WHERE category_id IN (
SELECT category_id FROM category)) GROUP BY name;


-- Using JOINS
SELECT name as 'Genre', count(title) as 'Number of movies' from film
JOIN film_category
JOIN category
ON film_category.film_id = film.film_id
AND film_category.category_id = category.category_id
GROUP by name;

-- Task 3
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

SELECT concat(first_name,' ', last_name) as 'Actor', title as 'Movie Name', replacement_cost FROM film
INNER JOIN film_actor ON film.film_id = film_actor.film_id
INNER JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE film.film_id IN (SELECT film_id FROM film_actor WHERE actor_id In (
SELECT actor_id FROM actor)) GROUP BY first_name, last_name ORDER BY replacement_cost DESC LIMIT 3;

-- Task 4

SELECT category.name as 'Movie type', Sum(amount) as 'Total sale amount' FROM category
JOIN film_category
JOIN inventory
JOIN rental
JOIN payment
ON category.category_id = film_category.category_id
AND film_category.film_id = inventory.film_id
AND inventory.inventory_id = rental.inventory_id
AND rental.customer_id = payment.customer_id
GROUP BY name;

-- Task 5

SELECT category.name as 'Genre', Sum(amount) as 'Total Revenue' FROM category
JOIN film_category
JOIN inventory
JOIN rental
JOIN payment
ON category.category_id = film_category.category_id
AND film_category.film_id = inventory.film_id
AND inventory.inventory_id = rental.inventory_id
AND rental.customer_id = payment.customer_id
GROUP BY name ORDER BY 'Total Revenue' DESC LIMIT 10;

-- Output table exported as csv file from the result grid



