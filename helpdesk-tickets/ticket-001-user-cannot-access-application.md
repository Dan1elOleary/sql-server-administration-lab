
---

# Helpdesk Ticket Examples

## `helpdesk-tickets/ticket-001-user-cannot-access-application.md`

```markdown
# Ticket 001: User Cannot Access Application

## Ticket Summary

User reports receiving an access denied message when attempting to log into the records application.

## Reported By

Records Unit user

## Priority

High

## Category

Application Access

## Symptoms

- User can open the application.
- Login attempt fails.
- Error message says access denied.
- Other users can access the application.

## Troubleshooting Steps

1. Confirmed the user account is active.
2. Checked whether the user exists in the application database.
3. Reviewed user department assignment.
4. Checked database role membership.
5. Confirmed the issue was limited to one user.
6. Verified that the user did not have the required database/application role.

## SQL Query Used

```sql
SELECT 
    u.UserID,
    u.FirstName,
    u.LastName,
    u.Username,
    u.IsActive,
    d.DepartmentName
FROM ApplicationUsers u
JOIN Departments d ON u.DepartmentID = d.DepartmentID
WHERE u.Username = 'treed';
