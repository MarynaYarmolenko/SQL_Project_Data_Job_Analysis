SELECT
    job_title_short,
    job_location,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM job_postings_fact;

SELECT
    COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY location_category;

SELECT
    job_title_short,
    CASE
        WHEN salary_year_avg < 50000 THEN 'low salary' 
        WHEN salary_year_avg BETWEEN 50000 AND 100000 THEN 'standard'
        ELSE 'high'
    END AS salary_category,
    salary_year_avg
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY 1,2,3
ORDER BY 3 DESC
;