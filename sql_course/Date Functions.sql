SELECT job_posted_date
FROM job_postings_fact
LIMIT 10;

SELECT 
    '2023-02-19'::DATE,
    '123'::INTEGER,
    'true'::BOOLEAN,
    '3.14'::REAL;

SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date::DATE AS date
FROM
    job_postings_fact
LIMIT 5;

SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time
FROM
    job_postings_fact
LIMIT 5;


SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time,
    EXTRACT(MONTH FROM job_posted_date) AS date_month,
    EXTRACT(YEAR FROM job_posted_date) AS date_year
FROM
    job_postings_fact
LIMIT 5;

SELECT
    COUNT(job_id) AS job_posted_count,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY month
ORDER BY job_posted_count DESC;

SELECT
    AVG(salary_year_avg) AS salary_year_avg,
    AVG(salary_hour_avg) AS salary_hour_avg,
    job_schedule_type
FROM job_postings_fact
WHERE job_posted_date > '2023-06-01'
    AND (salary_year_avg IS NOT NULL
    OR salary_hour_avg IS NOT NULL)
GROUP BY job_schedule_type
;

SELECT
    COUNT(job_id) AS job_posted_count,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
WHERE job_posted_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY month
ORDER BY month;

SELECT
    cd.name AS company_name,
    EXTRACT(YEAR FROM job_posted_date) AS year,
    EXTRACT(QUARTER FROM job_posted_date) AS quarter,
    jpf.job_health_insurance
FROM
    job_postings_fact jpf
INNER JOIN company_dim cd
    ON jpf.company_id = cd.company_id
WHERE job_health_insurance IS TRUE
GROUP BY 1,2,3,4
HAVING EXTRACT(YEAR FROM job_posted_date) = 2023
    AND EXTRACT(QUARTER FROM job_posted_date) = 2
ORDER BY 1
;
