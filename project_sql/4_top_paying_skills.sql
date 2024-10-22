/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analusts and helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25
; 


/*
Here are top paying skills for data analysts, the top 25, can you provide some quick insights into some trends into the top paying jobs
[
  {
    "skills": "pyspark",
    "avg_salary": "208172"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "189155"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skills": "watson",
    "avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skills": "gitlab",
    "avg_salary": "154500"
  },
  {
    "skills": "swift",
    "avg_salary": "153750"
  },
  {
    "skills": "jupyter",
    "avg_salary": "152777"
  },
  {
    "skills": "pandas",
    "avg_salary": "151821"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "145000"
  },
  {
    "skills": "golang",
    "avg_salary": "145000"
  },
  {
    "skills": "numpy",
    "avg_salary": "143513"
  },
  {
    "skills": "databricks",
    "avg_salary": "141907"
  },
  {
    "skills": "linux",
    "avg_salary": "136508"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "132500"
  },
  {
    "skills": "atlassian",
    "avg_salary": "131162"
  },
  {
    "skills": "twilio",
    "avg_salary": "127000"
  },
  {
    "skills": "airflow",
    "avg_salary": "126103"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "125781"
  },
  {
    "skills": "jenkins",
    "avg_salary": "125436"
  },
  {
    "skills": "notion",
    "avg_salary": "125000"
  },
  {
    "skills": "scala",
    "avg_salary": "124903"
  },
  {
    "skills": "postgresql",
    "avg_salary": "123879"
  },
  {
    "skills": "gcp",
    "avg_salary": "122500"
  },
  {
    "skills": "microstrategy",
    "avg_salary": "121619"
  }
]

Here are the key trends in the data:

1. Big Data & Cloud Technologies Lead
    - PySpark tops the list at $208K, showing high demand for big data processing skills
    - Databricks and GCP appear in the list, indicating cloud platforms' importance
2. Strong Python Ecosystem Presence
    - Multiple Python-related tools (PySpark, Pandas, NumPy, Scikit-learn)
    - Jupyter appears high on the list ($152K), showing demand for data analysis workflows
3. DevOps Integration
    - Version control tools (Bitbucket, GitLab) command high salaries
    - CI/CD tools like Jenkins and container orchestration (Kubernetes) are valuable
4. AI/ML Tools Premium
    - DataRobot and Watson (both ~$160K) show high value for AI/ML platforms
    - Scikit-learn's presence indicates demand for traditional ML skills
5. Database Diversity
    - Mix of traditional (PostgreSQL) and modern databases (Couchbase, Elasticsearch)
    - Suggests value in knowing both SQL and NoSQL technologies


Looking at the top 25 highest-paying skills for data analysts, here are some trends and insights: 
1. **Cloud and Data Infrastructure Tools**: Tools such as PySpark, Databricks, and Couchbase are in the top ranks. 
    PySpark has the highest average salary at $208,172, showing that expertise in cloud-based, large-scale data processing is highly valued. 
    Couchbase, a NoSQL database, also appears in the top 3, highlighting the demand for cloud-native data solutions. 
2. **Version Control & Collaboration Tools**: Bitbucket and GitLab command high salaries, with Bitbucket at $189,155 and GitLab at $154,500. 
    These platforms are essential for collaboration, particularly in large-scale projects involving many teams, 
    underlining the need for efficient code management and version control. 
3. **AI & Machine Learning Platforms**: Tools like Watson ($160,515) and DataRobot ($155,486) indicate the growing importance of AI 
    and machine learning in business applications. 
    Proficiency in AI platforms can lead to high-paying opportunities as companies increasingly integrate AI into their operations. 
4. **Data Science and Analytics Libraries**: Pandas ($151,821), Numpy ($143,513), 
    and Scikit-learn ($125,781) highlight the high demand for skills in Python-based libraries. 
    These libraries are critical for data manipulation and machine learning, with data analysts who are proficient in them commanding competitive salaries. 
5. **Specialized Software**: Tools like Elasticsearch ($145,000), Golang ($145,000), 
    and Jenkins ($125,436) suggest that specialized expertise in search and software development technologies is also lucrative. 
    Elasticsearch is vital for search engine implementation, while Golang and Jenkins support backend and automation tasks. 
6. **Open-Source Ecosystems**: Jupyter ($152,777) and Kubernetes ($132,500) are valuable in open-source, cloud, and containerization ecosystems. 
    These tools are essential for scalable, reproducible data analysis and development. 
7. **Platform-Specific Skills**: Atlassian ($131,162) and Twilio ($127,000) imply demand for expertise in specialized business tools, 
    further reinforcing the trend of needing platform-specific knowledge, particularly for enterprise collaboration and communication platforms. 
8. **Relational Databases**: PostgreSQL ($123,879) and GCP ($122,500) show that database management 
    and cloud platform knowledge are still highly in demand for storing and processing large datasets. 
9. **Cross-Disciplinary Skills**: Tools like Swift ($153,750), often associated with app development, 
    show that data analysts with cross-disciplinary knowledge can command high salaries, 
    suggesting that understanding programming beyond just data tools is a valuable asset. 
    These trends suggest that high-paying data analyst jobs often demand specialized, niche tools, particularly those related to cloud infrastructure, AI, 
    and collaboration platforms. Familiarity with multiple ecosystems, including open-source and enterprise-specific solutions, 
    significantly boosts earning potential.
*/