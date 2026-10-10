CREATE OR REPLACE TABLE development.lake.sales_orders_agg AS
SELECT customer_name,product,quantity
FROM development.lake.sales_orders
GROUP BY  customer_name, product, quantity
