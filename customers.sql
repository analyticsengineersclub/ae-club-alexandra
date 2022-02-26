/*Learnings:Create two subqueries to make the code more efficient (reduce the rows that need
to be joined), alias with full names for readability, put a space between aggregates */

WITH first_order AS (
    SELECT 
        orders.customer_id
    
        ,MIN(orders.created_at) AS first_order_at
        ,COUNT(orders.customer_id) AS number_of_orders
    FROM `analytics-engineers-club.coffee_shop.orders` as orders
    GROUP BY orders.customer_id
)

SELECT 
    customers.id
    ,customers.name
    ,customers.email
    ,first_order_at
    ,number_of_orders
FROM first_order
LEFT JOIN `analytics-engineers-club.coffee_shop.customers` as customers 
ON first_order.customer_id = customers.id
ORDER BY first_order_at --note: not all query editors support lateral aliases
limit 5;
