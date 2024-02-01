-- 1. List all customers who live in Texas (use JOINs)  

SELECT first_name, last_name, district FROM customer
JOIN address ON address.address_id = customer.address_id
WHERE address.district = 'Texas'


SELECT * FROM country

-- 2. Get all payments above $6.99 with the Customer's FullName

SELECT first_name, last_name, amount FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
WHERE amount > 6.99

-- 3. Show all customers names who have made payments over $175(use subqueries)

SELECT first_name, last_name FROM customer
WHERE customer_id IN (
    SELECT customer_id FROM payment
    GROUP BY first_name, last_name, customer_id
    HAVING SUM(amount) > 175
)

-- 4. List all customers that live in Nepal (use the city table)

SELECT first_name, last_name, country FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
WHERE country.country = 'Nepal'


-- 5. Which staff member had the most transactions?

SELECT first_name, last_name, COUNT(*) FROM staff
JOIN payment ON staff.staff_id = payment.staff_id
GROUP BY first_name, last_name
ORDER BY count DESC

-- A) Jon had the most transactions

-- 6. How many movies of each rating are there?

SELECT rating, COUNT(*) from film
GROUP BY rating
ORDER BY count

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)

SELECT first_name FROM customer
WHERE customer_id IN (
    SELECT customer_id FROM payment
    WHERE amount > 6.99
    GROUP BY first_name, customer_id
    HAVING COUNT(*) = 1
)

-- 8. How many free rentals did our stores give away?

SELECT COUNT(*) FROM payment
WHERE amount = 0

 -- A) 24 free rentals