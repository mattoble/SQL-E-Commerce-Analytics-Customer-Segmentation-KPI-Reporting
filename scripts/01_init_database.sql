/*
====================================================
Create Database and Schema
====================================================
Script Purpose:
    This script creates a new database named 'ECommerceAnalytics', 
    defines a 'gold' schema, and generates the necessary dimension 
    and fact tables for the e-commerce analytics project.
====================================================
*/

USE master;
GO

-- Create Database
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'ECommerceAnalytics')
BEGIN
    CREATE DATABASE ECommerceAnalytics;
END;
GO

USE ECommerceAnalytics;
GO

-- Create Schema
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'gold')
BEGIN
    EXEC('CREATE SCHEMA gold');
END;
GO

/*
====================================================
Create Dimension & Fact Tables
====================================================
*/

-- Create Customer Dimension Table
IF OBJECT_ID('gold.dim_customers', 'U') IS NOT NULL
    DROP TABLE gold.dim_customers;
GO

CREATE TABLE gold.dim_customers (
    customer_key INT PRIMARY KEY,
    customer_number VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birthdate DATE,
    marital_status VARCHAR(50),
    gender VARCHAR(50),
    country VARCHAR(50)
);
GO

-- Create Product Dimension Table
IF OBJECT_ID('gold.dim_products', 'U') IS NOT NULL
    DROP TABLE gold.dim_products;
GO

CREATE TABLE gold.dim_products (
    product_key INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    subcategory VARCHAR(50),
    cost DECIMAL(10, 2)
);
GO

-- Create Sales Fact Table
IF OBJECT_ID('gold.fact_sales', 'U') IS NOT NULL
    DROP TABLE gold.fact_sales;
GO

CREATE TABLE gold.fact_sales (
    order_number VARCHAR(50),
    product_key INT,
    customer_key INT,
    order_date DATE,
    sales_amount DECIMAL(18, 2),
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (customer_key) REFERENCES gold.dim_customers(customer_key),
    FOREIGN KEY (product_key) REFERENCES gold.dim_products(product_key)
);
GO