-- Lab 5

-- 1. Write a query to display for each store its store ID, city, and country.
SELECT store_id, city, country
FROM store as s
JOIN address as a
USING (address_id)
JOIN city as c
USING (city_id)
JOIN country as co
USING (country_id);

-- 2. Write a query to display how much business, in dollars, each store brought in.
SELECT store_id, SUM(amount)
FROM store as s
JOIN inventory as i
USING (store_id)
JOIN rental as r
USING (inventory_id)
JOIN payment as p
USING (rental_id)
GROUP BY store_id;

-- 3. Which film categories are longest?
SELECT name as "category", AVG(length) as length
FROM film as f
JOIN film_category as fc
USING (film_id)
JOIN category as c
ON fc.category_id = c.category_id
GROUP BY name
ORDER BY length DESC;

-- 4. Display the most frequently rented movies in descending order.
SELECT title, Count(r.rental_id) as frequency
FROM film as f
JOIN inventory as i USING (film_id)
Join rental as r USING (inventory_id)
GROUP BY title
ORDER BY frequency DESC;

-- 5. List the top five genres in gross revenue in descending order.
SELECT name as genres, SUM(amount) as revenue
FROM category as c
JOIN film_category as fc USING (category_id)
JOIN inventory as i USING (film_id)
JOIN rental as r USING (inventory_id)
JOIN payment as p USING (rental_id)
GROUP BY name
ORDER BY revenue DESC
Limit 5;

-- 6. Is "Academy Dinosaur" available for rent from Store 1?
SELECT f.title, s.store_id
FROM film as f
JOIN inventory as i USING (film_id)
JOIN store as s USING (store_id)
JOIN rental as r USING (inventory_id)
WHERE title = "Academy Dinosaur" AND store_id = 1 AND rental_date IS NULL;


-- 7. Get all pairs of actors that worked together.

select concat(a.first_name, ' ', a.last_name), 
concat(b.first_name, ' ', b.last_name)
from 
film_actor a1
inner join film_actor a2 on 
	a1.film_id = a2.film_id
inner join actor a on a.actor_id = a1.actor_id
inner join actor b on b.actor_id = a2.actor_id
where a1.actor_id != a2.actor_id;

-- 8. Get all pairs of customers that have rented the same film more than 3 times.
select concat(c1.first_name, ' ', c1.last_name) as first_customer,
concat(c2.first_name, ' ', c2.last_name) as second_customer
from rental r1
inner join rental r2 on r1.inventory_id = r2.inventory_id
inner join inventory i1 on i1.inventory_id = r1.inventory_id
inner join inventory i2 on i2.inventory_id = r2.inventory_id
inner join customer c1 on c1.customer_id = r1.customer_id
inner join customer c2 on c2.customer_id = r2.customer_id
where r1.customer_id != r2.customer_id
group by first_customer, second_customer -- r1.customer_id, i1.film_id, r2.customer_id
having count(r1.customer_id) > 3;

-- 9. For each film, list actor that has acted in more films.

select fa1.film_id f1, 
(select group_concat(fa2.actor_id) 
	from film_actor fa2 
    where -- fa2.actor_id = fa1.actor_id 
    -- and 
    fa1.film_id != fa2.film_id
    group by fa1.actor_id) 
from film_actor fa1
group by fa1.film_id;
-- i can´t solve this one
