INSERT ALL WHEN L_QUANTITY > 40 THEN INTO DATES
 VALUES(L_ORDERKEY, L_LINENUMBER, L_SHIPDATE,
        L_COMMITDATE, L_RECEIPTDATE )WHEN L_QUANTITY < 50 THENINTO OTHERS
 VALUES(L_ORDERKEY, L_LINENUMBER, L_QUANTITY,
        L_EXTENDEDPRICE, L_DISCOUNT, L_TAX, L_RETURNFLAG,
        L_LINESTATUS, L_SHIPDATE, L_COMMITDATE,
        L_RECEIPTDATE, L_SHIPINSTRUCT, L_SHIPMODE,
        L_COMMENT)SELECT *FROM LINEITEM;