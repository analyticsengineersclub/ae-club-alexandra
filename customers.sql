SELECT 
    O.customer_id
    ,C.name
    ,C.email
    ,MIN(created_at) AS first_order_at
    ,COUNT(customer_id) AS number_of_orders
FROM `analytics-engineers-club.coffee_shop.orders` as O
LEFT JOIN `analytics-engineers-club.coffee_shop.customers` as C 
ON O.customer_id = C.id
GROUP BY O.customer_id
    ,C.name
    ,C.email
ORDER BY first_order_at
limit 5;
