CREATE DATABASE SCOPED CREDENTIAL cred_niam

WITH 
    IDENTITY = 'MANAGED IDENTITY'


CREATE EXTERNAL DATA SOURCE source_silver
WITH 
(
    LOCATION = 'https://chdatalake.blob.core.windows.net/silver',
    CREDENTIAL = cred_niam
)


CREATE EXTERNAL DATA SOURCE source_gold
WITH 
(
    LOCATION = 'https://chdatalake.blob.core.windows.net/gold',
    CREDENTIAL = cred_niam
)


CREATE EXTERNAL FILE FORMAT format_parquet
WITH
(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'

)

-------------------------
-- CREATE EXTERNAL TABLE 
-------------------------
CREATE EXTERNAL TABLE gold.Ingredients_
WITH
(
    LOCATION = 'ingredients',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)

AS 
SELECT * FROM gold.ingredients

CREATE EXTERNAL TABLE gold.Inventory_
WITH
(
    LOCATION = 'Inventory',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)

AS 
SELECT * FROM gold.inventory


CREATE EXTERNAL TABLE gold.Items_
WITH
(
    LOCATION = 'Items',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)

AS 
SELECT * FROM gold.items


CREATE EXTERNAL TABLE gold.Orders_
WITH
(
    LOCATION = 'orders',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)

AS 
SELECT * FROM gold.orders


CREATE EXTERNAL TABLE gold.Recipe_
WITH
(
    LOCATION = 'Recipe',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)

AS 
SELECT * FROM gold.recipe

