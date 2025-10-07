# IDS706-Intro-DB-Assignment

## This project explores the University Rankings database to execute simple SQL queries. The goal here is to showcase how SQL queries and CRUD functions work.

## Repository Structure

## Setup Instructions
- This repository contains `.sql` files, however, it does not provide the necessary environment to execcute these files (the instructions did not require us to create an environment).
- In order to execute the SQL queries, please clone this repository and use either SQLite on the command line or an IDE like DBeaver.
- The database required is included in this repository as the `university_database.db`.

## Explanation of Queries

### Exploratory Queries

My approach for coming up with these queries was to take a look at the data and ask questions that would reveal the most important information about this dataset.

After inspecting the structure of the dataset using the `PRAGMA table_info()` command, I came up with some questions and answered them using SQL queries. Each of them is explained below along with results.

0. Connect to the database in either command line or an environment (I used both the command line and DBeaver).
- For command line, we type the command: `sqlite3 university_database.db`.
- For DBeaver, we connect to the database by putting filepath into the Connection widget.

Results:
- ![connect_db](screenshots/command_line/connect_db_1.png)
- ![connect_db](screenshots/command_line/connect_db_2.png)
- ![connect_db](screenshots/DBeaver/connect_db_1.png)

====================================================================================================
1. See data types using table_info().

Query:
```sql
PRAGMA table_info(university_rankings);
```
Results:
![table_info](screenshots/command_line/analyze_table_info.png)

-- 2. Come up with questions about the data, and use queries to answer them.

-- 3. Queries for Self-formed EDA Questions:

-- 3.1. How many years of rankings are shown in the data?
SELECT year, COUNT(year)
FROM university_rankings
GROUP BY year;

-- 3.2. How many countries appear in this table? 
SELECT COUNT(DISTINCT country) FROM university_rankings;

-- 3.3. How does the set of countries represented differ across years?
SELECT year, COUNT(DISTINCT country) FROM university_rankings
GROUP BY year;

-- 3.4. Which institutions appear in the top 5 across various years?
SELECT year, institution FROM university_rankings
WHERE world_rank <= 5;

-- 3.5. Check summary statistics of quality_of_education
SELECT AVG(quality_of_education) AS avg_qual,
SUM(quality_of_education) AS sum_qual,
MIN(quality_of_education) AS min_qual,
MAX(quality_of_education) AS mix_qual
FROM university_rankings;

-- 3.6. How do these stats differ across years?
SELECT year, AVG(quality_of_education) AS avg_qual, 
SUM(quality_of_education) AS sum_qual,
MIN(quality_of_education) AS min_qual,
MAX(quality_of_education) AS mix_qual
FROM university_rankings 
GROUP BY year;

-- A documentation for this table would be super helpful. It'd help us understand the difference between
-- variables like score and influence. Beyond SQLite, Python would be a great tool to see correlations
-- and data visualization among these variables.

```sql
SELECT *
FROM university_rankings;
```


### CRUD Queries Provided in the Instructions