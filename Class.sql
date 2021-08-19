USE bank;
SELECT * FROM bank.order
Where amount > 12000;

SELECT account_id, amount, k_symbol 
FROM bank.order
Where k_symbol = "SIPO";

SELECT account_id as 'Account', amount, k_symbol as 'Type of Payment' 
FROM bank.order
Where k_symbol = "SIPO";

SELECT account_id as 'Account', amount, k_symbol as 'Type of Payment' 
FROM bank.order
Where k_symbol = "SIPO" AND amount > 1000;

SELECT account_id as 'Account', amount, k_symbol as 'Type of Payment' 
FROM bank.order
Where k_symbol IN ("SIPO", "LEASING", "UVER")  AND amount > 1000;

SELECT account_id as 'Account', amount, k_symbol as 'Type of Payment' 
FROM bank.order
WHERE NOT k_symbol = "SIPO"  AND amount > 1000;

-- numeric
SELECT * 
FROM loan;

SELECT * , amount - payments as balance
FROM loan;

SELECT * , amount - payments as balance, round((amount - payments)/1000,2) as "balance in thousand"
FROM loan;

SELECT * , amount - payments as balance, round(((amount - payments)/amount)*100,2) as "balance as percent"
FROM loan
LIMIT 10;

SELECT *
FROM account
ORDER BY account_id DESC
Limit 10;

SELECT COUNT(frequency), frequency
FROM account
GROUP BY frequency; 

SELECT distinct frequency
FROM account;

SELECT COUNT(DISTINCT frequency)
FROM account;

SELECT *
From district;

SELECT A2 as district_name, A11 as avg_salary
From district
where A11>10000;

SELECT *
FROM card
WHERE type = "junior"
ORDER BY card_id ASC
LIMIT 10;

SELECT COUNT(*)
FROM bank.order;

SELECT COUNT(k_symbol), k_symbol
FROM bank.order
GROUP BY k_symbol;

SELECT k_symbol, COUNT(*)
FROM bank.order
GROUP BY k_symbol;

SELECT AVG(amount) From bank.order;
SELECT MAX(amount) From bank.order;
SELECT MIN(amount) FROM bank.order;

SELECT k_symbol, MAX(amount) From bank.order
Group BY k_symbol;

SELECT *, concat(bank_to,"-",account_to) as "concat"
FROM bank.order;

SELECT k_symbol, left(k_symbol,3), right(k_symbol,2), concat(left(k_symbol,2), right(k_symbol,2)) as "standard"
from bank.order;



SELECT loan_id, account_id, amount, status,
CASE
WHEN status = "B" then "Defauter - contract finished"
WHEN status = "A" then "Good - contract finished"
WHEN status = "C" then "Good - ontract ongoing"
WHEN status = "D" then "In Debt - contract ongoing"
ELSE "No Status"
END AS "status description"
FROM loan;

SELECT loan_id, account_id, amount, status,
CASE
WHEN status = "B" then "Defauter - contract finished"
WHEN status = "A" AND amount > 10000 then "Good - contract finished"
WHEN status = "C" AND amount <= 1000 then "Good - ontract ongoing"
WHEN status = "D" then "In Debt - contract ongoing"
ELSE "No Status"
END AS "status description"
FROM loan;

-- datetime functions
SELECT *, convert(date, DATE)
FROM account;

SELECT *, convert(date, DATETIME)
FROM account;

SELECT *, convert(left(issued,6),DATE) as 'issued_date'
FROM card;

SELECT *, date_format(convert(left(issued,6),DATE), '%d-%m-%Y') as 'issued_date'
FROM card;

SELECT *, date_format(convert(left(issued,6),DATE), '%M') as 'issued_month'
FROM card;

-- calculation
SELECT 10 + 5;

SELECT 10 > 5;

SELECT Null;

SELECT COUNT(100);

SELECT COUNT(NULL);

SELECT *
FROM bank.order
WHERE k_symbol IS NULL;

SELECT SUM(ISNULL(k_symbol))
FROM bank.order;

SELECT DISTINCT CONCAT('*',k_symbol, '*')
FROM bank.order;

SELECT *
FROM account
WHERE frequency IN ("POPLATEK MESICNE")
ORDER BY district_id ASC;

SELECT DISTINCT A3
FROM district;

SELECT * 
FROM district
WHERE A3 in ("north Bohemia", "north Moravia");

SELECT * 
FROM district
WHERE A3 Like "north%";

SELECT * ,convert(date,DATE) as "date_"
FROM trans
WHERE convert(date,DATE) >= "1993-01-01" AND  convert(date,DATE) <= "1993-01-15";

SELECT * ,convert(date,DATE) as "date_"
FROM trans
WHERE convert(date,DATE) BETWEEN "1993-01-01" AND  "1993-01-15";

SELECT AVG(amount), status
FROM loan
Group by status;

SELECT AVG(amount) as average, status
FROM loan
WHERE amount > 100000
Group by status
Order by average;

SELECT k_symbol, ROUND(AVG(amount),1) as Average
FROM bank.trans
GROUP BY k_symbol
ORDER BY Average DESC;

SELECT k_symbol, bank_to, ROUND(AVG(amount),1) as Average
FROM bank.order
WHERE k_symbol <> " "
GROUP BY k_symbol, bank_to
ORDER BY k_symbol, bank_to DESC;

SELECT k_symbol, bank_to, ROUND(AVG(amount),1) as Average
FROM bank.order
GROUP BY k_symbol, bank_to
HAVING ROUND(AVG(amount),1) > 1000;
-- ORDER BY k_symbol, bank_to DESC;

SELECT duration, AVG(amount-payments) as balances
FROM loan
WHERE amount > 100000
Group by duration;
-- Order by average;

SELECT *, amount-payments as balanc, AVG(amount-payments) OVER (PARTITION BY status)
FROM loan;

SELECT * FROM bank.account;
SELECT * FROM bank.order;

SELECT * FROM bank.order
WHERE k_symbol = "SIPO";

SELECT district_id ,COUNT(a.account_id)
FROM bank.account a
JOIN bank.order o
ON a.account_id = o.account_id
WHERE k_symbol = "SIPO"
GROUP BY district_id
ORDER BY district_id;

SELECT district_id ,COUNT(DISTINCT a.account_id)
FROM bank.account a
JOIN bank.order o
ON a.account_id = o.account_id
WHERE k_symbol = "SIPO"
GROUP BY district_id
ORDER BY district_id;














