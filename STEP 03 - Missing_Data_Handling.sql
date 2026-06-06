STEP 3 -------MISSING DATA HANDLING------- 

--Check for NULL Values--
mysql> select * from layoffs_clean where industry is null;
1 row in set (0.097 sec)
mysql> select * from layoffs_clean where total_laid_off is null;
740 rows in set (0.049 sec)
mysql> select * from layoffs_clean where percentage_laid_off is null;
785 rows in set (0.057 sec)

--Check for Blank Values--
mysql> select * from layoffs where industry = ' ';

--Convert Blanks to NULL--
mysql> update layoffs_clean
    -> set industry = null
    -> where industry = '';
Query OK, 3 rows affected (0.332 sec)
Rows matched: 3  Changed: 3  Warnings: 0

--Find Companies with Missing Industry--
mysql> select *
    -> from layoffs_clean
    -> where industry IS NULL;
4 rows in set (0.071 sec)

--Fill Missing Industry Values--
mysql> UPDATE layoffs_clean t1
    -> JOIN layoffs_clean t2
    -> ON t1.company = t2.company
    -> SET t1.industry = t2.industry
    -> WHERE t1.industry IS NULL
    -> AND t2.industry IS NOT NULL;
Query OK, 3 rows affected (0.487 sec)
Rows matched: 3  Changed: 3  Warnings: 0

--Check Remaining nulls--
mysql> SELECT *
    -> FROM layoffs_clean
    -> WHERE industry IS NULL;
1 row in set (0.044 sec)
  
--Remove Useless Records--
mysql> DELETE
    -> FROM layoffs_clean
    -> WHERE total_laid_off IS NULL
    -> AND percentage_laid_off IS NULL;
Query OK, 362 rows affected (0.409 sec)

mysql> SELECT COUNT(*)
    -> FROM layoffs_clean;
+----------+
| COUNT(*) |
+----------+
|     1999 |
+----------+
1 row in set (0.057 sec)


  MISSING DATA HANDLING Summary
1. Identified NULL and blank values across the dataset
2. Converted blank entries into NULL values for consistency
3. Investigated records with missing information
4. Filled missing values where reliable data was available
5. Reviewed unresolved NULL values for further action
6. Removed records that contained no meaningful layoff information
7. Improved overall data completeness and quality




















