-- 1
SELECT * 
FROM actor
WHERE first_name = "Scarlett";

-- 2
SELECT COUNT(DATEDIFF(return_date, rental_date)) as 'avaiable_for rent'
FROM rental
WHERE DATEDIFF(return_date, rental_date) = 0;

SELECT COUNT((DATEDIFF(return_date, rental_date))) as 'rented'
FROM rental
WHERE DATEDIFF(return_date, rental_date) > 0;

Select COUNT(*)
FROM film;

Select DISTINCT COUNT(*)
from rental;

-- 3
SELECT MAX(length) as "max_duration", MIN(length) as "min_duration"
FROM film;

-- 4
SELECT SEC_TO_TIME(AVG(length*60))
FROM film;

-- 5
SELECT COUNT(DISTINCT last_name)
FROM actor;

-- 6
SELECT store_id, DATE(last_update), CURDATE(), DATEDIFF(CURDATE(),last_update) as "days_operated" 
From store;

-- 7
SELECT *, date_format((rental_date), '%M') as 'rental_month', date_format((rental_date), '%W') as 'rental_week'
FROM rental
LIMIT 20;

-- 8
SELECT *, date_format((rental_date), '%M') as 'rental_month', date_format((rental_date), '%W') as 'rental_week',
CASE
WHEN 'rental_week' = "Saturday" then "weekend"
WHEN 'rental_week' = "Sunday" then "weekend"
ELSE 'workday'
End as "day_type"
FROM rental
LIMIT 20;

-- 9
SELECT DISTINCT(release_year)
FROM film;

-- 10
SELECT *
FROM film
WHERE title LIKE "%ARMAGEDDON%";

-- 11
SELECT *
FROM film
WHERE title LIKE "%APOLLO";

-- 12
SELECT *
FROM film
ORDER BY length DESC
LIMIT 10;

-- 13
SELECT COUNT(*)
FROM film
WHERE special_features LIKE "%Behind the Scenes%";

