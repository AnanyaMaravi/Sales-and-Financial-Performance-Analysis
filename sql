create database internship;
use internship;
USE sales_analysis;

-- 1. Display all records
SELECT * FROM cleaned_sales;

-- 2. Total sales
SELECT SUM(sales) AS total_sales
FROM sales_data;

-- 3. Total profit
SELECT SUM(profit) AS total_profit
FROM sales_data;

-- 4. Total units sold
SELECT SUM(units_sold) AS total_units_sold
FROM sales_data;

-- 5. Country-wise sales
SELECT
    country,
    SUM(sales) AS total_sales
FROM sales_data
GROUP BY country
ORDER BY total_sales DESC;

-- 6. Product-wise profit
SELECT
    product,
    SUM(profit) AS total_profit
FROM sales_data
GROUP BY product
ORDER BY total_profit DESC;

-- 7. Segment-wise sales
SELECT
    segment,
    SUM(sales) AS total_sales
FROM sales_data
GROUP BY segment
ORDER BY total_sales DESC;

-- 8. Monthly sales
SELECT
    month_number,
    month_name,
    SUM(sales) AS monthly_sales
FROM sales_data
GROUP BY month_number, month_name
ORDER BY month_number;

-- 9. Year-wise sales
SELECT
    year,
    SUM(sales) AS yearly_sales
FROM sales_data
GROUP BY year
ORDER BY year;

-- 10. Discount band analysis
SELECT
    discount_band,
    SUM(discounts) AS total_discounts,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales_data
GROUP BY discount_band
ORDER BY total_profit DESC;

-- 11. Profit margin by product
SELECT
    product,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2
    ) AS profit_margin
FROM sales_data
GROUP BY product
ORDER BY profit_margin DESC;

-- 12. Country and product performance
SELECT
    country,
    product,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales_data
GROUP BY country, product
ORDER BY total_sales DESC;

-- 13. Average selling price
SELECT
    ROUND(
        SUM(sales) / NULLIF(SUM(units_sold), 0), 2
    ) AS average_selling_price
FROM sales_data;

-- 14. Most profitable segment
SELECT
    segment,
    SUM(profit) AS total_profit
FROM sales_data
GROUP BY segment
ORDER BY total_profit DESC
LIMIT 1;

-- 15. Overall business performance
SELECT
    SUM(gross_sales) AS gross_sales,
    SUM(discounts) AS total_discounts,
    SUM(sales) AS net_sales,
    SUM(cogs) AS total_cogs,
    SUM(profit) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2
    ) AS profit_margin
FROM sales_data;
