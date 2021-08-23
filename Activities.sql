-- activity 1
-- 1
SELECT A1 as "district_id", A2 as "district_name", A11 as salary
FROM district
WHERE A11 > 10000; 

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
FROM account;


-- 2.08 activity 3

-- 1
SELECT A2 as "district", COUNT(client_id)
FROM bank.client c
JOIN bank.district d
ON c.district_id = d.A1
GROUP BY A2
ORDER BY COUNT(client_id);

-- 2
SELECT A3 as "region" ,COUNT(c.client_id)
FROM bank.client c
JOIN bank.district d
ON c.district_id = d.A1
GROUP BY A3
ORDER BY COUNT(c.client_id) DESC;

-- 3
SELECT district_id, A2 as 'region', SUM(amount) as "total_amount", AVG(amount) as "avg_loan" 
FROM bank.loan l
JOIN bank.account a
ON a.account_id = l.account_id
JOIN district d
ON A1 = district_id
GROUP BY a.district_id, d.A2;

-- 4
SELECT A1 as "district" , date_format(convert(date,DATE), '%Y') as 'Year', COUNT(a.account_id)
FROM bank.account a
JOIN bank.district d
ON a.district_id = d.A1
GROUP BY d.A1, date_format(convert(date,DATE), '%Y')
ORDER BY d.A1;


-- activity 3

-- 1
SELECT card_id, date_format(convert(left(issued,6),DATE), '%Y') as 'year_issued'
FROM card
WHERE type = "gold";
 
-- 2
SELECT card_id, date_format(convert(left(issued,6),DATE), '%Y') as year_issued
FROM card
WHERE type = "gold"
ORDER BY year_issued ASC;

-- 3
SELECT card_id, date_format(convert(left(issued,6),DATE), '%d of %M of %Y') as year_issued
FROM card
WHERE type = "gold"
ORDER BY year_issued ASC;

-- activity 4
SELECT amount, COUNT(NULL)
FROM trans
GROUP BY amount


-- 2.06




