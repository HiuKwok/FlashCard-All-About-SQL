--BY RANGE
CREATE TABLE EMP(
	E# NUMBER(6) NOT NULL, NAME VARCHAR(30) NOT NULL, HIRED DATE NOT NULL, CONSTRAINT EMP_PKEY PRIMARY KEY(E#)
)PARTITION BY RANGE(HIRED) (
	PARTITION P1 VALUES LESS THAN(TO_DATE('01-JAN-2005', 'DD-MON-YYYY'))
	PARTITION P2 VALUES LESS THAN(TO_DATE('01-JAN-2009', 'DD-MON-YYYY')))
 
--BY list
CREATE TABLE EMP(
	E# NUMBER(6) NOT NULL, NAME VARCHAR(30) NOT NULL, STATUS CHAR(1) NOT NULL, CONSTRAINT EMP_PKEY PRIMARY KEY(E#))
PARTITION BY LIST(STATUS)(
	PARTITION P1 VALUES ('S','M'), 
	PARTITION P2 VALUES ('U')) 
	
--Composite
CREATE TABLE EMP(
E#
NAME
HIRED       DATE              NOT NULL,NUMBER(6)         NOT NULL,VARCHAR(30) NOT NULL,
      CONSTRAINT EMP_PKEY PRIMARY KEY(E#))

PARTITION BY RANGE(HIRED)SUBPARTITION BY HASH(E#) SUBPARTITIONS 2(PARTITION P1 VALUES LESS THAN
      (TO_DATE('01-JAN-2005', 'DD-MON-YYYY'))
      (subpartition P1_1, subpartition P1_2)
 PARTITION P2 VALUES LESS THAN
      (TO_DATE('01-JAN-2009', 'DD-MON-YYYY'))
      (subpartition P2_1, subpartition P2_2))
      
--Local Partitioned indexes
CREATE TABLE EMP(
E#    NUMBER(6)         NOT NULL,
NAME  VARCHAR(30) NOT NULL,
HIRED DATE              NOT NULL,
      CONSTRAINT EMP_PKEY PRIMARY KEY(E#))PARTITION BY RANGE(HIRED)(
      	PARTITION P1 VALUES LESS THAN (TO_DATE('01-JAN-2005', 'DD-MON-YYYY'))
 		PARTITION P2 VALUES LESS THAN (TO_DATE('01-JAN-2009', 'DD-MON-YYYY')))
CREATE INDEX EMP_IDX ON EMP(HIRED,NAME) LOCAL;  
CREATE INDEX EMP_IDX ON EMP(NAME) LOCAL;
      

--Global Partitioned indexes:
CREATE TABLE EMP(
E#    NUMBER(6)   NOT NULL,
NAME  VARCHAR(30) NOT NULL,
HIRED DATE        NOT NULL,
CONSTRAINT EMP_PKEY PRIMARY KEY(E#))PARTITION BY RANGE(HIRED)(
	PARTITION P1 VALUES LESS THAN  (TO_DATE('01-JAN-2005', 'DD-MON-YYYY'))
 	PARTITION P2 VALUES LESS THAN (TO_DATE('01-JAN-2009', 'DD-MON-YYYY')));
CREATE INDEX EMP_IDX ON EMP(NAME) GLOBALPARTITION BY RANGE(NAME)(  
	PARTITION P_IDX_1 VALUES LESS THAN('K')
	PARTITION P_IDX_1 VALUES LESS THAN('ZZZ') )





