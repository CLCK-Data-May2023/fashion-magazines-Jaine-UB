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

