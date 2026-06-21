-- ============================================================
-- Create Gold Layer Views in Azure Synapse Serverless SQL Pool
---------------------------------------------------------------

-- Purpose:
-- These views provide a SQL endpoint over the Silver Parquet files
-- stored in ADLS Gen2. Instead of loading the data into physical
-- tables, OPENROWSET reads the Parquet files directly from storage.
--------------------------------------------------------------------

-- Benefits:
-- - No data duplication
-- - Near real-time access to Silver layer data
-- - Simplifies reporting and analytics
-- - Makes data easily consumable by Power BI and SQL users
-- ============================================================

-- ============================================================
-- Create Ingredients View
--------------------------

-- Reads ingredient data from the Silver layer Parquet files and
-- exposes it as a SQL view in the Gold schema.
-- ============================================================
CREATE VIEW gold.ingredients
AS
SELECT *
FROM OPENROWSET(
BULK 'https://chdatalake.blob.core.windows.net/silver/ingredients/',
FORMAT = 'PARQUET'
) AS QUERY1;

-- ============================================================
-- Create Inventory View
------------------------

-- Reads inventory data from the Silver layer Parquet files and
-- exposes it as a SQL view in the Gold schema.
-- ============================================================
CREATE VIEW gold.inventory
AS
SELECT *
FROM OPENROWSET(
BULK 'https://chdatalake.blob.core.windows.net/silver/inventory/',
FORMAT = 'PARQUET'
) AS QUERY2;

-- ============================================================
-- Create Items View
--------------------

-- Reads item data from the Silver layer Parquet files and exposes
-- it as a SQL view in the Gold schema.
-- ============================================================
CREATE VIEW gold.items
AS
SELECT *
FROM OPENROWSET(
BULK 'https://chdatalake.blob.core.windows.net/silver/items/',
FORMAT = 'PARQUET'
) AS QUERY3;

-- ============================================================
-- Create Orders View
---------------------

-- Reads order data from the Silver layer Parquet files and exposes
-- it as a SQL view in the Gold schema.
---------------------------------------

-- This view can be used for:
-- - Order reporting
-- - Sales analysis
-- - Customer purchasing trends
-- - Power BI dashboards
-- ============================================================
CREATE VIEW gold.orders
AS
SELECT *
FROM OPENROWSET(
BULK 'https://chdatalake.blob.core.windows.net/silver/orders/',
FORMAT = 'PARQUET'
) AS QUERY4;

-- ============================================================
-- Create Recipe View
---------------------

-- Reads recipe data from the Silver layer Parquet files and
-- exposes it as a SQL view in the Gold schema.
-----------------------------------------------

-- This view can be used to analyze:
-- - Ingredient usage
-- - Item-to-ingredient relationships
-- - Cost calculations
-- - Inventory consumption
-- ============================================================
CREATE VIEW gold.recipe
AS
SELECT *
FROM OPENROWSET(
BULK 'https://chdatalake.blob.core.windows.net/silver/recipe/',
FORMAT = 'PARQUET'
) AS QUERY5;
