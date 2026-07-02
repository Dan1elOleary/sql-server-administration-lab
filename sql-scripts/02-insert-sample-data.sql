/*
Project: SQL Server Administration Lab
Script: 02-insert-sample-data.sql
Purpose: Insert fictional sample data.
*/

USE PublicSafetySupportDB;
GO

INSERT INTO Departments (DepartmentName, LocationName)
VALUES
('Dispatch Operations', 'Main Communications Center'),
('Records Unit', 'Headquarters'),
('IT Services', 'Technology Services'),
('Investigations', 'Headquarters'),
('Patrol Division', 'North Patrol');
GO

INSERT INTO ApplicationUsers (FirstName, LastName, Username, DepartmentID, IsActive)
VALUES
('Alex', 'Morgan', 'amorgan', 1, 1),
('Taylor', 'Reed', 'treed', 2, 1),
('Jordan', 'Parker', 'jparker', 3, 1),
('Casey', 'Brooks', 'cbrooks', 4, 1),
('Riley', 'Stone', 'rstone', 5, 1),
('Jamie', 'Carter', 'jcarter', 1, 0);
GO

INSERT INTO TicketCategories (CategoryName)
VALUES
('Application Access'),
('Database Issue'),
('Password Reset'),
('Performance Issue'),
('Reporting Issue'),
('System Error');
GO

INSERT INTO TicketStatus (StatusName)
VALUES
('Open'),
('In Progress'),
('Pending User'),
('Resolved'),
('Closed');
GO

INSERT INTO Tickets 
(Title, Description, CategoryID, StatusID, DepartmentID, RequestedByUserID, Priority, CreatedDate)
VALUES
('User cannot access records application', 'User receives access denied message when logging into the records application.', 1, 1, 2, 2, 'High', DATEADD(DAY, -5, GETDATE())),
('Dashboard loading slowly', 'Operations dashboard takes over 30 seconds to load during morning shift.', 4, 2, 1, 1, 'Medium', DATEADD(DAY, -4, GETDATE())),
('Database backup failed', 'Nightly database backup did not complete successfully.', 2, 1, 3, 3, 'High', DATEADD(DAY, -3, GETDATE())),
('Report missing recent ticket data', 'Weekly report does not show tickets created in the last 24 hours.', 5, 3, 3, 3, 'Medium', DATEADD(DAY, -2, GETDATE())),
('Password reset needed', 'User requested password reset for application login.', 3, 4, 5, 5, 'Low', DATEADD(DAY, -1, GETDATE())),
('Application error after update', 'User reports application crash after latest update.', 6, 1, 4, 4, 'High', GETDATE());
GO

INSERT INTO SystemActivityLog
(UserID, ActivityType, ActivityDescription, SourceSystem, ActivityDate)
VALUES
(1, 'Login', 'Successful login to support dashboard.', 'SupportPortal', DATEADD(HOUR, -10, GETDATE())),
(2, 'AccessDenied', 'User attempted to access restricted records module.', 'RecordsApp', DATEADD(HOUR, -8, GETDATE())),
(3, 'BackupJob', 'Nightly backup job failed.', 'SQLServerAgent', DATEADD(HOUR, -7, GETDATE())),
(4, 'ApplicationError', 'Application generated unhandled exception.', 'CaseManagementApp', DATEADD(HOUR, -5, GETDATE())),
(5, 'PasswordReset', 'Password reset completed successfully.', 'IdentitySystem', DATEADD(HOUR, -3, GETDATE()));
GO
