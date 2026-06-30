/* Question 1 */

SELECT
	Product,
	ROUND(SUM(Total_Sales), 2) AS Product_Total,
	ROUND((100*SUM(Total_Sales))/(SELECT SUM(Total_Sales) FROM Sales), 2) AS Contribution_Percent
FROM
	Sales
GROUP BY
	Product
ORDER BY
	Product_Total DESC
	
/* Question 2 */

WITH metrics AS
(SELECT
	Product,
	SUM(Units_Sold) AS total_units_sold,
	SUM(Operating_Profit) AS product_total_profit
FROM 
	Sales
GROUP BY 
	Product)
SELECT
    Product,
    ROUND(product_total_profit / total_units_sold, 2) AS profit_per_unit
FROM 
	metrics
ORDER BY 
	profit_per_unit DESC


/* Question 3 */

SELECT
	Region,
	ROUND(SUM(Total_Sales), 2) AS Region_Total,
	ROUND((100.0*SUM(Total_Sales))/(SELECT SUM(Total_Sales) FROM Sales), 2) AS Contribution_Percent
FROM
	Sales
GROUP BY
	Region
ORDER BY
	Region_Total DESC


/* Question 4 */

WITH yearly_metrics AS(
SELECT
	SUM(CASE WHEN strftime('%Y', Invoice_Date) = '2020' THEN Total_Sales ELSE 0 END) AS sales_2020,
	SUM(CASE WHEN strftime('%Y', Invoice_Date) = '2021' THEN Total_Sales ELSE 0 END) AS sales_2021,
	SUM(CASE WHEN strftime('%Y', Invoice_Date) = '2020' THEN Operating_Profit ELSE 0 END) AS profit_2020,
	SUM(CASE WHEN strftime('%Y', Invoice_Date) = '2021' THEN Operating_Profit ELSE 0 END) AS profit_2021
FROM
	Sales
)
SELECT
	sales_2020,
	sales_2021,
	profit_2020,
	profit_2021,
	ROUND((100.0 * (sales_2021 - sales_2020) / sales_2020),2) AS Sales_YoY_Growth,
	ROUND((100 * (profit_2021 - profit_2020) / profit_2020),2) AS Profit_YoY_Growth
FROM
	yearly_metrics

/* Question 5 */

WITH metrics AS
(SELECT
	Product,
	SUM(Units_Sold) AS total_units_sold,
	SUM(Operating_Profit) AS product_total_profit,
	ROUND(SUM(Operating_Profit) / SUM(Units_Sold), 2) AS profit_per_unit
FROM 
	Sales
GROUP BY 
	Product),
avg_profit AS
(SELECT
	ROUND(AVG(profit_per_unit),2) AS avg_profit_per_unit
FROM
	metrics)

SELECT
	m.Product,
	m.profit_per_unit,
	a.avg_profit_per_unit,
	ROUND(((m.profit_per_unit - a.avg_profit_per_unit) / a.avg_profit_per_unit) * 100 ,2) AS "Difference (Percentage)",
	CASE WHEN a.avg_profit_per_unit > m.profit_per_unit THEN 'Below Average' ELSE 'Above Average' END AS Performance
FROM 
	metrics AS m
CROSS JOIN 
	avg_profit AS a
ORDER BY 
	m.profit_per_unit DESC

/* Question 6 */

SELECT
	Retailer,
	Product,
	SUM(Total_Sales) AS "Total Sales",
	SUM(Operating_Profit) AS "Operating Profit"
FROM
	Sales
GROUP BY
	Retailer, Product
ORDER BY
	"Total Sales" DESC

/* Question 7 */

WITH metrics AS
(SELECT
	Region,
	SUM(Total_Sales) AS total_region_sales,
	ROUND(100 * SUM(Operating_Profit) / SUM(Total_Sales), 2) AS region_profit_margin
FROM 
	Sales
GROUP BY 
	Region),
region_averages AS
(SELECT
	ROUND(AVG(total_region_sales),2) AS avg_region_sales,
	ROUND(AVG(region_profit_margin),2) AS avg_region_margin
FROM
	metrics)

SELECT
	m.Region,
	m.total_region_sales,
	m.region_profit_margin,
	r.avg_region_sales,
	r.avg_region_margin,
	CASE WHEN m.total_region_sales > r.avg_region_sales THEN 'Above Average' ELSE 'Below Average' END AS "Sales Performance",
	CASE WHEN m.region_profit_margin > r.avg_region_margin THEN 'Above Average' ELSE 'Below Average' END AS "Profit Margin Performance",
	CASE WHEN m.total_region_sales > r.avg_region_sales AND m.region_profit_margin > r.avg_region_margin THEN 'Strong Performer'
		 WHEN m.total_region_sales > r.avg_region_sales AND m.region_profit_margin < r.avg_region_margin THEN 'High Sales, Low Profitability'
		 WHEN m.total_region_sales < r.avg_region_sales AND m.region_profit_margin > r.avg_region_margin THEN 'Low Sales, High Profitability'
		 ELSE 'Weak Performer' END AS Evaluation
FROM 
	metrics AS m
CROSS JOIN 
	region_averages AS r
ORDER BY
    m.total_region_sales DESC

/* Question 8 */

SELECT
	Sales_Method,
	ROUND(100 * SUM(Operating_Profit)/SUM(Total_Sales), 2) AS Profit_Margin,
	SUM(total_sales) AS "Total_Sales",
	ROUND((100.0 * SUM(Total_Sales))/(SELECT SUM(Total_Sales) FROM Sales), 2) AS Contribution_Percent
FROM
	Sales
GROUP BY
	Sales_Method
ORDER BY
	Profit_Margin DESC

/* Question 9 */

SELECT
	strftime('%m', Invoice_Date) AS Month,	
	SUM(Total_Sales) AS "Total Sales",
	SUM(Operating_Profit) AS "Operating Profits"
FROM
	Sales
GROUP BY
	Month