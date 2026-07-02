# Performance Tuning Notes

## Purpose

This document explains basic performance tuning observations from the `PublicSafetySupportDB` lab.

## Performance Issue Simulated

The simulated issue is a slow support dashboard that loads open tickets, high-priority tickets, and recent system activity.

## Common Causes of Slow Queries

Possible causes include:

- Missing indexes
- Too many records scanned
- Poor filtering
- Large result sets
- Joins on non-indexed columns
- Outdated statistics
- Server resource constraints

## Queries Reviewed

The main query reviewed searches for open high-priority tickets.

```sql
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
