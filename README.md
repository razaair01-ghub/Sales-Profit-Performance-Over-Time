# 📊 Sales & Profit Performance Over Time

A complete SQL + Power BI analytics project to analyze **Sales, Profit, and Order Volume** trends, including **Month-over-Month (MoM)** and **Year-over-Year (YoY)** growth, forecasting, and category performance insights.

---
---
### Dataset Overview :
Supermart Retail Dataset (~50K records) consisting of Orders, Customers, Products, Regions, and Inventory tables with fields for Sales, Profit, Quantity, Discounts, Delivery Dates, and Stock Levels — ideal for segmentation, forecasting, performance analytics, and dashboard creation.

# 📌 Project Overview
This project analyzes Sales, Profit, and Order Volume trends over time using SQL and Power BI. It focuses on MoM and YoY trend evaluation, forecasting future performance, and identifying category-level insights for strategic business decisions.

---

# 📌 Problem Statement
**How have Sales, Profit, and Order Volume trended month over month and year over year across product categories?**

---

# 📌 Dataset Description
### **Orders Table**
- OrderID  
- OrderDate  
- ProductID  
- Quantity  
- SalesAmount  
- ProfitAmount  

### **Products Table**
- ProductID  
- Category  
- Sub-Category  

**Data Grain:** One row per order line  
**Time Range:** Multi-year (suitable for YoY trend analysis)

---

# 🛠️ Tools & Technologies
- SQL Server / MySQL  
- Power BI Desktop  
- DAX (Time Intelligence)  
- Power Query (ETL)  
- Star Schema Modeling  

---

# 🔄 ETL / Data Cleaning
- Converted OrderDate to proper date format  
- Extracted **Year**, **Month**, **MonthName**  
- Removed invalid/null rows  
- Created a **Date Dimension**  
- Built **Star Schema**: Fact Orders, Dim Products, Dim Date  

---

# 🧮 SQL Tasks & Queries

• Performed complete ETL: cleaned raw Orders & Products data, fixed date formats, removed duplicates, created Date Dimension, and built a Star Schema (Fact Orders + Dim Products + Dim Date).

• Wrote Advanced SQL Logic: created Monthly summaries, MoM & YoY trend analysis using Window Functions (LAG, LEAD), CTEs, and time-series aggregations.

# 📊 Power BI Dashboard
📸 Dashboard Screenshot 1 — Monthly Sales & Profit Trend

- Total Sales = SUM(Orders[SalesAmount])
- Total Profit = SUM(Orders[ProfitAmount])

- MoM Sales % = 
- VAR PrevMonth = CALCULATE([Total Sales], DATEADD('Date'[Date], -1, MONTH))
- RETURN DIVIDE([Total Sales] - PrevMonth, PrevMonth)

- YoY Sales % =
- VAR PrevYear = CALCULATE([Total Sales], DATEADD('Date'[Date], -1, YEAR))
- RETURN DIVIDE([Total Sales] - PrevYear, PrevYear)
## 📌 KPIs

- Total Sales

- Total Profit

- Order Volume

- MoM Growth %

- YoY Growth %

- Profit Margin %

## 📈 Insights & Recommendations

Sales and Profit show strong YoY growth → business scaling effectively

Seasonal peaks in Q3–Q4 → plan marketing campaigns accordingly

Negative MoM dips indicate potential demand or stock issues in certain months

Some categories show declining profit margin → pricing and cost optimization required

Forecasting indicates steady upward trend → good for long-term planning


