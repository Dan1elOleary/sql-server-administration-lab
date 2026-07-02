
---

# `sql-scripts/01-create-database-and-tables.sql`

```sql
/*
Project: SQL Server Administration Lab
Script: 01-create-database-and-tables.sql
Purpose: Create a fictional public-safety-style support database.
*/

CREATE DATABASE PublicSafetySupportDB;
GO

USE PublicSafetySupportDB;
GO

CREATE TABLE Departments (
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName NVARCHAR(100) NOT NULL,
    LocationName NVARCHAR(100) NULL
);
GO

CREATE TABLE ApplicationUsers (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Username NVARCHAR(100) NOT NULL UNIQUE,
    DepartmentID INT NOT NULL,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_ApplicationUsers_Departments
        FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
GO

CREATE TABLE TicketCategories (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(100) NOT NULL
);
GO

CREATE TABLE TicketStatus (
    StatusID INT IDENTITY(1,1) PRIMARY KEY,
    StatusName NVARCHAR(50) NOT NULL
);
GO

CREATE TABLE Tickets (
    TicketID INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(150) NOT NULL,
    Description NVARCHAR(500) NOT NULL,
    CategoryID INT NOT NULL,
    StatusID INT NOT NULL,
    DepartmentID INT NOT NULL,
    RequestedByUserID INT NOT NULL,
    Priority NVARCHAR(20) NOT NULL,
    CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
    ClosedDate DATETIME NULL,
    CONSTRAINT FK_Tickets_Category
        FOREIGN KEY (CategoryID) REFERENCES TicketCategories(CategoryID),
    CONSTRAINT FK_Tickets_Status
        FOREIGN KEY (StatusID) REFERENCES TicketStatus(StatusID),
    CONSTRAINT FK_Tickets_Department
        FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
    CONSTRAINT FK_Tickets_User
        FOREIGN KEY (RequestedByUserID) REFERENCES ApplicationUsers(UserID)
);
GO

CREATE TABLE SystemActivityLog (
    ActivityID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NULL,
    ActivityType NVARCHAR(100) NOT NULL,
    ActivityDescription NVARCHAR(500) NOT NULL,
    SourceSystem NVARCHAR(100) NOT NULL,
    ActivityDate DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_SystemActivityLog_User
        FOREIGN KEY (UserID) REFERENCES ApplicationUsers(UserID)
);
GO
