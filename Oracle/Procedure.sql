

--Create Procedure 
CREATE OR REPLACE PROCEDURE p_name   ( var_1 IN type, var_2 IN type) IS var_3 type (size)
BEGIN
  …….
  select count ( * ) INTO var
END p_name ;
/

/*
 * Other operation against procedure( run, drop and print)
 * */
--Run
EXECUTE p_name;
--Delete
DROP PROCEDURE p_name;
--Print procedure:
SELECT OBJECT_NAME
FROM USER_OBJECTS
WHERE OBJECT_TYPE IN (‘PROCEDURE’, 'PROCEDURENAME' );



/*
 * Anonymous blocks:
 *  - Used to limit query scope
 * 
 * Ref: https://livesql.oracle.com/apex/livesql/file/tutorial_KS0KNKP218J86THKN85XU37.html
 * */
DECLARE
-- ...
BEGIN
-- ..
END


/*
 * Exception possible to be thrown on procedure block, 
 * better off to handle it.
 * 
 * 
 * */
EXCEPTION
  WHEN exception_type THEN
action
/*
Exception Block:
NO_DATA_FOUND
OTHERS
*/
