drop table if exists google_applications;
CREATE TABLE google_applications (
  id int primary key,
    title text,
    free_download boolean,
    release_date date)
    ;
COPY google_applications
FROM 'C:\Users\ReDI\Project\google_applications.csv.txt' WITH CSV HEADER DELIMITER','
;


drop table if exists google_application_ranks;
CREATE TABLE google_application_ranks (
 created_at date,
    application_id int,
    rank smallint )
    ;
COPY google_application_ranks
FROM 'C:\Users\ReDI\Project\google_application_ranks.csv.txt' WITH CSV HEADER DELIMITER','
;

drop table if exists itunes_application_ranks;
CREATE TABLE itunes_application_ranks (
 created_at date,
    application_id int,
    rank smallint )
    ;
COPY google_application_ranks
FROM 'C:\Users\ReDI\Project\itunes_application_ranks.csv.txt' WITH CSV HEADER DELIMITER','
;

drop table if exists itunes_applications;
CREATE TABLE itunes_applications (
  id int primary key,
    title text,
    free_download boolean,
    release_date date)
    ;
COPY itunes_applications
FROM 'C:\Users\ReDI\Project\itunes_applications.csv.txt' WITH CSV HEADER DELIMITER','
;


SELECT * FROM public.google_application_ranks
ORDER BY rank
ASC
LIMIT 100

1-how many distinct application_ids do you have in the `itunes_application_ranks` and `google_application_ranks` tables? 

SELECT COUNT (DISTINCT application_id) AS distinct_apps_count
FROM google_application_ranks;

SELECT COUNT (DISTINCT application_id) AS distinct_apps_count
FROM itunes_application_ranks;

2-can you provide a count of ranking apps per day for both tables?

SELECT created_at AS date, COUNT (application_id) AS apps_count
FROM google_application_ranks
GROUP BY date ORDER BY date ASC;

SELECT created_at AS date, COUNT (application_id) AS apps_count
FROM itunes_application_ranks
GROUP BY date ORDER BY date ASC;

3-can you provide the number of distinct apps count per rank for both tables?

SELECT rank, COUNT (DISTINCT application_id) AS distinct_apps_count
FROM google_application_ranks
GROUP BY rank ORDER BY rank ASC;

SELECT rank, COUNT( DISTINCT application_id) AS distinct_apps_count
FROM itunes_application_ranks
GROUP BY rank ORDER BY rank ASC;

4-The average frequency of each app reaching a rank:

1st step:
SELECT rank, COUNT( DISTINCT application_id) AS distinct_apps_count, 
COUNT (application_id) AS total_apps_count
FROM itunes_application_ranks
GROUP BY rank ORDER BY rank ASC;

SELECT rank, COUNT( DISTINCT application_id) AS distinct_apps_count, 
COUNT (application_id) AS total_apps_count,
(total_apps_count/distinct_apps_count) AS average
FROM itunes_application_ranks
GROUP BY rank ORDER BY rank ASC;  (I know it is wrong :/)


5-Which distinct apps have been in the top 10 ranking?

SELECT DISTINCT application_id
FROM google_application_ranks
where rank BETWEEN 1 AND 10;


6-
How many distinct apps have been in the top 10 ranking?

SELECT COUNT (DISTINCT application_id) AS apps_count
FROM google_application_ranks
WHERE rank BETWEEN 1 AND 10;

