-- --------------------------------------------------
-- Cleanup for Group Assignment 2 Group 2
--
-- run while connected as 'sys as sysdba'
-- --------------------------------------------------

DROP USER groupUser CASCADE;
DROP USER testUser;
DROP ROLE applicationAdmin;
DROP ROLE applicationUser;
DROP TABLESPACE group2 INCLUDING CONTENTS AND DATAFILES;
-- End of File

-- --------------------------------------------------
-- Group Assignment 2 Group 2 creation script
--
-- run while connected as 'sys as sysdba'
-- --------------------------------------------------

-- Create STORAGE
CREATE TABLESPACE group2
  DATAFILE 'group2.dat' SIZE 40M 
  ONLINE; 
  
-- Create Users
CREATE USER groupUser IDENTIFIED BY 123456 ACCOUNT UNLOCK
	DEFAULT TABLESPACE group2
	QUOTA 20M ON group2;
	
CREATE USER testUser IDENTIFIED BY testPassword ACCOUNT UNLOCK
	DEFAULT TABLESPACE group2
	QUOTA 5M ON group2;
	
-- Create ROLES
CREATE ROLE applicationAdmin;
CREATE ROLE applicationUser;

-- Grant PRIVILEGES
GRANT CONNECT, RESOURCE, CREATE VIEW, CREATE TRIGGER, CREATE PROCEDURE TO applicationAdmin;
GRANT CONNECT, RESOURCE TO applicationUser;

GRANT applicationAdmin TO groupUser;
GRANT applicationUser TO testUser;