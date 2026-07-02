/*
Project: SQL Server Administration Lab
Script: 03-user-permissions-and-roles.sql
Purpose: Demonstrate role-based access control and least privilege.
*/

USE PublicSafetySupportDB;
GO

/*
Create custom database roles.
These are lab roles designed to separate access levels.
*/

CREATE ROLE db_support_readonly;
CREATE ROLE db_support_technician;
CREATE ROLE db_junior_dba;
GO

/*
Grant read-only access to the read-only role.
*/

GRANT SELECT ON SCHEMA::dbo TO db_support_readonly;
GO

/*
Grant support technician access.
Support technicians can read data and update ticket status.
*/

GRANT SELECT ON SCHEMA::dbo TO db_support_technician;
GRANT UPDATE ON Tickets TO db_support_technician;
GRANT INSERT ON SystemActivityLog TO db_support_technician;
GO

/*
Grant junior DBA access for backup-related tasks.
In a real environment, this should be reviewed carefully.
*/

ALTER ROLE db_backupoperator ADD MEMBER db_junior_dba;
GO

/*
Example users.
For a real environment, use domain accounts or properly managed SQL logins.
These are examples for lab documentation only.
*/

-- Example only:
-- CREATE LOGIN lab_readonly_user WITH PASSWORD = 'Use-A-Strong-Lab-Password-Here!';
-- CREATE USER lab_readonly_user FOR LOGIN lab_readonly_user;
-- ALTER ROLE db_support_readonly ADD MEMBER lab_readonly_user;

-- CREATE LOGIN lab_support_tech WITH PASSWORD = 'Use-A-Strong-Lab-Password-Here!';
-- CREATE USER lab_support_tech FOR LOGIN lab_support_tech;
-- ALTER ROLE db_support_technician ADD MEMBER lab_support_tech;

-- CREATE LOGIN lab_junior_dba WITH PASSWORD = 'Use-A-Strong-Lab-Password-Here!';
-- CREATE USER lab_junior_dba FOR LOGIN lab_junior_dba;
-- ALTER ROLE db_junior_dba ADD MEMBER lab_junior_dba;
GO

/*
View database role members.
*/

SELECT 
    roles.name AS DatabaseRole,
    members.name AS DatabaseUser
FROM sys.database_role_members drm
JOIN sys.database_principals roles
    ON drm.role_principal_id = roles.principal_id
JOIN sys.database_principals members
    ON drm.member_principal_id = members.principal_id
ORDER BY roles.name, members.name;
GO
