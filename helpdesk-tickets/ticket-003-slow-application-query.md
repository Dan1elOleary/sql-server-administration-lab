
---

## `helpdesk-tickets/ticket-003-slow-application-query.md`

```markdown
# Ticket 003: Slow Application Query

## Ticket Summary

User reports that the support dashboard is loading slowly when viewing open high-priority tickets.

## Reported By

Dispatch Operations user

## Priority

Medium

## Category

Performance Issue

## Symptoms

- Dashboard takes longer than expected to load.
- Issue occurs when filtering by open and high-priority tickets.
- Other application pages load normally.

## Troubleshooting Steps

1. Confirmed the slow dashboard behavior.
2. Identified the query used by the dashboard.
3. Reviewed tables involved in the query.
4. Checked filtering columns.
5. Added indexes to commonly searched columns.
6. Re-tested the query.

## SQL Query Reviewed

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
