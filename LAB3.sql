-- 1
SELECT first_name, last_name
FROM actor
GROUP BY first_name, last_name
Having COUNT(last_name) = 1;

-- 2
SELECT last_name, COUNT(last_name)
FROM actor
GROUP BY last_name
Having COUNT(last_name) > 1;

-- 3
SELECT staff_id, COUNT(rental_id) as "rental_processed"
FROM rental
GROUP BY staff_id;

-- 4
SELECT release_year, COUNT(film_id)
FROM film
GROUP BY release_year;

-- 5
SELECT rating, COUNT(film_id)
FROM film
GROUP BY rating;

-- 6 
SELECT ROUND(AVG(length),2), rating
FROM film
GROUP BY rating;

-- 7
SELECT rating, ROUND(AVG(length),2)
FROM film
GROUP BY rating
HAVING AVG(length) > 120;

-- 8
SELECT title, length, rating
FROM film
WHERE length IS NOT NULL or length = 0
ORDER BY length DESC
