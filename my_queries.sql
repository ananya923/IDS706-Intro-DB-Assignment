-- Ananya's Queries regarding Exploratory Data Analysis for this dataset --

-- Approach: 
-- 1. See data types using table_info().
PRAGMA table_info(university_rankings);

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