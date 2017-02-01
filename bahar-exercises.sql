-- -h localhost -d bahar

-- Note: In general all your queries look good - you've learned the counts and
-- distincts well. When you have tables with similar structure, please research
-- the SQL UNION clause in order to present results together. Here's one example:

SELECT 'itunes' AS platform, COUNT (DISTINCT application_id) AS distinct_apps_count FROM google_application_ranks
UNION ALL
SELECT 'google' AS platform, COUNT (DISTINCT application_id) AS distinct_apps_count FROM itunes_application_ranks;

-- Note: Please research the difference between UNION and UNION ALL

-- 1. How many distinct application_ids do you have in the itunes_application_ranks
-- and google_application_ranks tables?

SELECT COUNT (DISTINCT application_id) AS distinct_apps_count FROM google_application_ranks;

SELECT COUNT (DISTINCT application_id) AS distinct_apps_count FROM itunes_application_ranks;

-- 2. Can you provide a count of ranking apps per day for both tables?

SELECT created_at AS date, COUNT (application_id) AS apps_count
FROM google_application_ranks
GROUP BY date
ORDER BY date ASC;

SELECT created_at AS date, COUNT (application_id) AS apps_count
FROM itunes_application_ranks
GROUP BY date
ORDER BY date ASC;

-- 3. Can you provide the number of distinct apps count per rank for both tables?

SELECT rank, COUNT (DISTINCT application_id) AS distinct_apps_count
FROM google_application_ranks
GROUP BY rank
ORDER BY rank ASC;

SELECT rank, COUNT( DISTINCT application_id) AS distinct_apps_count
FROM itunes_application_ranks
GROUP BY rank
ORDER BY rank ASC;

-- 4. The average frequency of each app reaching a rank:

-- 1st step:
-- Note: The query is correct - please apply for the google store too using the UNION here as well.
explain analyze SELECT rank, COUNT( DISTINCT application_id) AS distinct_apps_count, COUNT (application_id) AS total_apps_count FROM itunes_application_ranks GROUP BY rank ORDER BY rank ASC;

SELECT rank, COUNT (DISTINCT application_id) / COUNT (application_id) AS
FROM itunes_application_ranks
GROUP BY rank
ORDER BY rank ASC;
-- (I know it is wrong :/)
-- Note: I fixed it for you :)

-- 5-Which distinct apps have been in the top 10 ranking?

SELECT DISTINCT application_id FROM google_application_ranks where rank BETWEEN 1 AND 10;

-- 6- How many distinct apps have been in the top 10 ranking?

SELECT COUNT (DISTINCT application_id) AS apps_count FROM google_application_ranks WHERE rank BETWEEN 1 AND 10;

-- 7-How many times each distinct app has been among the top 10?

SELECT DISTINCT application_id, COUNT (DISTINCT application_id)
FROM google_application_ranks
WHERE rank BETWEEN 1 AND 10
GROUP BY application_id;
-- (again I know it is wrong! :P)
-- Note: you only replaced the position of WHERE and GROUP BY clauses.
-- However the query doesn't answer the question. The right query is:

SELECT application_id, count(*) AS top10_placements
FROM google_application_ranks
WHERE rank BETWEEN 1 AND 10
GROUP BY application_id
ORDER BY top10_placements DESC

-- Note: What do you need to add to this query in order to show only apps with more
-- than 20 top10_placements? Please research the HAVING clause to answer this
-- question.
