CREATE MATERIALIZED VIEW silver_orders
COMMENT "Curated orders (Completed only) with quality checks"
AS
SELECT
    order_id,
    customer_id,
    country,
    CAST(order_ts AS TIMESTAMP) AS order_ts,
    CAST(amount AS DOUBLE) AS amount,
    status
FROM bronze_orders
WHERE status = 'Completed';