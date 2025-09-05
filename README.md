
# 🛒 Retail Sales Analysis (SQL Project)

## 📌 Project Overview

This project focuses on analyzing retail sales data using **SQL**.
The dataset contains transaction-level details such as sales date, time, customer demographics, product categories, quantity, and revenue.
Through SQL queries, we answer important **business questions** like sales trends, top customers, and category performance.

---

## 📂 Dataset

**File:** `SQL - Retail Sales Analysis_utf (1).csv`
**Table Schema (`retail_sales`)**:

* `transactions_id` (Primary Key)
* `sale_date` (Date)
* `sale_time` (Time)
* `customer_id` (Integer)
* `gender` (Varchar)
* `age` (Integer)
* `category` (Varchar)
* `quantity` (Integer)
* `price_per_unit` (Float)
* `cogs` (Float)
* `total_sale` (Float)

---

## ⚙️ SQL Workflow

### 1. Data Cleaning

* Checked for `NULL` values and deleted invalid records.
* Renamed column `quantiY` → `quantity`.

### 2. Data Exploration

* Total sales records.
* Number of unique customers.
* Missing values check.

### 3. Business Analysis

Key questions answered with SQL queries:

1. Sales made on a specific date (`2022-11-05`).
2. Clothing transactions with quantity > 10 in Nov-2022.
3. Total sales (`SUM(total_sale)`) per category.
4. Average customer age for Beauty products.
5. Transactions with sales > 1000.
6. Transactions count by Gender & Category.
7. Best selling month of each year (using `RANK`).
8. Top 5 customers by sales.
9. Unique customers per category.
10. Shift-based sales distribution (Morning, Afternoon, Evening).

---

## 📊 Insights

* Identified **top categories** driving revenue.
* Found **high-value customers** contributing maximum sales.
* Observed **time-of-day sales patterns**.
* Discovered **seasonal/monthly trends** in sales.
