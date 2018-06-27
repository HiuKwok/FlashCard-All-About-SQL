/**
 * How to investage a performance issue under SQLPLUS
 */

--List the plan
EXPLAIN PLAN FOR
SELECT /*+ FULL(PARTSUPP) */ COUNT(*)
FROM PARTSUPP
WHERE PS_PARTKEY = 1


--Analyze 
ANALYZE TABLE table_name COMPUTE STATISTICS 
FOR COLUMNS col_1
SIZE no_of_size


--COLLECT stat FROM SYS 
BEGIN
DBMS_STATS.GATHER_TABLE_STATS (
ownname =>'CSCI317',
tabname => 'PART');END;


--DELETE stat
BEGIN
DBMS_STATS.DELETE_TABLE_STATS (
ownname =>'CSCI317',
tabname => 'PART');END; /


--Histograms (Create)
BEGIN
DBMS_STATS.GATHER_TABLE_STATS (
ownname =>'CSCI317',
tabname => 'PART',
method_opt => 'FOR COLUMNS P_BRAND');END;


--Histograms (Find type)
BEGIN
DBMS_STATS.GATHER_TABLE_STATS (
ownname =>'CSCI317',
tabname => 'PART',
method_opt => 'FOR COLUMNS P_BRAND');END; /

--Histograms (List col stat)
SELECT COLUMN_NAME, NUM_DISTINCT, LOW_VALUE,
HIGH_VALUE, AVG_COL_LEN, HISTOGRAM
FROM USER_TAB_COL_STATISTICS
WHERE TABLE_NAME = 'PART';


