DROP TABLE IF EXISTS zepto;
CREATE TABLE zepto(
	sku_id SERIAL PRIMARY KEY,
	category VARCHAR(100),
	name VARCHAR(150) NOT NULL,
	mrp	NUMERIC(10,2),
	discountPercent	NUMERIC(10,2),
	availableQuantity INT,
	discountedSellingPrice NUMERIC(10,2),
	weightInGms INT,
	outOfStock BOOLEAN,
	quantity INT
);

SELECT * FROM zepto ORDER BY sku_id;

--data exploration

--count of rows
SELECT COUNT(*) FROM zepto;

--sample data
SELECT * FROM zepto
LIMIT 10;

--find null values
SELECT * FROM zepto
WHERE category IS NULL
OR
name IS NULL
OR
mrp IS NULL
OR
discountpercent IS NULL
OR
availablequantity IS NULL
OR
discountedsellingprice IS NULL
OR
weightingms IS NULL
OR
outofstock IS NULL
OR
quantity IS NULL;

--different product category
SELECT DISTINCT category
FROM zepto
ORDER BY category;

--product in stock and out of stock
SELECT outofstock, COUNT(sku_id)
FROM zepto
GROUP BY outofstock;

--product names present multiple times
SELECT name, COUNT(name) AS multiple_names
FROM zepto
GROUP BY name
HAVING COUNT(name)>1
ORDER BY COUNT(name) DESC;

--data cleaning

--products with price zero
SELECT * FROM zepto
WHERE mrp=0 OR discountedsellingprice=0;

--so we need to delete the above product with mrp 0
DELETE FROM zepto
WHERE sku_id=3607;

OR

DELETE FROM zepto
WHERE mrp=0;

--the mrp is in paise, convert it into rupees
UPDATE zepto
SET mrp=mrp/100.0,
discountedsellingprice=discountedsellingprice/100.0;

SELECT mrp,discountedsellingprice FROM zepto;

--data analysis
--Q1. Find the top 10 best-value products based on the discount percentage.
SELECT DISTINCT name, mrp, discountpercent
FROM zepto
ORDER BY discountpercent DESC
LIMIT 10;

--Q2.What are the Products with High MRP but Out of Stock

SELECT DISTINCT name, mrp
FROM zepto
WHERE outofstock=TRUE
ORDER BY mrp DESC
LIMIT 5;

--Q3.Calculate Estimated Revenue for each category
SELECT category, SUM(availablequantity*discountedsellingprice) AS Total_Revenue
FROM zepto
GROUP BY category
ORDER BY Total_Revenue;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
SELECT name, mrp, discountpercent
FROM zepto
WHERE mrp>500 AND discountpercent<10;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
SELECT category, ROUND(AVG(discountpercent),2) AS Highest_avg_discount
FROM zepto
GROUP BY category
ORDER BY Highest_avg_discount DESC
LIMIT 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, weightingms, discountedsellingprice,
ROUND(discountedsellingprice/weightingms,2) AS price_per_gram
FROM zepto
WHERE weightingms>100
ORDER BY price_per_gram;

--Q7.Group the products into categories like Low, Medium, Bulk (in terms of weightingms)
SELECT DISTINCT name, weightingms,
	CASE
		WHEN weightingms<1000 THEN 'Low'
		WHEN weightingms<5000 THEN 'Medium'
		ELSE 'Bulk'
	END AS Weight_category
FROM zepto;

----Q8.What is the Total Inventory Weight Per Category
SELECT category, SUM(availablequantity*weightingms) AS total_inventory_quantinty
FROM zepto
GROUP BY category
ORDER BY total_inventory_quantinty;


