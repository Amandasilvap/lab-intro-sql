-- Lab 4

-- 1 - How many films are there for each of the categories in the category table. Use appropriate join to write this query.

SELECT name as "category", COUNT(film_id) as number_of_films
FROM film_category as fc
JOIN category as c
ON fc.category_id = c.category_id
GROUP BY name
ORDER BY number_of_films DESC;

-- 2 - Display the total amount rung up by each staff member in August of 2005.
SELECT first_name, r.staff_id as "staff_member", SUM(amount) as "Total Amount"
FROM payment as p
JOIN rental as r
ON p.rental_id = r.rental_id
JOIN staff s
ON s.staff_id = r.staff_id
WHERE rental_date LIKE "%2005-08%"
GROUP BY r.staff_id;

-- 3- Which actor has appeared in the most films?
SELECT concat(first_name," ", last_name) as actor, COUNT(DISTINCT film_id) as number_of_films
FROM actor as a
JOIN film_actor as fa
ON a.actor_id = fa.actor_id
GROUP BY concat(first_name," ", last_name)
ORDER BY number_of_films DESC;

-- 4- Most active customer (the customer that has rented the most number of films)
SELECT concat(first_name," ", last_name) as customer, COUNT(DISTINCT rental_id) as number_of_rentals
FROM customer as c
JOIN rental as r
ON c.customer_id = r.customer_id
GROUP BY concat(first_name," ", last_name)
ORDER BY number_of_rentals DESC;

-- 5- Display the first and last names, as well as the address, of each staff member.
SELECT concat(first_name," ", last_name) as staff, address, district
FROM staff as s
JOIN address as a
USING (address_id);

-- 6- List each film and the number of actors who are listed for that film.
SELECT title, COUNT(actor_id) as number_of_actors
FROM film as f
JOIN film_actor as fa
ON f.film_id = fa.film_id
GROUP BY title
ORDER BY number_of_actors DESC;

-- Just curious about this movies who has jut one actor lol
SELECT *
FROM film_text
WHERE film_id = "995";

-- 7- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT last_name as customer, SUM(amount) as total_amount
FROM customer as c
JOIN payment as p
USING (customer_id)
GROUP BY last_name
ORDER BY last_name ASC;


-- 8- List number of films per category. -- Is that the same the number 1, no?
SELECT name as "category", COUNT(film_id) as number_of_films
FROM film_category as fc
JOIN category as c
ON fc.category_id = c.category_id
GROUP BY name
ORDER BY number_of_films DESC;

