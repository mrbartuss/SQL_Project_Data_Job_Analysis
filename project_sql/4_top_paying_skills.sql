/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg)) AS avg_salary
FROM
    job_postings_fact
JOIN
    skills_job_dim
USING
    (job_id)
JOIN
    skills_dim
USING
    (skill_id)
WHERE
    salary_year_avg IS NOT NULL
    AND
    job_title_short = 'Data Analyst'
    AND
    job_location = 'Anywhere'
GROUP BY
    skills
ORDER BY
    avg_salary DESC;