-- Create project database
mysql> create database LAYOFFS_DB;
Query OK, 1 row affected (0.338 sec)

mysql> use LAYOFFS_DB;
Database changed
  
mysql> create table LAYOFFS (
    -> company VARCHAR(255),
    -> location VARCHAR(255),
    -> industry VARCHAR(255),
    -> total_laid_off VARCHAR(50),
    -> percentage_laid_off VARCHAR(50),
    -> date VARCHAR(50),
    -> stage VARCHAR(255),
    -> country VARCHAR(255),
    -> funds_raised_millions VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.513 sec)

mysql> select count(*) from layoffs;
+----------+
| count(*) |
+----------+
|     2361 |
+----------+
1 row in set (0.418 sec)

-- Created LAYOFFS_CLEAN table to perform data cleaning and analysis
-- while keeping the original layoffs dataset unchanged
mysql>  create table LAYOFFS_CLEAN like LAYOFFS;
Query OK, 0 rows affected (0.517 sec)

-- Copy all records from raw dataset into working table
mysql> insert LAYOFFS_CLEAN select * from LAYOFFS;
Query OK, 2361 rows affected (0.958 sec)
Records: 2361  Duplicates: 0  Warnings: 0

























