USE sakila;
 
 -- 1 How many films are there for each of the categories in the category table. Use appropriate join to write this query.

SELECT *  FROM sakila.category;
SELECT *  FROM sakila.film_category;

SELECT name, count(film_id) 
FROM sakila.category c
JOIN sakila.film_category fc
ON fc.category_id = c.category_id
GROUP BY c.name;

-- 2 Display the total amount rung up by each staff member in August of 2005.
SELECT * from staff;
SELECT * from payment;
SELECT s.first_name as 'name', sum(p.amount), p.payment_date 
FROM sakila.staff s
JOIN sakila.payment p
ON s.staff_id = p.staff_id
WHERE p.payment_date LIKE '%2005-08%'
GROUP BY s.first_name;  

-- 3 Which actor has appeared in the most films?

SELECT * FROM actor;
SELECT * FROM film_actor;
SELECT a.actor_id, a.first_name, a.last_name, count(fa.film_id) as 'number of films'
FROM actor a
JOIN sakila.film_actor fa 
ON fa.actor_id = a.actor_id
GROUP BY a.actor_id 
ORDER BY count(fa.film_id) DESC;

-- 4 Most active customer (the customer that has rented the most number of films).

SELECT customer_id, count(i.film_id) AS 'number of films'
FROM rental r
JOIN inventory i USING (inventory_id)
GROUP BY customer_id
ORDER BY count(i.film_id) DESC;

-- 5 Display the first and last names, as well as the address, of each staff member.

SELECT s.first_name, s.last_name, a.address
FROM staff s
JOIN address a USING (address_id);

-- 6 List each film and the number of actors who are listed for that film.

SELECT f.film_id, f.title, count(fa.actor_id) AS 'number of actors'
FROM sakila.film f
JOIN sakila.film_actor fa USING(film_id)
GROUP BY f.film_id;

/* 7 Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
List the customers alphabetically by last name.*/

SELECT * FROM customer;
SELECT * FROM payment;

SELECT c.first_name, c.last_name, sum(p.amount) AS 'total_paid_by_customer'
FROM sakila.customer c
JOIN sakila.payment p USING(customer_id)
GROUP BY customer_id
ORDER BY sakila.c.last_name ASC;

-- 8 List number of films per category.

SELECT category_id AS category, count(category_id) AS 'number_of_films'
FROM film_category
GROUP BY category;


