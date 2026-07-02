/*
Project: SQL Server Administration Lab
Script: 05-maintenance-job.sql
Purpose: Create a sample SQL Server Agent job for nightly database backup.
Requirement: SQL Server Developer, Standard, or Enterprise Edition.
Note: SQL Server Express does not support SQL Server Agent.
*/

USE msdb;
GO

/*
Create the job.
*/

EXEC sp_add_job
    @job_name = N'Nightly Backup - PublicSafetySupportDB',
    @enabled = 1,
    @description = N'Performs a nightly full backup of the PublicSafetySupportDB database.';
GO

/*
Add a job step.
*/

EXEC sp_add_jobstep
    @job_name = N'Nightly Backup - PublicSafetySupportDB',
    @step_name = N'Run Full Backup',
    @subsystem = N'TSQL',
    @command = N'
BACKUP DATABASE PublicSafetySupportDB
TO DISK = ''C:\SQLBackups\PublicSafetySupportDB_Nightly.bak''
WITH INIT, NAME = ''Nightly Full Backup of PublicSafetySupportDB'', STATS = 10;
',
    @database_name = N'master';
GO

/*
Create a daily schedule.
This example runs daily at 11:00 PM.
*/

EXEC sp_add_schedule
    @schedule_name = N'Daily at 11 PM',
    @freq_type = 4,
    @freq_interval = 1,
    @active_start_time = 230000;
GO

/*
Attach schedule to job.
*/

EXEC sp_attach_schedule
    @job_name = N'Nightly Backup - PublicSafetySupportDB',
    @schedule_name = N'Daily at 11 PM';
GO

/*
Attach job to local server.
*/

EXEC sp_add_jobserver
    @job_name = N'Nightly Backup - PublicSafetySupportDB';
GO
