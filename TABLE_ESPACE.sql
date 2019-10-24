/***************************************************************************************
                CREATE TABLE SPACE ANS USERS
***************************************************************************************/

CREATE TABLESPACE TB_PROYECTO DATAFILE 'C:\TB\proyecto.DBF' SIZE 300M;
CREATE USER PROYECTO IDENTIFIED BY 1234 DEFAULT TABLESPACE TB_PROYECTO;
GRANT dba, connect, resource TO PROYECTO;
GRANT CREATE ANY VIEW TO PROYECTO WITH ADMIN OPTION;
