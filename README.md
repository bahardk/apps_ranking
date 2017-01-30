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
