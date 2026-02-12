-- ##### customer tickets #####
/*
SELECT films.title AS film_title, screen, tickets.price AS price
FROM customers
LEFT JOIN tickets ON customers.customer_id=tickets.customer_id
LEFT JOIN screenings ON tickets.screening_id=screenings.screening_id
JOIN films ON screenings.film_id=films.film_id
WHERE customers.customer_id=2
--GROUP BY customers.customer_id
;
--*/
--SELECT films.title as film_title, screen, tickets.price as price FROM customers LEFT JOIN tickets ON customers.customer_id=tickets.customer_id LEFT JOIN screenings ON tickets.screening_id=screenings.screening_id LEFT JOIN films on screenings.film_id=films.film_id GROUP BY customers.customer_id HAVING customers.customer_id=2;
/*
SELECT s.title AS film_title, screen, tickets.price AS price
FROM customers
LEFT JOIN tickets ON customers.customer_id=tickets.customer_id
LEFT JOIN (SELECT * FROM screenings JOIN films ON screenings.film_id=films.film_id) s ON tickets.screening_id=s.screening_id
WHERE customers.customer_id=2
--GROUP BY customers.customer_id
;
--*/
-- ##########WORKING######### |
--                            V
--SELECT s.title AS film_title, screen, tickets.price AS price FROM customers LEFT JOIN tickets ON customers.customer_id=tickets.customer_id LEFT JOIN (SELECT * FROM screenings JOIN films ON screenings.film_id=films.film_id) s ON tickets.screening_id=s.screening_id WHERE customers.customer_id=2;



--SELECT tickets.ticket_id FROM customers LEFT JOIN tickets ON customers.customer_id=tickets.customer_id GROUP BY customers.customer_id HAVING customers.customer_id=2;
--86

--SELECT screenings.screening_id FROM screenings LEFT JOIN tickets ON screenings.screening_id=tickets.screening_id GROUP BY tickets.ticket_id HAVING tickets.ticket_id=86;

--SELECT screenings.screening_id, title, COUNT(tickets.ticket_id) FROM screenings LEFT JOIN tickets ON screenings.screening_id=tickets.screening_id LEFT JOIN films ON screenings.film_id=films.film_id GROUP BY screenings.screening_id;

--SELECT films.title, screenings.screening_id FROM screenings LEFT JOIN films ON screenings.film_id=films.film_id GROUP BY films.film_id;

-- ##### screening sales #####
--SELECT screenings.screening_id, title, COUNT(tickets.ticket_id) as tickets_sold FROM screenings LEFT JOIN tickets ON screenings.screening_id=tickets.screening_id LEFT JOIN films ON screenings.film_id=films.film_id GROUP BY screenings.screening_id ORDER BY tickets_sold DESC;

-- ##### customers by spend #####
SELECT customer_name, SUM(tickets.price) as total_spent FROM customers JOIN tickets ON customers.customer_id=tickets.customer_id GROUP BY customers.customer_id ORDER BY total_spent DESC LIMIT 3;