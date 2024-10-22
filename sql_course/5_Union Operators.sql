SELECT *
FROM january_jobs;

SELECT *
FROM february_jobs;

SELECT *
FROM march_jobs;

SELECT
    job_title_short,
    company_id,
    job_location
FROM january_jobs

UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM february_jobs

UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM march_jobs
;

/* Отримайте відповідну навичку та тип навички для кожної вакансії в q1
Включає також тих, хто не має жодних навичок
Чому? Подивіться навички та тип для кожної вакансії в першому кварталі,
 яка має зарплату > $70000 */

WITH q1 AS (
    SELECT
        job_title_short,
        job_id,
        salary_year_avg
    FROM january_jobs
    where salary_year_avg > 70000

    UNION ALL

    SELECT
        job_title_short,
        job_id,
        salary_year_avg
    FROM february_jobs
    where salary_year_avg > 70000

    UNION ALL

    SELECT
        job_title_short,
        job_id,
        salary_year_avg
    FROM march_jobs 
    where salary_year_avg > 70000
)
SELECT 
    q1.job_title_short as job_title_short,
    q1.salary_year_avg AS salary_year_avg,
    sd.skills as skill_name,
    sd.type as skill_type
FROM q1
left JOIN skills_job_dim sjd ON q1.job_id = sjd.job_id
LEFT JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
ORDER BY 2 DESC
;

SELECT
    job_title_short,
    job_location,
    job_via,
    job_posted_date::DATE,
    salary_year_avg
FROM (
    SELECT *
    FROM january_jobs
    UNION ALL
    SELECT *
    FROM february_jobs
    UNION ALL
    SELECT *
    FROM march_jobs 
    ) AS quarter1_job_postings
WHERE salary_year_avg > 70000 AND
    job_title_short = 'Data Analyst'
ORDER BY salary_year_avg DESC
;