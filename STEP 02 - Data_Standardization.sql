STEP 1 -------DATA STANDARDIZATION------- 

--Inspect the Data--
mysql> select distinct company from layoffs_clean order by company;
1888 rows in set (0.051 sec)

mysql> select distinct industry from layoffs_clean order by industry;
34 rows in set (0.029 sec)

mysql> select distinct country from layoffs_clean order by country;
60 rows in set (0.029 sec)


--Remove Extra Spaces--
mysql> select company from layoffs_clean where company!=trim(company);
11 rows in set (0.226 sec)

mysql> update layoffs_clean set company=trim(company);
Query OK, 11 rows affected (0.235 sec)
Rows matched: 2361  Changed: 11  Warnings: 0

--Standardize Industry Names--
mysql> update layoffs_clean set industry='crypto' where industry like 'crypto%';
Query OK, 102 rows affected (0.112 sec)
Rows matched: 102  Changed: 102  Warnings: 0

--Standardize Country Names--
mysql> select distinct country from layoffs_clean where country like 'United states%';
+----------------+
| country        |
+----------------+
| United States  |
| United States. |
+----------------+
2 rows in set (0.049 sec)

mysql> update layoffs_clean set country=trim(trailing '.' from country)
    -> where country like 'United states%';
Query OK, 4 rows affected (0.394 sec)
Rows matched: 1545  Changed: 4  Warnings: 0

--Verify Changes--
mysql> select distinct country from layoffs_clean where country like 'United states%';
+---------------+
| country       |
+---------------+
| United States |
+---------------+
1 row in set (0.049 sec)

  DATA STANDARDIZATION Summary
1. Checked the dataset for inconsistent values and formatting issues
2. Reviewed company, industry, and country columns
3. Removed extra spaces from text fields using TRIM()
4. Standardized similar values to keep the data consistent
5. Cleaned country names by removing unwanted characters
6. Verified the changes to ensure the data was properly formatted
7. Prepared the dataset for the next cleaning steps and analysis













