/*
 * The main different function and procedure is function not allow 
 * to modify data at all. Which mean only select but not Update & Delete
 */

--Create
CREATE OR REPLACE FUNCTION DEPTREC (dept_name IN VARCHAR)
RETURN VARCHAR IS
dept_row DEPARTMENT%ROWTYPE;

--Run (Let say FUN is a function)
SELECT dname, FUN(PARA)
FROM department

SELECT dname, FUN(para)
FROM department
WHERE FUN (DNAME) > 5

--DROP FUNCTION 
DROP FUNCTION fun_name