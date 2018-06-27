/*
 * Inline view:
 *  - Inline view is sometimes referred to as derived table. These two terms are used interchangeably.
 */

--Define table first 
(SELECT C_CUSTKEY
FROM CUSTOMER
WHERE C_ADDRESS LIKE '%Sydney%' ) SYDNEYCUST

--use it for join
SELECT O_TOTALPRICE
FROM ORDERS JOIN SYDNEYCUST
ON ORDERS.O_CUSTKEY = SYDNEYCUST.C_CUSTKEY;


/**
 * Subquery facotring:
 *  - Which is behave same as above inline view. But more tidy?
 * 
 * Ref: https://oracle-base.com/articles/misc/with-clause
 */
WITH SYDNEYCUST AS
( SELECT C_CUSTKEY
  FROM CUSTOMER
  WHERE C_ADDRESS LIKE '%Sydney%' )

SELECT O_TOTALPRICE
FROM ORDERS JOIN SYDNEYCUST
ON ORDERS.O_CUSTKEY = SYDNEYCUST.C_CUSTKEY;