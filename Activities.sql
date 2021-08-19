-- activity 1
-- 1
SELECT A1 as "district_id", A2 as "district_name", A11 as "salary"
FROM district; 

-- 2
SELECT *
FROM loan
WHERE status = "B";

-- 3
Select * 
from card
Where type = "junior"
LIMIT 10;

-- 4
SELECT loan_id, account_id, (amount - payments) as debt, status
FROM loan
WHERE status = "B"
ORDER by debt DESC;

-- 5



-- activity 2
Select * 
from card
Where type = "junior" and issued >= 980000;

SELECT *
From trans
WHERE type = "VYDAJ" and operation = "VYBER KARTOU" 
Limit 10;

SELECT loan_id, account_id, (amount - payments) as debt, status
FROM loan
WHERE status = "B" AND (amount - payments) > 10000
ORDER by debt DESC;

SELECT MIN(amount) as "min_amount", MAX(amount) as "max_amount"
FROM trans
WHERE amount > 0;

SELECT *, SUBSTR(date, 1, 2) as 'YY'
FROM account


-- 2.08 activity 3

-- 1


-- 2


-- 3


-- 4



