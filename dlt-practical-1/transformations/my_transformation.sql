CREATE OR REFRESH STREAMING TABLE bronze_raw_orders
COMMENT "This is order raw data"
AS
SELECT *
FROM STREAM(read_files(
  "/Volumes/dlt/default/dlt_files/orders",
  format => "json",
  inferColumnTypes => true,
  includeExistingFiles => true,
  schemaEvolutionMode => "addNewColumns"
));

CREATE OR REFRESH MATERIALIZED VIEW silver_orders
COMMENT "Curated orders (Completed only) with quality checks"
AS
SELECT
  order_id,
  customer_id,
  country,
  CAST(order_ts AS TIMESTAMP) AS order_ts,
  CAST(amount AS DOUBLE) AS amount,
  status
FROM bronze_raw_orders
WHERE status = 'Completed';

CREATE VIEW in_orders
COMMENT "India-only orders from Silver"
AS
SELECT *
FROM silver_orders
WHERE country = 'IN';