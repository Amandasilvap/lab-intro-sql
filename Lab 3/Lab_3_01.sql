-- Lab 3.01

USE sakila;

-- activity 1

ALTER TABLE staff
DROP COLUMN picture;

-- activity 2

SELECT * FROM customer
WHERE first_name = "Tammy";

SELECT * FROM staff;

INSERT INTO staff (first_name, last_name,address_id, store_id, active, username)
VALUES
("Tammy", "Sanders", 79, 2, 1, "Tammy");

UPDATE staff
SET email = "Tammy.Sanders@sakilastaff.com"
WHERE staff_id = 3;

-- activity 3
select * from customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

select * from inventory
where film_id = 1;

select * from film
where title = "Academy Dinosaur";

SELECT * FROM staff;

INSERT INTO rental (inventory_id,customer_id, staff_id)
VALUES
(9,130, 1);

select * from rental
WHERE customer_id = 130;

 




