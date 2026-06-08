show databases;
use task6;
describe details;
describe orders;
SELECT `Order Date`
FROM orders
LIMIT 10;
SELECT *
FROM orders o
JOIN details d
ON o.`Order ID` = d.`Order ID`
LIMIT 5;
SELECT
    `Order Date`,
    STR_TO_DATE(`Order Date`, '%d-%m-%Y') AS Converted_Date
FROM orders
LIMIT 5;
SELECT
    `Order Date`,
    YEAR(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS Year,
    MONTH(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS Month
FROM orders
LIMIT 5;
SELECT
    YEAR(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS Year,
    MONTH(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS Month,
    COUNT(*) AS Total_Orders
FROM orders
GROUP BY Year, Month
ORDER BY Year, Month;
SELECT
    YEAR(STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) AS Year,
    MONTH(STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) AS Month,
    SUM(d.Amount) AS Monthly_Revenue
FROM orders o
JOIN details d
ON o.`Order ID` = d.`Order ID`
GROUP BY Year, Month
ORDER BY Year, Month;
SELECT
    YEAR(STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) AS Year,
    MONTH(STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) AS Month,
    SUM(d.Amount) AS Monthly_Revenue,
    COUNT(DISTINCT o.`Order ID`) AS Order_Volume
FROM orders o
JOIN details d
ON o.`Order ID` = d.`Order ID`
GROUP BY Year, Month
ORDER BY Year, Month;
SELECT
    YEAR(STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) AS Year,
    MONTH(STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) AS Month,
    SUM(d.Amount) AS Revenue
FROM orders o
JOIN details d
ON o.`Order ID` = d.`Order ID`
GROUP BY Year, Month
ORDER BY Revenue DESC
LIMIT 3;
SELECT
    YEAR(STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) AS Year,
    MONTH(STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) AS Month,
    SUM(d.Amount) AS Revenue
FROM orders o
JOIN details d
ON o.`Order ID` = d.`Order ID`
GROUP BY Year, Month
ORDER BY Revenue DESC
LIMIT 3;