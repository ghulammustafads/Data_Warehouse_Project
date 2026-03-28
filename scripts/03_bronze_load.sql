/* 
===============================================================================
                         DATA WAREHOUSE PROJECT
===============================================================================
Project        : Enterprise Data Warehouse Implementation
Architecture   : Medallion Data Architecture
Database       : SQL Server

Description:
This Data Warehouse is designed using the Medallion Architecture approach
to organize and manage data efficiently across multiple transformation layers.

Layers in the Architecture:

1. Bronze Layer (Raw / Ingestion Layer)
   - Stores raw data ingested directly from source systems.
   - Minimal transformation applied.
   - Data quality validation may occur during ingestion.

2. Silver Layer (Transformation Layer)
   - Data is cleaned, standardized, and normalized.
   - Business rules and transformations are applied.

3. Gold Layer (Analytics Layer)
   - Curated business-level datasets.
   - Optimized for reporting, dashboards, and analytics.

Source Systems:
- CRM System
- ERP System

Note:
Refer to the project workflow diagram for the complete data pipeline.
===============================================================================
*/


/* =============================================================================
   SECTION 1: BRONZE LAYER – CRM SOURCE TABLES
   =============================================================================
   Description:
   These tables store raw data ingested from the CRM source system.
   The structure closely follows the source schema with minimal modification.
   ============================================================================ */


-- ---------------------------------------------------------------------------
-- Table: bronze.cust_info
-- Description: Stores raw customer information extracted from the CRM system
-- ---------------------------------------------------------------------------

IF OBJECT_ID('bronze.cust_info','U') IS NOT NULL
    DROP TABLE bronze.cust_info;
GO

CREATE TABLE bronze.cust_info
(
    cst_id              INT,              -- Unique customer identifier
    cst_key             VARCHAR(50),     -- Customer business key from CRM
    cst_firstname       VARCHAR(50),     -- Customer first name
    cst_lastname        VARCHAR(50),     -- Customer last name
    cst_marital_status  VARCHAR(50),     -- Marital status of the customer
    cst_gndr            VARCHAR(50),     -- Gender of the customer
    cst_create_date     VARCHAR(50)      -- Customer record creation date
);



-- ---------------------------------------------------------------------------
-- Table: bronze.product_info
-- Description: Stores product master data from the CRM system
-- ---------------------------------------------------------------------------

IF OBJECT_ID('bronze.product_info','U') IS NOT NULL
    DROP TABLE bronze.product_info;
GO

CREATE TABLE bronze.product_info
(
    prd_id        INT,        -- Unique product identifier
    prd_key       VARCHAR(50),   -- Product business key from CRM
    prd_nm        VARCHAR(50),   -- Product name
    prd_cost      INT,        -- Product base cost
    prd_line      VARCHAR(3), -- Product line/category code
    prd_start_dt  DATE,       -- Product availability start date
    prd_end_dt    DATE        -- Product availability end date
);



-- ---------------------------------------------------------------------------
-- Table: bronze.sales_details
-- Description: Stores raw transactional sales data from CRM
-- ---------------------------------------------------------------------------

IF OBJECT_ID('bronze.sales_details','U') IS NOT NULL
    DROP TABLE bronze.sales_details;
GO

CREATE TABLE bronze.sales_details
(
    sls_ord_num    VARCHAR(50), -- Sales order number
    sls_prd_key    VARCHAR(50),      -- Product key related to the order
    sls_cust_id    INT,      -- Customer identifier placing the order
    sls_order_dt   INT,      -- Order date (stored as integer in source)
    sls_ship_dt    INT,      -- Shipping date
    sls_due_dt     INT,      -- Order due date
    sls_sales      INT,      -- Total sales amount
    sls_quantity   INT,      -- Quantity ordered
    sls_price      INT       -- Price per unit
);



/* =============================================================================
   SECTION 2: BRONZE LAYER – ERP SOURCE TABLES
   =============================================================================
   Description:
   These tables store raw data extracted from the ERP system.
   The data will later be integrated with CRM data in the Silver Layer.
   ============================================================================ */


-- ---------------------------------------------------------------------------
-- Table: bronze.CUST_AZ12
-- Description: Stores additional customer demographic data from ERP
-- ---------------------------------------------------------------------------

IF OBJECT_ID('bronze.CUST_AZ12','U') IS NOT NULL
    DROP TABLE bronze.CUST_AZ12;
GO

CREATE TABLE bronze.CUST_AZ12
(
    CID     VARCHAR(50),  -- Customer identifier from ERP system
    BDATE   DATE,      -- Customer birth date
    GEN     VARCHAR(50) -- Gender information
);



-- ---------------------------------------------------------------------------
-- Table: bronze.LOC_A101
-- Description: Stores customer location data from ERP
-- ---------------------------------------------------------------------------

IF OBJECT_ID('bronze.LOC_A101','U') IS NOT NULL
    DROP TABLE bronze.LOC_A101;
GO

CREATE TABLE bronze.LOC_A101
(
    CID     VARCHAR(50),  -- Customer identifier
    CNTRY   VARCHAR(50)   -- Customer country/location
);



-- ---------------------------------------------------------------------------
-- Table: bronze.PX_CAT_G1C2
-- Description: Stores product category and classification data from ERP
-- ---------------------------------------------------------------------------

IF OBJECT_ID('bronze.PX_CAT_G1C2','U') IS NOT NULL
    DROP TABLE bronze.PX_CAT_G1C2;
GO

CREATE TABLE bronze.PX_CAT_G1C2
(
    ID           VARCHAR(50),  -- Product identifier
    CAT          VARCHAR(50),  -- Product category
    SUBCAT       VARCHAR(50),  -- Product sub-category
    MAINTENANCE  VARCHAR(50)   -- Maintenance classification or service type
);

PRINT '==============================================='
PRINT ' Tables Created Successfully '
PRINT '==============================================='