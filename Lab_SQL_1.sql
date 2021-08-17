SELECT * FROM actor;
SELECT * FROM address;    
SELECT * FROM category;
SELECT * FROM city;    
SELECT * FROM country;
SELECT * FROM customer;
SELECT * FROM film;
SELECT * FROM film_actor;
SELECT * FROM film_category;
SELECT * FROM film_text;
SELECT * FROM inventory;
SELECT * FROM language;
SELECT * FROM payment;
SELECT * FROM rental;
SELECT * FROM staff;
SELECT * FROM store;


SELECT title FROM film;


SELECT name as language
FROM language;

SELECT Count(store_id) 
FROM store;

SELECT Count(staff_id) 
FROM staff;

SELECT first_name as employee
FROM staff;

-- just test more data
SELECT title, name as language
FROM film as f
Left Join language as l
ON f.language_id = l.language_id;


