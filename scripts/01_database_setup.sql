/* =============================================================================
                                DATA WAREHOUSE PROJECT
===============================================================================
Project Name : Enterprise Data Warehouse Implementation
Database     : SQL Server
Architecture : Medallion Data Architecture (Bronze → Silver → Gold)

Project Description:
This project implements a modern Data Warehouse using the Medallion
Architecture approach. The goal is to ingest raw data from multiple
source systems and progressively refine it into analytics-ready datasets.

Data Warehouse Layers:

1. Bronze Layer (Raw / Ingestion Layer)
   - Stores raw data extracted from source systems.
   - Minimal transformation applied.
   - Data is stored in its original format for traceability.

2. Silver Layer (Cleansed / Transformation Layer)
   - Data is cleaned, standardized, and normalized.
   - Data quality checks and transformations are applied.

3. Gold Layer (Business / Analytics Layer)
   - Curated datasets optimized for reporting and analytics.
   - Used by BI tools, dashboards, and business analysts.

Source Systems:
- CRM System
- ERP System

Note:
Refer to the workflow diagram included in the project repository
for the complete ETL pipeline and data flow.
============================================================================= */


/* =============================================================================
   SECTION 1: DATABASE CREATION
   =============================================================================
   Description:
   This step initializes the Data Warehouse environment.
   If the database already exists, it will be removed and recreated to ensure
   a clean setup for the project.
   ============================================================================ */

-- Check if the Data Warehouse database already exists
IF DB_ID('Data_Warehouse') IS NOT NULL
    DROP DATABASE Data_Warehouse;
GO

-- Create the Data Warehouse database
CREATE DATABASE Data_Warehouse;
GO



/* =============================================================================
   SECTION 2: SCHEMA CREATION
   =============================================================================
   Description:
   Schemas are created to logically organize tables according to the
   Medallion Architecture layers.

   bronze  → Raw source data ingestion layer
   silver  → Data transformation and cleansing layer
   gold    → Business-ready analytical data layer
   ============================================================================ */


-- ---------------------------------------------------------------------------
-- Bronze Schema
-- Purpose: Stores raw data ingested from source systems (CRM, ERP, etc.)
-- ---------------------------------------------------------------------------
CREATE SCHEMA bronze;
GO


-- ---------------------------------------------------------------------------
-- Silver Schema
-- Purpose: Stores cleaned, standardized, and transformed data
-- ---------------------------------------------------------------------------
CREATE SCHEMA silver;
GO


-- ---------------------------------------------------------------------------
-- Gold Schema
-- Purpose: Stores aggregated and business-ready datasets
-- optimized for reporting, dashboards, and analytics
-- ---------------------------------------------------------------------------
CREATE SCHEMA gold;
GO