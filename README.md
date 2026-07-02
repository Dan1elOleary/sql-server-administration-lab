# SQL Server Administration Lab

## Overview

This project is a hands-on SQL Server Administration Lab designed to demonstrate practical IT, database, and application-support skills. The lab simulates a small public-safety-style application database used for tracking users, departments, service requests, application tickets, and system activity.

The purpose of this project is to show that I understand how to install and configure SQL Server, create and manage a database, write T-SQL queries, manage user permissions, perform backups and restores, document disaster recovery steps, and troubleshoot common database-related helpdesk issues.

This project was built as a portfolio project for IT support, systems administration, database support, and SQL/database administrator roles.

## Project Goals

The main goals of this lab are to:

* Build a SQL Server lab environment from scratch.
* Create a realistic sample database.
* Write basic and intermediate T-SQL queries.
* Configure database users, roles, and permissions.
* Practice backup and restore procedures.
* Create a maintenance job for database administration tasks.
* Document disaster recovery planning.
* Document performance tuning observations.
* Create helpdesk-style ticket examples for application and database issues.

## Skills Demonstrated

* SQL Server installation and configuration
* SQL Server Management Studio usage
* T-SQL scripting
* Database creation
* Table creation and relationships
* Primary keys and foreign keys
* User and role management
* Least privilege access control
* Backup and restore planning
* SQL Server Agent job creation
* Database maintenance documentation
* Performance troubleshooting
* Helpdesk ticket documentation
* Technical writing for IT environments

## Tools Used

* Windows Server or Windows 11 Lab VM
* Microsoft SQL Server Developer Edition
* SQL Server Management Studio
* T-SQL
* GitHub
* Markdown

## Lab Environment

The lab environment contains:

* One Windows-based SQL Server system
* SQL Server Developer Edition
* SQL Server Management Studio
* A sample database named `PublicSafetySupportDB`
* SQL scripts for database creation, sample data, permissions, backups, maintenance, and performance tuning
* Documentation for backup, disaster recovery, access control, and troubleshooting

## Why SQL Server Developer Edition Was Used

SQL Server Developer Edition is used because it provides a full-featured SQL Server environment for development and testing. This makes it a better fit for a lab than SQL Server Express when demonstrating SQL Server Agent jobs, maintenance tasks, and more advanced administration features.

SQL Server Express can still be useful for learning basic SQL and database development, but it is more limited for administration labs.

## Database Scenario

This lab uses a fictional public-safety-style support database. The database is not connected to any real agency, police department, employee data, citizen data, or confidential information.

The sample database tracks:

* Departments
* Application users
* Support tickets
* Ticket categories
* Ticket status
* System activity logs

This type of database is useful for practicing SQL administration because it reflects real IT support concepts such as user access, application troubleshooting, ticket tracking, reporting, and database maintenance.

## Repository Structure

```text
sql-server-administration-lab/
│
├── README.md
├── lab-diagram.md
│
├── setup-guides/
│   └── 01-lab-build-guide.md
│
├── sql-scripts/
│   ├── 01-create-database-and-tables.sql
│   ├── 02-insert-sample-data.sql
│   ├── 03-user-permissions-and-roles.sql
│   ├── 04-backup-and-restore.sql
│   ├── 05-maintenance-job.sql
│   └── 06-performance-tuning.sql
│
├── documentation/
│   ├── backup-and-restore-plan.md
│   ├── disaster-recovery-plan.md
│   ├── performance-tuning-notes.md
│   └── security-and-access-control.md
│
└── helpdesk-tickets/
    ├── ticket-001-user-cannot-access-application.md
    ├── ticket-002-database-backup-failed.md
    └── ticket-003-slow-application-query.md
```

## Main Lab Tasks Completed

### 1. SQL Server Setup

Installed SQL Server Developer Edition and SQL Server Management Studio in a local lab environment.

### 2. Database Creation

Created a sample database named `PublicSafetySupportDB` with tables for departments, users, tickets, ticket categories, ticket statuses, and system activity logs.

### 3. Sample Data Insertion

Inserted sample records to simulate a small IT support environment.

### 4. T-SQL Query Practice

Created queries to retrieve ticket counts, active users, open tickets, high-priority incidents, department activity, and system activity history.

### 5. User Permissions

Created sample SQL logins and database users with role-based access. The lab demonstrates the principle of least privilege by separating read-only access, support technician access, and database administrator access.

### 6. Backup and Restore

Created full database backup and restore scripts. Documented where backups should be stored, how often backups should be taken, and how restores should be tested.

### 7. Maintenance Job

Created a sample SQL Server Agent job for database maintenance. This demonstrates how recurring administrative tasks can be automated in SQL Server.

### 8. Performance Tuning

Created indexes and documented basic query performance observations. Reviewed how indexing can improve lookup speed for commonly searched columns.

### 9. Disaster Recovery Documentation

Created a disaster recovery plan that explains recovery objectives, backup validation, restore testing, and outage response steps.

### 10. Helpdesk Ticket Documentation

Created sample helpdesk tickets for common SQL/application support problems, including access issues, failed backups, and slow application performance.

## Example Queries

### View Open Tickets

```sql
SELECT 
    t.TicketID,
    t.Title,
    t.Priority,
    s.StatusName,
    d.DepartmentName,
    t.CreatedDate
FROM Tickets t
JOIN TicketStatus s ON t.StatusID = s.StatusID
JOIN Departments d ON t.DepartmentID = d.DepartmentID
WHERE s.StatusName <> 'Closed'
ORDER BY t.CreatedDate DESC;
```

### Count Tickets by Department

```sql
SELECT 
    d.DepartmentName,
    COUNT(t.TicketID) AS TotalTickets
FROM Departments d
LEFT JOIN Tickets t ON d.DepartmentID = t.DepartmentID
GROUP BY d.DepartmentName
ORDER BY TotalTickets DESC;
```

### Find High Priority Tickets

```sql
SELECT 
    TicketID,
    Title,
    Priority,
    CreatedDate
FROM Tickets
WHERE Priority = 'High'
ORDER BY CreatedDate DESC;
```

## What I Learned

Through this lab, I practiced the core responsibilities of SQL Server administration and application support. I learned how to create a database, manage tables, insert sample data, write useful queries, control user access, back up and restore a database, document disaster recovery procedures, and troubleshoot common support issues.

This project helped me better understand how SQL Server supports business applications and how IT teams can maintain database availability, security, and performance.

## Relevance to IT and Database Support Roles

This project demonstrates skills that are useful for roles such as:

* IT Support Specialist
* Technical Support Engineer
* Systems Administrator
* Application Support Analyst
* Database Support Technician
* Junior SQL Server Administrator
* Helpdesk Technician supporting business applications
* Public safety technology support roles

## Future Improvements

Planned improvements for this lab include:

* Add Power BI dashboard reporting.
* Add Windows Event Viewer screenshots.
* Add SQL Server monitoring screenshots.
* Add automated backup validation.
* Add database integrity check examples.
* Add more advanced stored procedures.
* Add role-based access testing screenshots.
* Add a second VM to simulate remote client access.
