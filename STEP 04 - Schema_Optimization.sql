STEP 4 -------SCHEMA OPTIMIZATION------- 

--Check Current Structure--
mysql> describe layoffs_clean;
+-----------------------+--------------+------+-----+---------+-------+
| Field                 | Type         | Null | Key | Default | Extra |
+-----------------------+--------------+------+-----+---------+-------+
| company               | varchar(255) | YES  |     | NULL    |       |
| location              | varchar(255) | YES  |     | NULL    |       |
| industry              | varchar(255) | YES  |     | NULL    |       |
| total_laid_off        | varchar(50)  | YES  |     | NULL    |       |
| percentage_laid_off   | varchar(50)  | YES  |     | NULL    |       |
| date                  | varchar(50)  | YES  |     | NULL    |       |
| stage                 | varchar(255) | YES  |     | NULL    |       |
| country               | varchar(255) | YES  |     | NULL    |       |
| funds_raised_millions | varchar(50)  | YES  |     | NULL    |       |
+-----------------------+--------------+------+-----+---------+-------+
9 rows in set (0.737 sec)

--Convert Date Column--
mysql> select date
    -> from layoffs_clean
    -> limit 10;
+----------+
| date     |
+----------+
| 3/6/2023 |
| 3/6/2023 |
| 3/6/2023 |
| 3/6/2023 |
| 3/3/2023 |
| 3/3/2023 |
| 3/3/2023 |
| 3/3/2023 |
| 3/3/2023 |
| 3/2/2023 |
+----------+
10 rows in set (0.011 sec)

mysql> update layoffs_clean
    -> set date = STR_TO_DATE(date,'%m/%d/%Y');
Query OK, 1998 rows affected (1.002 sec)
Rows matched: 1999  Changed: 1998  Warnings: 0

mysql> alter table layoffs_clean
    -> modify column date DATE;
Query OK, 1999 rows affected (1.760 sec)
Records: 1999  Duplicates: 0  Warnings: 0

--Convert total_laid_off--
mysql> select total_laid_off
    -> from layoffs_clean
    -> limit 10;
+----------------+
| total_laid_off |
+----------------+
| 500            |
| 475            |
| 400            |
| 120            |
| 340            |
| 230            |
| 100            |
| 63             |
| 30             |
| 177            |
+----------------+
10 rows in set (0.010 sec)

mysql> alter table layoffs_clean
    -> modify column total_laid_off INT;
Query OK, 1999 rows affected (1.230 sec)
Records: 1999  Duplicates: 0  Warnings: 0

--Convert percentage_laid_off--
mysql> select percentage_laid_off
    -> from layoffs_clean
    -> limit 10;
+---------------------+
| percentage_laid_off |
+---------------------+
| 0.05                |
| 0.08                |
| NULL                |
| NULL                |
| 0.15                |
| 0.7                 |
| NULL                |
| NULL                |
| NULL                |
| 0.03                |
+---------------------+
10 rows in set (0.009 sec)

mysql> alter table layoffs_clean
    -> modify column percentage_laid_off DECIMAL(5,2);
Query OK, 1999 rows affected, 5 warnings (1.427 sec)
Records: 1999  Duplicates: 0  Warnings: 5

-- Verify Updated Schema--
mysql> DESCRIBE layoffs_clean;
+-----------------------+--------------+------+-----+---------+-------+
| Field                 | Type         | Null | Key | Default | Extra |
+-----------------------+--------------+------+-----+---------+-------+
| company               | varchar(255) | YES  |     | NULL    |       |
| location              | varchar(255) | YES  |     | NULL    |       |
| industry              | varchar(255) | YES  |     | NULL    |       |
| total_laid_off        | int          | YES  |     | NULL    |       |
| percentage_laid_off   | decimal(5,2) | YES  |     | NULL    |       |
| date                  | date         | YES  |     | NULL    |       |
| stage                 | varchar(255) | YES  |     | NULL    |       |
| country               | varchar(255) | YES  |     | NULL    |       |
| funds_raised_millions | varchar(50)  | YES  |     | NULL    |       |
+-----------------------+--------------+------+-----+---------+-------+
9 rows in set (0.037 sec)


  SCHEMA OPTIMIZATION Summary
1. Checked the data types of all columns in the dataset.
2. Converted total_laid_off into a numeric format (INT).
3. Converted percentage_laid_off into DECIMAL format.
4. Changed the date column to DATE format for easier analysis.
5. Left funds_raised_millions as VARCHAR due to inconsistent values.
6. Improved the overall structure of the dataset.
7. Prepared the cleaned dataset for exploratory data analysis.










