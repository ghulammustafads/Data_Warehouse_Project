# Modern Data Warehouse Project (SQL Server)

![SQL Server](https://img.shields.io/badge/Database-SQL%20Server-red)
![Architecture](https://img.shields.io/badge/Architecture-Medallion-blue)
![Layer](https://img.shields.io/badge/Current%20Layer-Bronze-orange)
![Status](https://img.shields.io/badge/Project%20Status-In%20Progress-yellow)
![License](https://img.shields.io/badge/License-MIT-green)
![Data Engineering](https://img.shields.io/badge/Domain-Data%20Engineering-purple)

---

# Project Overview

This project demonstrates the implementation of a **Modern Data Warehouse using SQL Server** following the **Medallion Data Architecture** approach.

The goal of this project is to simulate a **real-world data engineering workflow** where raw data from multiple operational systems is ingested, transformed, and structured into analytics-ready datasets.

The warehouse integrates data from **CRM and ERP systems**, processes it through structured layers, and prepares it for **analytics, reporting, and business intelligence**.

At the moment, the **Bronze Layer (Raw Data Ingestion Layer)** has been fully implemented.

---

# Medallion Architecture

This project follows the **Medallion Architecture**, a modern data engineering pattern widely used in scalable data platforms.

The architecture organizes data into three logical layers:

### Bronze Layer – Raw Data

The Bronze layer is responsible for **data ingestion**.
It stores raw data extracted from source systems with minimal transformation.

Key Characteristics:

* Raw source data storage
* Minimal transformations
* High traceability
* Source-level schema structure
* Initial data quality checks

---

### Silver Layer – Cleaned and Transformed Data

The Silver layer refines the raw data by applying:

* Data cleaning
* Data standardization
* Schema normalization
* Source system integration

This layer produces **structured and reliable datasets** ready for analytical modeling.

*(Implementation planned in the next phase of the project.)*

---

### Gold Layer – Business Analytics Layer

The Gold layer contains **business-ready datasets** optimized for reporting and dashboards.

Typical outputs include:

* Fact tables
* Dimension tables
* Aggregated metrics
* Analytical views

These datasets will be consumed by **BI tools and analysts**.

*(Implementation planned in later phases.)*

---

# Data Sources

The data warehouse integrates datasets from two operational systems.

## CRM System

The CRM system provides customer, product, and sales information.

Tables ingested:

* `cust_info`
* `product_info`
* `sales_details`

These tables contain operational data related to:

* Customer profiles
* Product catalog
* Sales transactions

---

## ERP System

The ERP system provides supporting operational information related to customers and products.

Tables ingested:

* `CUST_AZ12`
* `LOC_A101`
* `PX_CAT_G1C2`

These datasets include:

* Customer demographics
* Customer geographic information
* Product category classification

---

# Database Architecture

The database structure follows the Medallion pattern using **separate schemas for each layer**.

```
Data_Warehouse
│
├── bronze
│   ├── cust_info
│   ├── product_info
│   ├── sales_details
│   ├── CUST_AZ12
│   ├── LOC_A101
│   └── PX_CAT_G1C2
│
├── silver
│
└── gold
```

This structure provides:

* Logical data separation
* Scalable transformation pipelines
* Clear data lineage

---

# Bronze Layer Implementation

The Bronze layer is responsible for **ingesting raw data into the warehouse**.

The following steps were implemented:

### 1. Database Initialization

The project begins by creating a dedicated database for the warehouse environment.

```
CREATE DATABASE Data_Warehouse
```

Schemas were then created for the Medallion layers:

* bronze
* silver
* gold

---

### 2. Raw Table Creation

Tables were created inside the **bronze schema** to store raw source data.

These tables closely follow the **source system structure** to preserve data integrity.

---

### 3. Data Ingestion using BULK INSERT

Data from CSV files is loaded into Bronze tables using SQL Server’s **BULK INSERT** functionality.

This allows:

* Fast large-scale ingestion
* Efficient ETL loading
* Minimal transformation overhead

Example process:

1. Check if the table exists
2. Truncate the existing data
3. Load fresh data from CSV source files

---

### 4. Execution Time Tracking

The loading script records the **execution time** of the ingestion process using:

* `GETDATE()`
* `DATEDIFF()`

This helps simulate **ETL pipeline monitoring** used in real data engineering workflows.

---

# Project Structure

The repository is organized to follow a **clear data engineering workflow**.

```
sql-data-warehouse-project
│
├── datasets
│   ├── source_crm
│   └── source_erp
│
├── scripts
│   ├── 01_database_setup.sql
│   ├── 02_bronze_tables.sql
│   └── 03_bronze_load.sql
│
├── architecture
│   └── workflow_diagram.png
│
└── README.md
```

---

# Technologies Used

This project uses industry-standard tools for data engineering workflows.

* SQL Server
* T-SQL
* Medallion Data Architecture
* Bulk Data Loading
* CSV Data Sources

---

# Current Project Status

Completed:

* Data warehouse database setup
* Schema creation
* Bronze layer table creation
* Raw data ingestion from CRM and ERP systems
* Bulk data loading pipelines

In Progress:

* Silver layer transformations
* Data cleaning and integration logic

Planned:

* Gold layer dimensional modeling
* Analytical views
* Reporting-ready datasets
* Performance optimization

---

# Future Enhancements

Planned improvements include:

* Data validation rules
* ETL logging tables
* Error handling mechanisms
* Slowly Changing Dimensions
* Data quality monitoring
* BI dashboard integration

---

# Author

**Ghulam Mustafa**

This project is part of my **Data Engineering Portfolio**, demonstrating practical implementation of a **Modern Data Warehouse architecture using SQL Server**.

The goal of this project is to showcase skills in:

* Data warehouse design
* SQL development
* ETL pipeline implementation
* Data architecture best practices

---

# License

This project is released under the **MIT License**.
