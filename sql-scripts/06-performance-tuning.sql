/*
Project: SQL Server Administration Lab
Script: 06-performance-tuning.sql
Purpose: Demonstrate basic indexing and query review.
*/

USE PublicSafetySupportDB;
GO

/*
Baseline query: Find open high-priority tickets.
*/

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
WHERE t.Priority = 'High'
  AND s.StatusName <> 'Closed'
ORDER BY t.CreatedDate DESC;
GO

/*
Create indexes for commonly filtered/searched columns.
*/

CREATE INDEX IX_Tickets_Priority_StatusID
ON Tickets (Priority, StatusID);
GO

CREATE INDEX IX_Tickets_DepartmentID
ON Tickets (DepartmentID);
GO

CREATE INDEX IX_Tickets_CreatedDate
ON Tickets (CreatedDate);
GO

CREATE INDEX IX_SystemActivityLog_ActivityDate
ON SystemActivityLog (ActivityDate);
GO

CREATE INDEX IX_ApplicationUsers_Username
ON ApplicationUsers (Username);
GO

/*
Review index usage.
*/

SELECT 
    OBJECT_NAME(i.object_id) AS TableName,
    i.name AS IndexName,
    i.type_desc AS IndexType
FROM sys.indexes i
WHERE OBJECT_NAME(i.object_id) IN ('Tickets', 'SystemActivityLog', 'ApplicationUsers')
ORDER BY TableName, IndexName;
GO
