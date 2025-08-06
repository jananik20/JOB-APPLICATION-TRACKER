# Job Application Tracker 

This project is a structured MySQL database system designed to track job applications, applicants, job listings, and application statuses. It demonstrates relational database design, query optimization, and real-world use cases in job recruitment scenarios.

## Project Structure

- `job_application_tracker.sql`: SQL script to create and populate the database (tables, data, relationships).
- `queries.sql`: Sample SQL queries to analyze application trends, status reports, and more.

## Technologies Used

- MySQL
- SQL
- Workbench / CLI

## Features

- Create and manage job listings and applicant profiles.
- Track application status: Applied, Interview, Hired, Rejected.
- Analyze engagement with SQL queries: job-wise activity, inactive applicants, and unengaged jobs.
- Use of normalized tables and foreign key constraints.
- Advanced queries using `JOIN`, `IN`, `NOT IN`, `DISTINCT`, subqueries, and date filters.

## Sample SQL Queries

```sql
-- Jobs with no applications
SELECT title FROM Jobs
WHERE job_id NOT IN (SELECT job_id FROM Applications);

-- Application status of a specific applicant
SELECT a.name, j.title, ap.status 
FROM Applications ap
JOIN Applicants a ON ap.applicant_id = a.applicant_id
JOIN Jobs j ON ap.job_id = j.job_id
WHERE a.name = 'Emily Carter';
