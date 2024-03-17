/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis
*/

SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(*) AS demand_count,
    ROUND(AVG(salary_year_avg))AS avg_salary
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
    job_title_short = 'Data Analyst'
    AND
    job_location = 'Anywhere'
    AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skill_id,
    skills_dim.skills
HAVING
    COUNT(*) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC;