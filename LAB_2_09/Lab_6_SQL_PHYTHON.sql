-- 1.How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name)
FROM actor;

-- 2.Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *,  date_format((rental_date), '%W') as rental_week,
CASE
WHEN 'rental_week' = "Saturday" then "weekend"
WHEN 'rental_week' = "Sunday" then "weekend"
ELSE 'workday'
End as "day_type"
FROM rental
LIMIT 20;

-- 3.Get all films with ARMAGEDDON in the title.
SELECT *
FROM film
WHERE title LIKE "%ARMAGEDDON%";

-- 4.Get 10 the longest films.
SELECT *
FROM film
ORDER BY length DESC
LIMIT 10;

-- 5.How many films include Behind the Scenes content?
SELECT COUNT(*)
FROM film
WHERE special_features LIKE "%Behind the Scenes%";


-- 6.Which kind of movies (rating) have a mean duration of more than two hours?
SELECT name as category, rating, ROUND(AVG(length),2)
FROM film f
INNER JOIN film_category fc USING (film_id)
INNER JOIN category c USING (category_id)
GROUP BY rating, name
HAVING AVG(length) > 120;

-- 7.Rank films by length (filter out the rows that have nulls or 0s in length column). 
-- In your output, only select the columns title, length, and the rank.
SELECT title, length, rating
FROM film
WHERE length IS NOT NULL or length = 0
ORDER BY length DESC


