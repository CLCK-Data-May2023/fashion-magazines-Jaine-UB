SELECT c.customer_name , sum (unpaid.due)
FROM customers
C JOIN (SELECT orders.customer_id,subscriptions.price_per_month*orders.subscription_length as due,
orders.order_status
FROM orders 
OUTER JOIN subscriptions ON orders.subscription_id = subscriptions.subscription_id
WHERE orders.order_status = "unpaid" and descriptions = "Fashion Magazine" ) unpaid ON customers.customer_id = unpaid.customer_id
GROUP BY customers.customer_name ; 










-- Add your sql here 