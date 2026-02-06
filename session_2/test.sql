--SELECT order_id FROM orders JOIN customers ON orders.customer_id=customers.customer_id GROUP BY customers.email HAVING customers.email='lmartin@example.com';
--amccarthy@example.com
--SELECT order_id FROM orders JOIN customers ON orders.customer_id=customers.customer_id GROUP BY customers.email HAVING customers.email='amccarthy@example.com';
--SELECT order_id FROM orders JOIN customers ON orders.customer_id=customers.customer_id GROUP BY customers.email HAVING customers.email='paula42@example.org';
--SELECT order_id FROM orders JOIN customers ON orders.customer_id=customers.customer_id GROUP BY customers.email HAVING customers.email='carl19@example.com';
--SELECT order_id FROM orders JOIN customers ON orders.customer_id=customers.customer_id GROUP BY customers.email HAVING customers.email='';
--SELECT order_id FROM orders JOIN customers ON orders.customer_id=customers.customer_id GROUP BY customers.email HAVING customers.email='';
--SELECT order_id FROM orders JOIN customers ON orders.customer_id=customers.customer_id GROUP BY customers.email HAVING customers.email='';
--SELECT order_id FROM orders JOIN customers ON orders.customer_id=customers.customer_id GROUP BY customers.email HAVING customers.email='';
--SELECT order_id FROM orders JOIN customers ON orders.customer_id=customers.customer_id GROUP BY customers.email HAVING customers.email='';
--SELECT order_id FROM orders JOIN customers ON orders.customer_id=customers.customer_id GROUP BY customers.email HAVING customers.email='';
--SELECT order_id FROM orders JOIN customers ON orders.customer_id=customers.customer_id WHERE customers.email='lmartin@example.com';
/*
amccarthy@example.com
amelia37@example.org
ataylor@example.com
barberhugh@example.com
barkermohammad@example.com
bsmith@example.net
cameronharris@example.org
carl19@example.com
charliebarnett@example.org
clairetaylor@example.com
denisewilkinson@example.org
donaldhowarth@example.org
douglaskhan@example.net
emma19@example.org
flynnangela@example.org
francesca01@example.org
gillian75@example.net
griffinirene@example.org
holdendenise@example.org
iwilson@example.net
jacksonjason@example.org
jonesyvonne@example.com
jsmith@example.com
justinmoss@example.net
lawrencecarolyn@example.com
lawrencewheeler@example.com
lday@example.net
leesjordan@example.org
leigh26@example.net
lmartin@example.com
lwilliams@example.org
lynnestewart@example.net
marcwalker@example.net
murphyjack@example.org
nanderson@example.com
nwatson@example.com
omann@example.org
patrick93@example.com
paula42@example.org
sally47@example.com
samanthasmith@example.org
stephenstevens@example.net
thomasfrancis@example.com
uevans@example.org
valerie11@example.org
westondawn@example.com
wnaylor@example.org
xgreen@example.org
xjones@example.com
yvonne33@example.net
*/

/*
2|amelia37@example.org
4|ataylor@example.com
4|barberhugh@example.com
5|barkermohammad@example.com
2|bsmith@example.net
2|cameronharris@example.org
*/
--lmartin@example.com

--SELECT SUM(total_amount) FROM customers LEFT JOIN orders ON orders.customer_id=customers.customer_id GROUP BY orders.customer_id ORDER BY SUM(total_amount) DESC LIMIT 5;

/*SELECT category, COUNT(orders.order_id)
FROM products
LEFT JOIN order_items ON products.product_id=order_items.product_id
LEFT JOIN orders ON order_items.order_id=orders.order_id
GROUP BY category
;*/
--SELECT category, COUNT(orders.order_id) FROM products LEFT JOIN order_items ON products.product_id=order_items.product_id LEFT JOIN orders ON order_items.order_id=orders.order_id GROUP BY category;


--SELECT orders.order_id,COUNT(order_items.product_id) as items FROM orders LEFT JOIN order_items ON orders.order_id=order_items.order_id GROUP BY orders.order_id;
--SELECT AVG(items) FROM (SELECT orders.order_id,COUNT(order_items.product_id) as items FROM orders LEFT JOIN order_items ON orders.order_id=order_items.order_id GROUP BY orders.order_id);

SELECT category, SUM(orders.total_amount) as category_revenue FROM products LEFT JOIN order_items ON products.product_id=order_items.product_id LEFT JOIN orders ON order_items.order_id=orders.order_id GROUP BY category;