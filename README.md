**Zepto Sales & Inventory Analysis – SQL Project**

**📌 Project Overview**

This project analyzes Zepto’s product dataset to gain insights into sales, inventory, and product performance. It demonstrates SQL skills in data exploration, cleaning, and analysis using PostgreSQL.

**📂 Dataset Description**

The dataset contains details about Zepto’s products, including:
- sku_id – Unique product identifier
- category – Product category (e.g., Beverages, Snacks)
- name – Product name
- mrp – Maximum Retail Price (₹)
- discountPercent – Discount percentage offered
- availableQuantity – Stock available
- discountedSellingPrice – Price after discount
- weightInGms – Product weight in grams
- outOfStock – Boolean flag for stock status
- quantity – Quantity per SKU

**🔍 Project Workflow**

1. Data Exploration
- View sample data & row count
- Identify null values and duplicate product names
- List unique categories
- Check stock status (in-stock vs out-of-stock)

2. Data Cleaning
- Remove products with MRP = 0 or Selling Price = 0
- Convert prices from paise to rupees for accuracy

3. Data Analysis Queries
- Top 10 products by discount percentage
- Out-of-stock products with high MRP
- Estimated revenue per category
- Products with MRP > ₹500 and discount < 10%
- Top categories by average discount
- Price per gram for products above 100g (best value sort)
- Grouping products into Low, Medium, Bulk by weight
- Total inventory weight per category

🛠 Technologies Used
Database: PostgreSQL
SQL Concepts:
- SELECT, WHERE, ORDER BY, LIMIT
- GROUP BY, HAVING, Aggregations (SUM, AVG, COUNT)
- DISTINCT, CASE statements
- Data Cleaning using UPDATE & DELETE


📈 Sample Output Insights
- The Beverages category has the highest estimated revenue.
- Some products with very high MRP were completely out of stock.
- Price-per-gram analysis highlights best-value bulk products.
