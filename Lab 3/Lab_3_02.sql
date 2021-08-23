-- Lab 3.02
USE sakila;

-- 1.How many copies of the film Hunchback Impossible exist in the inventory system?
SELECT title, COUNT(inventory_id)
FROM film f
INNER JOIN inventory i 
ON f.film_id = i.film_id
WHERE title = "Hunchback Impossible";

-- two other ways 

SELECT COUNT(inventory_id) AS 'n_copies'
	FROM inventory
	WHERE film_id IN 
	(SELECT film_id FROM film WHERE film_id = 
	(SELECT film_id FROM film WHERE title = 'Hunchback Impossible'));

SELECT COUNT(film_id)
FROM inventory
WHERE film_id = (SELECT film_id FROM film
				WHERE title = 'Hunchback Impossible');

-- 2.List all films whose length is longer than the average of all the films.

SELECT * FROM film
WHERE length > (
  SELECT avg(length)
  FROM film);


-- 3.Use subqueries to display all actors who appear in the film Alone Trip.

SELECT CONCAT(first_name,' ',last_name) AS 'actors_alone_trip'
	FROM actor
	WHERE actor_id IN 
	(SELECT actor_id FROM film_actor WHERE film_id = 
	(SELECT film_id FROM film WHERE title = 'Alone Trip'));

-- 4. Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
-- Identify all movies categorized as family films.

SELECT f.title AS 'Movie Title'
	FROM film f
	JOIN film_category fc USING (film_id)
	JOIN category c USING (category_id)
	WHERE c.name = 'Family';

-- 5. Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, 
-- you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.

SELECT concat(c.first_name,' ',c.last_name) as 'Name', c.email as 'E-mail'
	FROM customer c
	JOIN address a USING(address_id)
	JOIN city ci USING(city_id)
	JOIN country ct USING(country_id)
	WHERE ct.country = 'Canada';

-- using a subquerie / create a temporary table
CREATE TEMPORARY TABLE concat_country AS(
    SELECT concat(c.first_name,' ',c.last_name) as 'Name', c.email as 'E-mail', country
	FROM customer c
	JOIN address a USING(address_id)
	JOIN city ci USING(city_id)
	JOIN country ct USING(country_id));
    
SELECT * FROM concat_country
WHERE country = 'Canada';


-- another way too
SELECT CONCAT(first_name, ' ', last_name) AS Customer_Name, email
FROM customer
WHERE address_id IN (
	SELECT address_id FROM address WHERE city_id IN (
	SELECT city_id FROM city WHERE country_id IN (
    SELECT country_id FROM country WHERE country = 'Canada')));
    
-- 6. Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the 
-- most number of films. First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.
SELECT COUNT(film_id), actor_id
FROM film_actor
GROUP BY actor_id
ORDER BY COUNT(film_id) desc
LIMIT 1;

SELECT * 
FROM film 
JOIN film_actor USING(film_id) 
WHERE actor_id = 107;

-- 7. Films rented by most profitable customer. You can use the customer table and payment table to find the 
-- most profitable customer ie the customer that has made the largest sum of payments
SELECT SUM(amount), customer_id
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) desc;

SELECT title
FROM film
JOIN inventory USING(film_id)
JOIN rental USING(inventory_id)
WHERE customer_id IN (
SELECT customer_id
FROM payment
WHERE customer_id = 526);

-- 8. Customers who spent more than the average payments.

SELECT CONCAT(first_name,' ',last_name) as 'Name', email, amount FROM customer
JOIN payment USING(customer_id)
WHERE amount > (
  SELECT avg(amount)
  FROM payment);