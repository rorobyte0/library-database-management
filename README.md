# Library Database Management System

An academic demonstration project using **Oracle SQL** and **PL/SQL** to model a library's books, members, borrowing records, overdue fines, queries, indexing, and role-based access control.

## Features

- Relational tables with primary keys, foreign keys, unique constraints, and check constraints.
- Sample records for books, members, user profiles, and borrowing transactions.
- A PL/SQL function (`calculate_debt`) that calculates overdue fines at 2 currency units per late day.
- SQL queries for most-borrowed books, targeted column retrieval, and overdue unreturned books.
- An alternative `EXISTS` query and an execution-plan example.
- An optional script for database roles and demo accounts.

## Files

- `library_database.sql` — creates the schema, inserts sample data, creates the function, runs example queries, and demonstrates an index and execution plan.
- `security_setup.sql` — optional role and database-account setup. It requires administrative privileges and configuration before use.

## Requirements

- Oracle Database (12c or later recommended for identity columns).
- Oracle SQL Developer or another Oracle SQL client.

## How to run

1. Create or select a **new, empty schema** in Oracle.
2. Open `library_database.sql` in SQL Developer.
3. Run it using **Run Script (F5)**, not just Run Statement.
4. When prompted for `borrow_id`, enter a borrowing ID from the sample data (commonly `1`, `2`, or `3` in a fresh schema).
5. Review the query results and the execution plan output.

The script creates objects without dropping existing tables or users. Run it only once in a fresh schema unless you intentionally clean up the prior objects first.

## Optional roles and accounts

`security_setup.sql` is separate because creating database users and roles requires administrative privileges. Before running it:

1. Replace `LIBRARY_SCHEMA` with the actual owner schema name.
2. Replace every example password with a unique password.
3. Ensure the account running the grants has the required privileges.
4. If your database administrator does not permit user creation, skip this optional script.

The `Admin`, `Moderator`, `Member`, and `Guest` roles are demonstration roles. Review the granted privileges before using them in any real environment.

## Notes on optimization

The index and `EXPLAIN PLAN` section demonstrates how to inspect a query plan. An index does not automatically make every query faster; performance should be measured with representative data and compared using execution plans and runtime statistics. Selecting fewer columns reduces returned data but does not, by itself, prove a faster execution plan.

## Academic integrity and scope

This repository is a reconstructed practice version based on a partial SQL snippet. It is **not guaranteed to match the original university submission**. Review the schema and logic, test it in Oracle, and only describe as personal work the parts you actually completed or can explain.
