
---

# `documentation/security-and-access-control.md`

```markdown
# Security and Access Control

## Purpose

This document explains the access control model for the `PublicSafetySupportDB` lab.

## Security Goal

The goal is to follow least privilege. Users should only receive the permissions needed to perform their job.

## Access Roles

| Role | Purpose |
|---|---|
| db_support_readonly | Can read support data only |
| db_support_technician | Can read tickets, update ticket status, and write activity logs |
| db_junior_dba | Can perform backup-related tasks in the lab |

## Least Privilege Model

Read-only users should not be able to modify data.

Support technicians should be able to update ticket records but should not be able to change database structure.

Junior database administrators may need backup permissions but should not automatically receive full server administrator rights unless required.

## Example Access Levels

| User Type | Access |
|---|---|
| Manager | Read-only reporting access |
| Support Technician | Read and update tickets |
| Junior DBA | Backup and restore support |
| Full DBA | Full administration |

## Security Risks

Potential risks include:

- Too many users with admin access
- Shared accounts
- Weak passwords
- No audit trail
- Unused accounts still active
- No regular permission review

## Recommended Controls

- Use named accounts
- Disable inactive accounts
- Review permissions regularly
- Avoid shared administrator accounts
- Use Windows Authentication where possible
- Separate read-only access from write access
- Document all permission changes

## Lab Notes

This lab uses fictional users and roles. In a real environment, access should be reviewed by IT leadership, security staff, and application owners.
