-- ============================================================
-- Optional role and account setup for the Library Database.
--
-- IMPORTANT:
-- 1. Run this separately as an authorized Oracle administrator.
-- 2. Replace the example passwords before execution.
-- 3. Object grants below assume the tables are owned by the
--    schema in which library_database.sql was run.
-- 4. Replace LIBRARY_SCHEMA with that schema's actual username.
-- 5. Do not run destructive DROP USER / DROP ROLE commands in
--    a shared or production database.
-- ============================================================

-- Create roles.
CREATE ROLE Admin;
CREATE ROLE Moderator;
CREATE ROLE Member;
CREATE ROLE Guest;

-- Grant table privileges to roles.
-- Run these statements as the table owner, or prefix table names
-- with the owner schema and run as an account with grant authority.
GRANT SELECT, INSERT, UPDATE, DELETE ON LIBRARY_SCHEMA.Books TO Admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON LIBRARY_SCHEMA.Members TO Admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON LIBRARY_SCHEMA.Borrowing TO Admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON LIBRARY_SCHEMA.Users TO Admin;

GRANT SELECT, INSERT, UPDATE, DELETE ON LIBRARY_SCHEMA.Books TO Moderator;
GRANT SELECT, UPDATE ON LIBRARY_SCHEMA.Members TO Moderator;
GRANT SELECT ON LIBRARY_SCHEMA.Borrowing TO Moderator;

GRANT SELECT ON LIBRARY_SCHEMA.Books TO Member;
GRANT SELECT, INSERT, UPDATE ON LIBRARY_SCHEMA.Borrowing TO Member;

GRANT SELECT ON LIBRARY_SCHEMA.Books TO Guest;
GRANT SELECT ON LIBRARY_SCHEMA.Borrowing TO Guest;

-- Create demo accounts with placeholders. Replace passwords first.
CREATE USER wajd IDENTIFIED BY "Replace_Admin_Password_123";
GRANT CREATE SESSION TO wajd;
GRANT Admin TO wajd;

CREATE USER Lina IDENTIFIED BY "Replace_Moderator_Password_123";
GRANT CREATE SESSION TO Lina;
GRANT Moderator TO Lina;

CREATE USER Rawda IDENTIFIED BY "Replace_Member_Password_123";
GRANT CREATE SESSION TO Rawda;
GRANT Member TO Rawda;

CREATE USER Reema IDENTIFIED BY "Replace_Guest_Password_123";
GRANT CREATE SESSION TO Reema;
GRANT Guest TO Reema;

-- CREATE USER / ALTER USER / DROP USER system privileges are
-- intentionally not granted to the Admin role by default.
-- Grant such powerful privileges only if the assignment requires it.
