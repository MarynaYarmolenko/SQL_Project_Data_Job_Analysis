/*
Qustion: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills,
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg
    LIMIT 10
)
SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC
;


/*
Data Analyst Skills Analysis (2023)
Key Findings
Most In-Demand Skills: Excel (6 jobs), SQL (5 jobs)
Programming Languages: Python, R appear in 2 jobs each
Average Salary: $41071.43
Visualization Tools: Power BI, Tableau, Looker
Skill Categories
Data Analysis: SQL, Excel, SAS
Programming: Python, R, C, C++
Big Data: Hadoop, Spark
Visualization: Power BI, Tableau, Looker
Cloud: AWS
Other Tools: SharePoint, PowerPoint, Windows

Based on the analysis of these job postings, here are the key insights:
Essential Technical Skills:
Excel and SQL are by far the most requested skills, appearing in 6 and 5 job postings respectively
These appear to be the "must-have" skills for data analyst positions
Programming Languages:
Python and R are equally represented, each appearing in 2 job postings
There's also some demand for C and C++, though less common
Visualization Tools:
There's a diverse range of visualization tools required: Power BI, Tableau, and Looker
No single visualization tool dominates the requirements
Salary Insights:
Salary range: $35,000 - $47,500
Highest paying role ($47,500) requires the most diverse skill set, including SQL, Python, R, AWS, and visualization tools
Lower paying roles tend to require fewer technical skills
Emerging Technologies:
Big data technologies (Hadoop, Spark) appear in some listings
Cloud platforms (AWS) are beginning to appear in requirements
Business Tools:
Microsoft Office tools beyond Excel (PowerPoint, SharePoint) are still relevant
This suggests data analysts need both technical and business communication skills
This analysis suggests that aspiring data analysts should prioritize learning Excel and SQL as foundational skills, 
while also gaining exposure to at least one programming language (Python or R) and one visualization tool to be competitive in the job market.

[
  {
    "job_id": 229128,
    "job_title": "Data Analyst / Engineer",
    "salary_year_avg": "47500.0",
    "company_name": "Men's Health Clinic (MHC)",
    "skills": "sql"
  },
  {
    "job_id": 229128,
    "job_title": "Data Analyst / Engineer",
    "salary_year_avg": "47500.0",
    "company_name": "Men's Health Clinic (MHC)",
    "skills": "flow"
  },
  {
    "job_id": 229128,
    "job_title": "Data Analyst / Engineer",
    "salary_year_avg": "47500.0",
    "company_name": "Men's Health Clinic (MHC)",
    "skills": "powerpoint"
  },
  {
    "job_id": 229128,
    "job_title": "Data Analyst / Engineer",
    "salary_year_avg": "47500.0",
    "company_name": "Men's Health Clinic (MHC)",
    "skills": "power bi"
  },
  {
    "job_id": 229128,
    "job_title": "Data Analyst / Engineer",
    "salary_year_avg": "47500.0",
    "company_name": "Men's Health Clinic (MHC)",
    "skills": "excel"
  },
  {
    "job_id": 229128,
    "job_title": "Data Analyst / Engineer",
    "salary_year_avg": "47500.0",
    "company_name": "Men's Health Clinic (MHC)",
    "skills": "aws"
  },
  {
    "job_id": 229128,
    "job_title": "Data Analyst / Engineer",
    "salary_year_avg": "47500.0",
    "company_name": "Men's Health Clinic (MHC)",
    "skills": "c"
  },
  {
    "job_id": 229128,
    "job_title": "Data Analyst / Engineer",
    "salary_year_avg": "47500.0",
    "company_name": "Men's Health Clinic (MHC)",
    "skills": "c++"
  },
  {
    "job_id": 229128,
    "job_title": "Data Analyst / Engineer",
    "salary_year_avg": "47500.0",
    "company_name": "Men's Health Clinic (MHC)",
    "skills": "r"
  },
  {
    "job_id": 229128,
    "job_title": "Data Analyst / Engineer",
    "salary_year_avg": "47500.0",
    "company_name": "Men's Health Clinic (MHC)",
    "skills": "python"
  },
  {
    "job_id": 1619146,
    "job_title": "Data Analyst",
    "salary_year_avg": "46500.0",
    "company_name": "Get It Recruit - Administrative",
    "skills": "sas"
  },
  {
    "job_id": 1619146,
    "job_title": "Data Analyst",
    "salary_year_avg": "46500.0",
    "company_name": "Get It Recruit - Administrative",
    "skills": "sql"
  },
  {
    "job_id": 1619146,
    "job_title": "Data Analyst",
    "salary_year_avg": "46500.0",
    "company_name": "Get It Recruit - Administrative",
    "skills": "oracle"
  },
  {
    "job_id": 1619146,
    "job_title": "Data Analyst",
    "salary_year_avg": "46500.0",
    "company_name": "Get It Recruit - Administrative",
    "skills": "excel"
  },
  {
    "job_id": 1619146,
    "job_title": "Data Analyst",
    "salary_year_avg": "46500.0",
    "company_name": "Get It Recruit - Administrative",
    "skills": "sas"
  },
  {
    "job_id": 1619146,
    "job_title": "Data Analyst",
    "salary_year_avg": "46500.0",
    "company_name": "Get It Recruit - Administrative",
    "skills": "sharepoint"
  },
  {
    "job_id": 473213,
    "job_title": "Data Analyst-Operations",
    "salary_year_avg": "42500.0",
    "company_name": "U.S. Wire and Cable Company/ Flexon Industries",
    "skills": "windows"
  },
  {
    "job_id": 473213,
    "job_title": "Data Analyst-Operations",
    "salary_year_avg": "42500.0",
    "company_name": "U.S. Wire and Cable Company/ Flexon Industries",
    "skills": "excel"
  },
  {
    "job_id": 473213,
    "job_title": "Data Analyst-Operations",
    "salary_year_avg": "42500.0",
    "company_name": "U.S. Wire and Cable Company/ Flexon Industries",
    "skills": "wire"
  },
  {
    "job_id": 512966,
    "job_title": "Ecommerce Business Analyst/Data Analyst with Good exp with SQL",
    "salary_year_avg": "41000.0",
    "company_name": "BayOne Solutions",
    "skills": "tableau"
  },
  {
    "job_id": 512966,
    "job_title": "Ecommerce Business Analyst/Data Analyst with Good exp with SQL",
    "salary_year_avg": "41000.0",
    "company_name": "BayOne Solutions",
    "skills": "sql"
  },
  {
    "job_id": 994565,
    "job_title": "Remote Data Analyst",
    "salary_year_avg": "39000.0",
    "company_name": "Get It Recruit - Administrative",
    "skills": "excel"
  },
  {
    "job_id": 1349849,
    "job_title": "Financial Data Analyst",
    "salary_year_avg": "36000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "excel"
  },
  {
    "job_id": 1349849,
    "job_title": "Financial Data Analyst",
    "salary_year_avg": "36000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql"
  },
  {
    "job_id": 1178688,
    "job_title": "Data Analyst",
    "salary_year_avg": "35000.0",
    "company_name": "Jobmatchingpartner Ltd",
    "skills": "sql"
  },
  {
    "job_id": 1178688,
    "job_title": "Data Analyst",
    "salary_year_avg": "35000.0",
    "company_name": "Jobmatchingpartner Ltd",
    "skills": "spark"
  },
  {
    "job_id": 1178688,
    "job_title": "Data Analyst",
    "salary_year_avg": "35000.0",
    "company_name": "Jobmatchingpartner Ltd",
    "skills": "r"
  },
  {
    "job_id": 1178688,
    "job_title": "Data Analyst",
    "salary_year_avg": "35000.0",
    "company_name": "Jobmatchingpartner Ltd",
    "skills": "python"
  },
  {
    "job_id": 1178688,
    "job_title": "Data Analyst",
    "salary_year_avg": "35000.0",
    "company_name": "Jobmatchingpartner Ltd",
    "skills": "looker"
  },
  {
    "job_id": 1178688,
    "job_title": "Data Analyst",
    "salary_year_avg": "35000.0",
    "company_name": "Jobmatchingpartner Ltd",
    "skills": "hadoop"
  }
]
*/