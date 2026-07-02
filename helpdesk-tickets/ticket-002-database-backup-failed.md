
---

## `helpdesk-tickets/ticket-002-database-backup-failed.md`

```markdown
# Ticket 002: Database Backup Failed

## Ticket Summary

Nightly SQL Server backup job failed for `PublicSafetySupportDB`.

## Reported By

Automated SQL Server Agent job history review

## Priority

High

## Category

Database Issue

## Symptoms

- SQL Server Agent job shows failed status.
- No new backup file was created.
- Previous backup file exists from the prior day.

## Troubleshooting Steps

1. Reviewed SQL Server Agent job history.
2. Confirmed the backup folder path exists.
3. Checked SQL Server service account permissions.
4. Verified available disk space.
5. Ran a manual backup test.
6. Confirmed the issue was related to the backup directory.

## SQL Query Used

```sql
BACKUP DATABASE PublicSafetySupportDB
TO DISK = 'C:\SQLBackups\PublicSafetySupportDB_ManualTest.bak'
WITH INIT, STATS = 10;
