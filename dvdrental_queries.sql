-- 1. Film uzunluğu ortalamanın üstünde olan film sayısı
SELECT COUNT(*) AS count_above_avg
FROM film
WHERE length > (SELECT AVG(length) FROM film);


-- 2. En yüksek rental_rate değerine sahip film sayısı
SELECT COUNT(*) AS count_max_rate
FROM film
WHERE rental_rate = (SELECT MAX(rental_rate) FROM film);


-- 3. En düşük rental_rate ve en düşük replacement_cost'a sahip filmler
SELECT film_id, title, rental_rate, replacement_cost
FROM film
WHERE rental_rate = (SELECT MIN(rental_rate) FROM film)
  AND replacement_cost = (SELECT MIN(replacement_cost) FROM film)
ORDER BY title;


-- 4. En fazla alışveriş yapan müşterileri listeleme
SELECT customer_id, COUNT(*) AS payment_count
FROM payment
GROUP BY customer_id
ORDER BY payment_count DESC;
