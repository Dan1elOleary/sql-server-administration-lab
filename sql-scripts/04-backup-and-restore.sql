/*
Project: SQL Server Administration Lab
Script: 04-backup-and-restore.sql
Purpose: Demonstrate full backup and restore commands.
Important: Update file paths before running.
*/

USE master;
GO

/*
Full database backup.
Update the path below to match your lab system.
*/

BACKUP DATABASE PublicSafetySupportDB
TO DISK = 'C:\SQLBackups\PublicSafetySupportDB_FULL.bak'
WITH 
    FORMAT,
    INIT,
    NAME = 'Full Backup of PublicSafetySupportDB',
    STATS = 10;
GO

/*
Verify backup file.
*/

RESTORE VERIFYONLY
FROM DISK = 'C:\SQLBackups\PublicSafetySupportDB_FULL.bak';
GO

/*
Example restore command.
This restores the backup as a new database for testing.
Do not run over a production database.
*/

RESTORE DATABASE PublicSafetySupportDB_RestoreTest
FROM DISK = 'C:\SQLBackups\PublicSafetySupportDB_FULL.bak'
WITH 
    MOVE 'PublicSafetySupportDB' TO 'C:\SQLData\PublicSafetySupportDB_RestoreTest.mdf',
    MOVE 'PublicSafetySupportDB_log' TO 'C:\SQLLogs\PublicSafetySupportDB_RestoreTest_log.ldf',
    RECOVERY,
    STATS = 10;
GO
