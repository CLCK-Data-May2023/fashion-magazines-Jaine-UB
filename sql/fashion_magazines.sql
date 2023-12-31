SELECT customer_name AS "Customer", PRINTF("$%2.f.00", sum(unpaid.totaldue)) AS "Amount Due"
FROM customers
C JOIN(
SELECT orders.customer_id, subscriptions.price_per_month*subscriptions.subscription_length as totaldue,
orders.order_status
FROM orders 
JOIN subscriptions ON orders.subscription_id = subscriptions.subscription_id
WHERE orders.order_status = "unpaid" and subscriptions.description = "Fashion Magazine" ) unpaid ON c.customer_id = unpaid.customer_id
GROUP BY customer_name;