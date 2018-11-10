/*
SELECT * 
FROM CUSTOMERS_12
WHERE Amt_Credited_Date IN (SELECT MAX(Amt_Credited_Date)
													FROM CUSTOMERS_12
													GROUP BY Cid)
ORDER BY Cid;


SELECT c.Cid,c.Cname,c.Amt,EXTRACT(MONTH FROM c.Amt_Credited_Date)  "Month"
FROM Customers_12 c
WHERE (c.cid,c.Amt)  IN (SELECT Cid,MAX(Amt)
							FROM CUSTOMERS_12
							GROUP BY Cid)
ORDER BY Cid;
					
SELECT * 
FROM CUSTOMERS_12 
WHERE POSITION('i' IN cname) = 2;


SELECT * 
FROM CUSTOMERS_12 
WHERE INDEX(cname,'i') = 2;

SELECT * 
FROM CUSTOMERS_12 
WHERE cname LIKE '_i%';

CREATE VIEW COUNT_TABLE AS
SELECT CAST(CAST(Amt_Credited_Date AS FORMAT 'MMMM' )AS VARCHAR(40) )  MONTHS ,Domains Dom,COUNT( DISTINCT Cid) CustNo
FROM CUSTOMERS_12
GROUP BY  CAST(CAST(Amt_Credited_Date AS FORMAT 'MMMM' )AS VARCHAR(40) ),Domains;

SELECT MONTHS,DOM,CUSTNO FROM COUNT_TABLE 
WHERE (CUSTNO,MONTHS) IN 
(SELECT MAX(CUSTNO),MONTHS
from COUNT_TABLE
GROUP BY MONTHS)
ORDER BY MONTHS;
*/