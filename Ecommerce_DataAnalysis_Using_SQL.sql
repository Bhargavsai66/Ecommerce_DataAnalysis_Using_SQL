-- project is a name of database
USE project;

-- ecommerce_data is a tablename in project database
-- view table
SELECT * FROM ecommerce_data;

-- viewing total no of records in table
SELECT COUNT(*) AS 'Total No Records'  FROM ecommerce_data;

-- checking total sales
SELECT SUM(Sales) AS 'TOTAL SALES' FROM ecommerce_data;

-- checking total sales w.r.t Females
SELECT SUM(Sales) AS 'Total Sales By Female' FROM ecommerce_data
WHERE ecommerce_data.Gender = 'Female';

-- finding total sales w.r.t males
SELECT SUM(Sales) AS 'Total Sales By Male' FROM ecommerce_data
WHERE ecommerce_data.Gender = 'Male';

-- viewing total profit
SELECT SUM(Profit) AS 'Total Profit' FROM ecommerce_data;

-- finding wt r unique device_type
SELECT DISTINCT Device_Type 
FROM ecommerce_data;

-- finding avg, total, maxium, minimum sales
SELECT AVG(Sales) AS 'Avg Sales', SUM(Sales) AS 'Total Sales', MAX(Sales) AS 'Max Sale', MIN(Sales) AS 'Min Sale' 
FROM ecommerce_data;

-- finding avg, total, maxium, minimum sales w.r.t male
SELECT AVG(Sales) AS 'Avg Sales by Male', SUM(Sales) AS 'Total Sales by Male', MAX(Sales) AS 'Max Sale by Male', MIN(Sales) AS 'Min Sale by Male' 
FROM ecommerce_data
WHERE Gender = 'Male';

-- finding avg, total, maxium, minimum sales w.r.t females
SELECT AVG(Sales) AS 'Avg Sales by Female', SUM(Sales) AS 'Total Sales by Female', MAX(Sales) AS 'Max Sale by Female', MIN(Sales) AS 'Min Sale by Female' 
FROM ecommerce_data
WHERE Gender = 'Female';

-- finding unique payment_method
SELECT DISTINCT Payment_method FROM ecommerce_data;

-- finding total transaction in each type of payment_method
SELECT DISTINCT Payment_method, COUNT(*) AS 'No of Transaction' 
FROM ecommerce_data
GROUP BY Payment_method;

-- Finding total sales for each products
SELECT Product, SUM(Sales) AS 'Total Sales'
FROM ecommerce_data
GROUP BY Product
ORDER BY 'Total Sales' DESC;

-- finding total profit done by high orde_priority and female
SELECT SUM(Profit) AS 'Total Profit'
FROM ecommerce_data
WHERE Order_Priority = 'High' AND Gender = 'Female';

-- creating a other table contains day month year sales as fields
CREATE TABLE table2 AS
SELECT 
  YEAR(Order_Date) AS Years,
  DAY(Order_Date) AS Dates,
  MONTH(Order_Date) AS Months,
  Sales
FROM ecommerce_data;

-- checking data in table2
SELECT * FROM table2;

-- finding unique years from table2
SELECT DISTINCT Years FROM table2;

-- finding data w.r.t month gender sales profit payment_method in two tables
SELECT t2.Months, t1.Gender, t1.Sales, t1.Profit, t1.Payment_method
FROM ecommerce_data AS t1
INNER JOIN table2 AS t2
ON t1.Sales = t2.Sales
WHERE t2.Months = 7;

-- finding total sales in 7th month
SELECT SUM(t1.Sales) AS 'Total Sales'
FROM ecommerce_data AS t1
INNER JOIN table2 AS t2
ON t1.Sales = t2.Sales
WHERE t2.Months = 7;

-- creating a virtual view named viewdata contains this following
CREATE VIEW viewdata AS
(
SELECT t1.Gender, t1.Product_Category, t1.Product, t1.Sales, t1.Profit, t1.Payment_method, t2.Years, t2.Months
FROM ecommerce_data AS t1
INNER JOIN table2 AS t2
ON t1.Sales = t2.Sales
WHERE t1.Gender = 'Male'
);

-- viewing the data in view
SELECT * FROM viewdata;

-- finding product months sales and profit w.r.t list of month
SELECT Product, Months, SUM(Sales) AS 'Total Sales', SUM(Profit) AS 'Total Profit'
FROM viewdata 
WHERE Months IN (1,6,8,9)
GROUP BY Product, Months
ORDER BY Product, Months DESC ;




-- THE END 



















