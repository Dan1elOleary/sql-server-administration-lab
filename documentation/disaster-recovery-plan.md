
---

# `documentation/disaster-recovery-plan.md`

```markdown
# Disaster Recovery Plan

## Purpose

This document outlines disaster recovery procedures for the `PublicSafetySupportDB` lab database.

## Scope

This plan applies to the SQL Server lab environment and the fictional `PublicSafetySupportDB` database.

## Disaster Scenarios

Possible disaster scenarios include:

- SQL Server service failure
- Database corruption
- Accidental table deletion
- Failed application update
- Disk failure
- Backup job failure
- Unauthorized database change

## Recovery Priorities

1. Confirm the issue.
2. Protect existing data.
3. Identify the most recent valid backup.
4. Restore the database to a test location.
5. Validate application/database functionality.
6. Restore production service.
7. Document the incident.

## Recovery Time Objective

The target recovery time for this lab is:

```text
1 hour
