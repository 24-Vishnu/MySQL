STEP 1 -------DEDUPLICATION------- 

mysql> select *, row_number() over (Partition by company, location, industry,
    -> total_laid_off, percentage_laid_off,
    -> date, stage, country, funds_raised_millions)
    -> as row_num
    -> from layoffs_clean;

mysql> create table layoffs_duplicates as select *, 
    -> row_number() over (partition by company,location,industry,total_laid_off,
    -> percentage_laid_off,'data',stage,country,funds_raised_millions) 
    -> as row_num from layoffs_clean;
Query OK, 2361 rows affected (1.551 sec)
Records: 2361  Duplicates: 0  Warnings: 0

mysql> select * from layoffs_duplicates where row_num>1;

mysql> select count(*)
    -> from layoffs_duplicates
    -> where row_num > 1;
+----------+
| COUNT(*) |
+----------+
|       21 |
+----------+
1 row in set (0.032 sec)

mysql> delete from layoffs_duplicates where row_num > 1;
Query OK, 21 rows affected (0.263 sec)

mysql> select count(*) from layoffs_duplicates where row_num>1;
+----------+
| count(*) |
+----------+
|        0 |
+----------+
1 row in set (0.039 sec)


    DEDUPLICATION Summary
1. Created a working copy of the dataset
2. Used ROW_NUMBER() to identify duplicate records
3. Assigned row_num = 1 to the first occurrence
4. Marked row_num > 1 as duplicates
5. Removed 21 duplicate records
6. Retained 2340 unique records for further analysis
