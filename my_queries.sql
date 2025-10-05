-- Ananya's Queries regarding Exploratory Data Analysis for this dataset --

-- 1. Columns of interest: world_rank, institution, country, national_rank,
--    quality_of_education, influence, broad_impact, score, year
--    These will help us loko at the key determinants of university rankings.

-- 2. Approach: 
-- 2.1. See data types using table_info().
-- 2.2. Come up with questions about the data, and use queries to answer them.

-- 3. Self-formed EDA Questions:

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

-- 3.7. Is there any difference in average quality_of_education among top 5 v/s bottom 5 universities in 2012?
-- 3.8. Check summary stats for influence, broad_impact, and score. How do these differ over the years?

-- A documentation for this table would be super helpful. It'd help us understand the difference between
-- variables like score and influence. Beyond SQLite, Python would be a great tool to see correlations
-- and data visualization among these variables.

/* CRUD OPERATIONS FROM THE ASSIGNMENT */

-- 1. The ranking committee has decided to publish new results for a new university in 2014. Insert this university into the database.
-- Institution: Duke Tech
-- Country: USA
-- World Rank: 350
-- Score: 60.5
INSERT INTO university_rankings(world_rank, institution, country, score)
VALUES (350, 'Duke Tech', 'USA', 60.5);
SELECT * FROM university_rankings WHERE institution = 'Duke Tech';

-- 2. A policy consultant has reached out to you with the following question. 
-- How many universities from Japan show up in the global top 200 in 2013?
SELECT COUNT(institution)
FROM university_rankings 
WHERE world_rank <= 20 AND country = 'Japan';

-- 3.The score for University of Oxford in 2014 was miscalculated. 
-- Increase its score by +1.2 points. Update the row to reflect this update.
UPDATE university_rankings
SET score = score + 1.2
WHERE year = 2014 AND institution = 'University of Oxford';
SELECT * FROM university_rankings
WHERE year = 2014 AND institution = 'University of Oxford';

-- 4. After reviewing, the ranking committee decided that 
-- universities with a score below 45 in 2015 should not have been included in the published dataset. 
-- Clean up the records to reflect this.
DELETE FROM university_rankings
WHERE year = 2015 AND world_rank > 45;
SELECT COUNT(*) FROM university_rankings;