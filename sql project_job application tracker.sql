CREATE DATABASE JOBAPPLICATION ;              
USE JOBAPPLICATION;
CREATE TABLE Applicants (
    applicant_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE Jobs (
    job_id INT PRIMARY KEY,
    title VARCHAR(100),
    company VARCHAR(100),
    location VARCHAR(100)
);

CREATE TABLE Applications (
    application_id INT PRIMARY KEY,
    applicant_id INT,
    job_id INT,
    application_date DATE,
    status VARCHAR(20), -- 'Applied', 'Interview', 'Rejected', 'Hired'
    FOREIGN KEY (applicant_id) REFERENCES Applicants(applicant_id),
    FOREIGN KEY (job_id) REFERENCES Jobs(job_id)
);


INSERT INTO Applicants VALUES
(1, 'Emily Carter', 'emily@example.com'),
(2, 'Daniel Moore', 'daniel@example.com'),
(3, 'Sophia Williams', 'sophia@example.com'),
(4, 'Liam Johnson', 'liam@example.com'),
(5, 'Ava Brown', 'ava@example.com'),
(6, 'Noah Davis', 'noah@example.com'),
(7, 'Isabella Taylor', 'isabella@example.com');

INSERT INTO Jobs VALUES 
(1, 'Software Engineer', 'TechCorp', 'New York'),
(2, 'Data Analyst', 'DataFirm', 'San Francisco'),
(3, 'Product Manager', 'InnoSoft', 'Austin'),  
(4, 'UI/UX Designer', 'DesignPro', 'Los Angeles'),
(5, 'System Administrator', 'NetSolutions', 'Chicago'),
(6, 'DevOps Engineer', 'CloudEdge', 'Seattle'),
(7, 'Marketing Specialist', 'MarketWise', 'Boston');

INSERT INTO Applications VALUES
(1, 1, 1, '2025-08-01', 'Applied'),
(2, 2, 2, '2025-08-01', 'Interview'),
(3, 1, 3, '2025-08-02', 'Hired'),
(4, 3, 2, '2025-08-02', 'Applied'),
(5, 4, 4, '2025-08-03', 'Interview'),
(6, 5, 1, '2025-08-03', 'Rejected'),
(7, 6, 6, '2025-08-04', 'Applied');
SELECT name, email FROM Applicants;
SELECT title, company FROM Jobs;
SELECT a.name, j.title FROM Applicants a JOIN Applications ap ON a.applicant_id = ap.applicant_id JOIN Jobs j ON ap.job_id = j.job_id;
SELECT DISTINCT job_id FROM Applications WHERE application_date = '2025-08-02';
SELECT name FROM Applicants WHERE applicant_id = ( SELECT applicant_id FROM Applications WHERE application_id = 5 );
SELECT name FROM Applicants WHERE applicant_id NOT IN ( SELECT applicant_id FROM Applications );
SELECT email FROM Applicants WHERE applicant_id IN ( SELECT applicant_id FROM Applications WHERE job_id = 1 );
SELECT status FROM Applications WHERE applicant_id = ( SELECT applicant_id FROM Applicants WHERE name = 'Noah Davis' );
SELECT title FROM Jobs WHERE job_id NOT IN ( SELECT job_id FROM Applications );
SELECT status FROM Applications WHERE applicant_id = ( SELECT applicant_id FROM Applicants WHERE name = 'Ava Brown' );
