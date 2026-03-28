/* =============================================================================
                          DATA WAREHOUSE PROJECT
===============================================================================
Script Name : Bronze Layer Data Loading Script
Purpose     : Load raw data into Bronze Layer tables using BULK INSERT
Architecture: Medallion Architecture (Bronze → Silver → Gold)

Description:
This script loads raw source data from CSV files into the Bronze Layer tables.
The Bronze Layer stores data exactly as received from source systems with
minimal transformation.

Data Sources:
- CRM System
- ERP System

Loading Strategy:
1. Check if the target table exists.
2. Truncate the table to remove previous raw data.
3. Load fresh data using BULK INSERT from source CSV files.

Performance Tracking:
The script records the start time and end time to measure total
execution duration.

Note:
CSV files must be accessible by the SQL Server service account.
=============================================================================*/


/* =============================================================================
   SECTION 1: INITIALIZE EXECUTION TIMER
   =============================================================================
   Description:
   Capture the start time of the ETL loading process to measure
   script execution duration.
============================================================================= */

DECLARE @Start_time DATETIME;
SET @Start_time = GETDATE();



/* =============================================================================
   SECTION 2: LOAD DATA FROM CRM SOURCE SYSTEM
   =============================================================================
   Description:
   Load raw CRM data into Bronze Layer tables.
   Tables included:
   - bronze.cust_info
   - bronze.product_info
   - bronze.sales_details
============================================================================= */


-- ---------------------------------------------------------------------------
-- Load CRM Customer Information
-- Source File: cust_info.csv
-- ---------------------------------------------------------------------------

IF OBJECT_ID('bronze.cust_info','U') IS NOT NULL
    TRUNCATE TABLE bronze.cust_info;
GO

BULK INSERT bronze.cust_info
FROM 'D:\sql_data_warehouse_projects\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
WITH
(
    FIRSTROW = 2,            -- Skip header row
    FIELDTERMINATOR = ',',   -- CSV column delimiter
    ROWTERMINATOR = '\n'     -- End of row delimiter
);
PRINT '-----------------------------------------------------'
PRINT '>> ROWS Inserted  Successfully in bronze.cust_info Table'
PRINT '-----------------------------------------------------'

-- ---------------------------------------------------------------------------
-- Load CRM Product Information
-- Source File: prd_info.csv
-- ---------------------------------------------------------------------------

IF OBJECT_ID('bronze.product_info','U') IS NOT NULL
    TRUNCATE TABLE bronze.product_info;
GO

BULK INSERT bronze.product_info
FROM 'D:\sql_data_warehouse_projects\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

PRINT '-----------------------------------------------------'
PRINT '>> ROWS Inserted  Successfully in bronze.product_info Table'
PRINT '-----------------------------------------------------'


-- ---------------------------------------------------------------------------
-- Load CRM Sales Transaction Data
-- Source File: sales_details.csv
-- ---------------------------------------------------------------------------

IF OBJECT_ID('bronze.sales_details','U') IS NOT NULL
    TRUNCATE TABLE bronze.sales_details;
GO

BULK INSERT bronze.sales_details
FROM 'D:\sql_data_warehouse_projects\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);
PRINT '-----------------------------------------------------'
PRINT '>> ROWS Inserted  Successfully in bronze.sales_details Table'
PRINT '-----------------------------------------------------'


/* =============================================================================
   SECTION 3: LOAD DATA FROM ERP SOURCE SYSTEM
   =============================================================================
   Description:
   Load ERP system data into Bronze Layer tables.
   This data will later be integrated with CRM data in the Silver Layer.
============================================================================= */


-- ---------------------------------------------------------------------------
-- Load ERP Customer Demographic Data
-- Source File: CUST_AZ12.csv
-- ---------------------------------------------------------------------------

IF OBJECT_ID('bronze.CUST_AZ12','U') IS NOT NULL
    TRUNCATE TABLE bronze.CUST_AZ12;
GO

BULK INSERT bronze.CUST_AZ12
FROM 'D:\sql_data_warehouse_projects\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);
PRINT '-----------------------------------------------------'
PRINT '>> ROWS Inserted  Successfully in bronze.CUST_AZ12 Table'
PRINT '-----------------------------------------------------'



-- ---------------------------------------------------------------------------
-- Load ERP Customer Location Data
-- Source File: LOC_A101.csv
-- ---------------------------------------------------------------------------

IF OBJECT_ID('bronze.LOC_A101','U') IS NOT NULL
    TRUNCATE TABLE bronze.LOC_A101;
GO

BULK INSERT bronze.LOC_A101
FROM 'D:\sql_data_warehouse_projects\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);
PRINT '-----------------------------------------------------'
PRINT '>> ROWS Inserted  Successfully in bronze.LOC_A101 Table'
PRINT '-----------------------------------------------------'


-- ---------------------------------------------------------------------------
-- Load ERP Product Category Data
-- Source File: PX_CAT_G1V2.csv
-- ---------------------------------------------------------------------------

IF OBJECT_ID('bronze.PX_CAT_G1C2','U') IS NOT NULL
    TRUNCATE TABLE bronze.PX_CAT_G1C2;
GO

BULK INSERT bronze.PX_CAT_G1C2
FROM 'D:\sql_data_warehouse_projects\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

PRINT '-----------------------------------------------------'
PRINT '>> ROWS Inserted  Successfully in bronze.PX_CAT_G1C2 Table'
PRINT '-----------------------------------------------------'


/* =============================================================================
   SECTION 4: SCRIPT EXECUTION TIME
   =============================================================================
   Description:
   Capture the end time of the ETL process and calculate the total
   execution duration in seconds.
============================================================================= */


PRINT '-----------------------------------------------------'
PRINT 'Bronze leyer  Loaded Successfully'
print '====================================================='