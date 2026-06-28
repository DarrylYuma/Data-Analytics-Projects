# Adidas US Sales Analysis

An end-to-end data analysis project exploring Adidas sales performance across the United States, using Excel for data cleaning, SQL (SQLite) for querying and Tableau for visualization.

**Tools:** Excel · SQL · SQLite · Tableau &nbsp;

---

## Project Overview

This project investigates what drives sales revenue and profitability for Adidas in the US market. Using a mock retail dataset covering retailers, regions, products, sales channels, and financials, the analysis surfaces patterns and trends across five key dimensions:

- Product profitability and revenue contribution
- Regional performance and margin efficiency
- Sales channel effectiveness (In-store, Online, Outlet)
- Retailer-product performance combinations
- Seasonal sales trends over time

---

## Key Findings

**Product Performance**
- Men's Street Footwear leads revenue contribution at 23%, while Women's Athletic Footwear trails at 11%. Contribution across the remaining four categories is relatively balanced at 13–19%.
- The men's/women's revenue split is nearly even at 53/47, suggesting a balanced customer base across both segments.
- Apparel products consistently outperform footwear in profit per unit, all three below-average categories are footwear.

**Regional Performance**
- The West leads in revenue ($36.4M) but carries a below-average margin of 35.73%. The Northeast follows a similar pattern at $25M and 38.81%.
- The South and Midwest are the inverse, lower revenue ($20.6M and $16.6M) but stronger margins at 44.76% and 41.14% respectively.

**Retailers and Sales Channels**
- Sports-focused retailers (Foot Locker, Sports Direct, West Gear) generate over double the revenue and profit of general retailers like Kohl's, Amazon, and Walmart.
- Online is the strongest sales channel, contributing 37.42% of total revenue with the highest profit margin at 43.48%.

**Seasonality and Growth**
- Peak months are July, August, and December, aligning with summer demand and year-end holidays. The weakest months are February–March and October–November.
- Year-over-year growth from 2020 to 2021 was significant: revenue grew by 295.79% and profit by 323.82%.

---

## Recommendations

- Investigate operating cost structures in the West and Northeast, particularly distribution and retailer costs to bring margins closer to the company average.
- Prioritize inventory allocation and marketing toward sports-focused retail partners, and reassess the value of a broad presence in general retail.
- Continue investing in the online channel through e-commerce improvements and digital marketing, given its leading margin and revenue contribution.
- Explore apparel-footwear bundling promotions to shift a greater share of sales toward higher-margin products.
- Intensify inventory planning and marketing during peak months (July, August, December), and consider targeted discounts during weaker periods to stimulate demand.

---

## Dashboard

The Power BI dashboard includes the following visualizations, all slicer-enabled for filtering by Product, Sales Method, and Month:

- **KPI Cards** - Total Sales, Operating Profit, Profit Margin, and Units Sold with year-over-year deltas
- **Region Revenue / Margin** - Combo chart of sales volume and profit margin by region
- **Product Revenue** - Bar chart comparing revenue across all six product categories
- **Revenue / Profit Timeline** - Dual time-series tracking monthly sales and profit by product
- **Method Contribution / Margin** - Pie chart breaking down sales channel split across In-store, Online, and Outlet

Below is a preview of the dashboard:
<img width="1381" alt="Dashboard Image" src="https://github.com/DarrylYuma/Excel-Data-Analysis-Projects/blob/main/Adidas%20US%20Sales%20Analysis/Adidas%20US%20Sales%20Dashboard.png">

---

## SQL Analysis

Nine SQL queries were written to answer specific business questions, ranging from revenue contribution and profit per unit to retailer-product combinations and regional margin efficiency. Techniques used include CTEs, CASE statements, CROSS JOINs, aggregation with GROUP BY, and `strftime()` for date-based filtering.

---

## Files

| File / Links | Description |
|---|---|
| [Dataset](https://www.kaggle.com/datasets/heemalichaudhari/adidas-sales-dataset/data) | Mock dataset from Kaggle |
| `Adidas.db` | SQLite database |
| `analysis.sqbpro` | All SQL queries |
| `Adidas US Sales Analysis.pdf` | Documentation |
| [Tableau Dashboard](https://public.tableau.com/app/profile/darryl.yuma/viz/AdidasUSSales_17826375574330/DashboardPublic) | Tableau dashboard |
