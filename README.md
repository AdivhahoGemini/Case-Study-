# Bright Coffee Shop Sales Analysis - Case Study 1

## Project Overview
This is a complete end-to-end data analytics case study for **Bright Coffee Shop**. The business has appointed a new CEO whose goal is to grow revenue and improve product performance. As a Junior Data Analyst, I analyzed six months of transactional data (January – June 2023) to deliver actionable insights.

**Objective:**
- Identify which products generate the most revenue
- Determine peak sales times
- Analyze sales trends across products and time intervals
- Provide recommendations to improve sales performance

---

## How I Did the Case Study (Methodology)

I followed the official project structure outlined in the case study:

### 1. Planning & Architecture (Miro)
- Designed a complete **Data Flow & Architecture Diagram** showing the end-to-end pipeline (from Excel source → ETL → Databricks → Analysis → Presentation).
- Created a brainstorming mind map to identify key questions, dimensions, calculations, and deliverables.

### 2. Data Processing (Databricks + SQL)
- Converted the original Excel file to CSV format.
- Loaded data into Databricks.
- Performed data cleaning and transformations using SQL:
  - Created `time_buckets` (Morning, Afternoon, Evening)
  - Computed `revenue_per_day` = `unit_price` × `transaction_qty`
  - Handled data type issues (e.g., comma decimal separators)
  - Aggregated data by product category, product detail, time of day, and store location.

### 3. Data Analysis in Excel
- Exported processed data and built interactive pivot tables and charts:
  - Total Revenue per Product Type
  - Peak Time Analysis
  - Quantity of Items Sold by Category
  - Best-Selling Products

### 4. Presentation to the CEO
- Prepared a clear methodology document
- Created a professional presentation with visuals and recommendations

---

## Tools Used
- **Project Planning**: Miro
- **Data Processing**: Databricks + SQL
- **Data Analysis & Visualization**: Microsoft Excel (Pivot Tables & Charts)
- **Presentation**: Canva + Microsoft PowerPoint
- **Version Control**: GitHub

---

## Key Insights & Findings

### Summary of What Was Done and What I Found

**Dataset**: 149,456 transactions across 3 store locations (Lower Manhattan, Hell’s Kitchen, Astoria).

**Major Insights:**

| Analysis Area                  | Key Finding                                      | Impact |
|-------------------------------|--------------------------------------------------|--------|
| **Peak Sales Time**           | **Morning** dominates with **81,751** sales (55% of total) | Strongest performance window |
| **Top Product Categories**    | Coffee (23,913 units)<br>Tea (18,496 units)<br>Bakery (10,546 units) | Coffee & Tea drive ~66% of volume |
| **Revenue by Product Type**   | Coffee > Tea > Bakery > Drinking Chocolate       | Revenue closely follows sales volume |
| **Best-Selling Products**     | Spicy Eye Opener Chai Lg (1,218)<br>Morning Sunrise Chai Rg (1,207)<br>Multiple coffee & tea variants >1,100 units | Chai teas and large coffee drinks are star performers |

**Summary**:  
The analysis revealed a clear **morning peak**, strong dominance of **beverage categories** (especially Coffee and Tea), and specific high-performing products. Evening hours showed significantly lower performance. These insights provide the new CEO with clear direction on inventory focus, staffing, and marketing opportunities.

---

## Recommendations
- Run targeted marketing campaigns during slower Afternoon and Evening slots
- Increase stock and visibility of top-selling items (Chai variants and popular coffee drinks)
- Promote underperforming products through bundles or discounts
- Consider loyalty programs focused on morning customers

## Submission Files (as per requirements)
- Miro Plan/Diagram
- Processed Dataset with Pivot Tables & Charts
- PowerPoint Presentation
- SQL code

**Project Completed**: March 2026  
**Analyst**: Adivhaho

Feel free to explore the files and reach out for any questions!
