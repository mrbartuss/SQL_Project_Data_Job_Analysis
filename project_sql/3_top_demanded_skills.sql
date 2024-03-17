/*
Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
*/

SELECT
    skills,
    COUNT(*) AS demand_count
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
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;