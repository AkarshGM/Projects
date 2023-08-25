USE sakila;

-- Task 1 Extract data of Customers who are inactive

SELECT * FROM customer WHERE active=0;

-- Task 2 Identify Fist name, Last name of inactive customers

SELECT first_name, last_name, email, active FROM customer WHERE active = 0;

-- Task 3 Identify store ID having highest number of inactive customers

SELECT count(store_id) as 'Count', store_id FROM customer WHERE active = 0 GROUP BY store_id;


-- Task 4 Identify names of movies rated PG -13

SELECT title as 'Movie Name', rating FROM film WHERE rating = 'PG-13';

-- Task 5 Identify Top 3 movies with PG-13 rating that have longest running time

SELECT title as 'Movie Name', rating, length as 'Run Time' FROM film WHERE rating = 'PG-13' ORDER BY length DESC  LIMIT 3;

-- Task 6 Find most popular PG-13 Movies based on rental duration (Popular movies do not have longer rental duration)

SELECT title as 'Movie Name', rating, rental_duration as 'Least Rental Duration' FROM film WHERE rating = 'PG-13' ORDER BY rental_duration;

-- Task 7 Find the average rental cost of all the movies

SELECT avg(rental_rate) as 'Average Rental Cost of all the Movies' FROM film;

-- Task 8 Find total replacement cost of all movies

SELECT Sum(replacement_cost) as 'Total Replacement Cost of all Movies' FROM film;

-- Task 9 Identify Number of Films from Animation and Children category

SELECT category_id, name FROM category WHERE category_id = '2' OR category_id = '3';

SELECT count(category_id) AS 'Count', category_id FROM film_category GROUP BY category_id HAVING category_id = '3' OR category_id = '2';



