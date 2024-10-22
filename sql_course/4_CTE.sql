SELECT *
FROM (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
    ) as january_jobs
    ;

WITH january_jobs as (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
)
SELECT *
FROM january_jobs
;

SELECT
    company_id,
    job_no_degree_mention
FROM job_postings_fact
WHERE job_no_degree_mention = true
;

SELECT 
    company_id,
    name as company_name
FROM company_dim
WHERE company_id in (
    SELECT
        company_id
    FROM job_postings_fact
    WHERE job_no_degree_mention = true
    ORDER BY company_id
);

WITH company_job_count AS (
    SELECT
        company_id,
        COUNT(*) AS total_jobs
    FROM job_postings_fact
    GROUP BY company_id
)
SELECT
    company_dim.name AS company_name,
    company_job_count.total_jobs
FROM company_dim
LEFT JOIN company_job_count
    ON company_job_count.company_id = company_dim.company_id
ORDER BY total_jobs DESC
;

/* Визначте топ-5 навичок, які найчастіше зустрічаються в оголошеннях про вакансії. 
За допомогою підзапиту знайдіть ідентифікатори навичок з найбільшою кількістю в таблиці skills_job_dim, 
а потім об'єднайте цей результат з таблицею skills_dim, щоб отримати назви навичок. */

WITH skills_job_count AS (
    SELECT 
        skill_id,
        COUNT(*) as count_skill
    FROM skills_job_dim
    GROUP BY 1
)
SELECT 
    sd.skills AS name_skill,
    sjc.count_skill
FROM skills_job_count sjc
LEFT JOIN skills_dim sd ON sjc.skill_id = sd.skill_id
ORDER BY 2 DESC
LIMIT 5
;

/* Визначте категорію розміру («малий», «середній» або «великий») для кожної компанії, 
спочатку визначивши кількість вакансій, які вона має. 
За допомогою підзапиту підрахуйте загальну кількість вакансій для кожної компанії. 
Компанія вважається «малою», якщо вона має менше 10 вакансій, «середньою», 
якщо кількість вакансій становить від 10 до 50, і «великою», 
якщо вона має більше 50 вакансій. Реалізуйте підзапит, 
щоб об'єднати всі вакансії для кожної компанії, перш ніж класифікувати їх за розміром.*/

WITH jobcount as (
    SELECT
        company_id,
        count(*) as job_count
    FROM job_postings_fact
    GROUP BY 1
)
SELECT
    cd.name as company_name,
    j.job_count,
    case
        when job_count < 10 then 'Small'
        when job_count between 10 and 50 then 'Medium'
        else 'Large'
    end as company_category
FROM jobcount j
LEFT JOIN company_dim cd
    ON j.company_id = cd.company_id
--ORDER BY 2 DESC
;

/* Знайдіть кількість оголошень про віддалену роботу за кожною навичкою
- Відобразити топ-5 навичок за попитом на віддалену роботу
- Включити ідентифікатор навички, назву та кількість вакансій, що вимагають цієї навички */

with remote_job_skills as (
    SELECT
        skill_id,
        count(*) as skill_count
    FROM
        skills_job_dim AS skills_to_job
    inner join job_postings_fact as job_postings
        on job_postings.job_id = skills_to_job.job_id
    WHERE job_postings.job_work_from_home = true and
        job_postings.job_title_short = 'Data Analyst'
    GROUP BY 1
)
SELECT skill.skill_id,
skills as skill_name,
skill_count
FROM remote_job_skills
inner join skills_dim as skill
    on skill.skill_id = remote_job_skills.skill_id
ORDER BY skill_count DESC
LIMIT 5
;