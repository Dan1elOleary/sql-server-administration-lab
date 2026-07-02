
---

# `setup-guides/01-lab-build-guide.md`

```markdown
# SQL Server Administration Lab Build Guide

## Objective

Build a local SQL Server lab environment that can be used to practice database administration, backup and restore, role-based access control, maintenance jobs, and basic troubleshooting.

## Lab Requirements

- Windows Server or Windows 11 virtual machine
- SQL Server Developer Edition
- SQL Server Management Studio
- Local administrator access
- GitHub account
- Basic knowledge of Windows and SQL Server

## Step 1: Install SQL Server Developer Edition

1. Download SQL Server Developer Edition.
2. Run the installer.
3. Select a basic or custom installation.
4. Install the Database Engine.
5. Use Windows Authentication for the lab.
6. Confirm the SQL Server service is running.

## Step 2: Install SQL Server Management Studio

1. Download and install SQL Server Management Studio.
2. Open SSMS.
3. Connect to the local SQL Server instance.
4. Confirm Object Explorer shows the server instance.

## Step 3: Enable SQL Server Agent

1. Open SQL Server Configuration Manager.
2. Locate SQL Server Agent.
3. Set the service startup type to Automatic or Manual.
4. Start the SQL Server Agent service.
5. Confirm SQL Server Agent appears in SSMS.

## Step 4: Create the Lab Database

Run the script:

```text
sql-scripts/01-create-database-and-tables.sql
