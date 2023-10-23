<<<<<<< HEAD
SELECT customer_name AS "Customer", PRINTF("$%3.f.00", unpaid.due) AS "Amount Due"
FROM customers
C JOIN
(SELECT orders.customer_id, subscriptions.price_per_month * subscriptions.subscription_length as due,
orders.order_status
FROM orders 
INNER JOIN subscriptions ON orders.subscription_id = subscriptions.subscription_id
WHERE orders.order_status = "unpaid" and subscriptions.description = "Fashion Magazine" ) unpaid ON c.customer_id = unpaid.customer_id
GROUP BY customer_name ;
=======
SELECT c.customer_name , sum(unpaid.due) 
FROM customers
C JOIN 
(SELECT o.customer_id, s.price_per_month*s.subscription_length AS due,
orders.order_status
FROM orders 
O JOIN subscriptions s ON o.subscription_id = s.subscription_id
WHERE o.order_status = "unpaid" AND s.descriptions = "Fashion Magazine" ) unpaid ON c.customer_id = unpaid.customer_id
GROUP BY c.customer_name
;

>>>>>>> a837795c3a79af6c25e4b87ab569a7dacd525fbb
