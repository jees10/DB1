/***************************************************************************************
                CREATE TABLE SPACE ANS USERS
***************************************************************************************/

CREATE TABLESPACE TB_PROYECTO3 DATAFILE 'C:\TB\proyecto3.DBF' SIZE 300M;
CREATE USER ADMIN_DBA IDENTIFIED BY 1234 DEFAULT TABLESPACE TB_PROYECTO3;
GRANT dba, connect, resource TO ADMIN_DBA;
GRANT CREATE ANY VIEW TO ADMIN_DBA WITH ADMIN OPTION;
