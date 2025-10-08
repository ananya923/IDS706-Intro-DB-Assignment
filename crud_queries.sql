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