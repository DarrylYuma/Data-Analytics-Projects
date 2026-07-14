/* Question 1 */
SELECT
	Department,
	COUNT(*) AS total_employees,
	COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS employees_left,
	ROUND(100.0 * COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) / COUNT(*), 2) AS attrition_rate
FROM
	HR
GROUP BY
	Department
ORDER BY
	attrition_rate DESC

/* Question 2 */
SELECT
	CASE WHEN Age < 35 THEN 'Young' ELSE 'Old' END AS age_group,
	CASE WHEN TotalWorkingYears < 10 THEN 'Inexperienced' ELSE 'Experienced' END AS experience_group,
	JobLevel,
	ROUND(100.0 * COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) / COUNT(*), 2) AS attrition_rate,
	COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS attrition_count,
	COUNT(*) AS employee_count
FROM 
	HR 
GROUP BY
	age_group, experience_group, JobLevel
ORDER BY
	attrition_rate DESC

/* Question 3 */
SELECT
	CASE WHEN DistanceFromHome >= 9 THEN 'Far' ELSE 'Close' END AS commute_distance,
	BusinessTravel,
	ROUND(100.0 * COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) / COUNT(*), 2) AS attrition_rate,
	COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS attrition_count,
	COUNT(*) AS employee_count
FROM
	HR
WHERE
	MaritalStatus = 'Married'
GROUP BY
	commute_distance, BusinessTravel
ORDER BY
	attrition_rate DESC

/* Question 4 */
SELECT
	CASE WHEN YearsInCurrentRole > 5 THEN 'Stagnant' ELSE 'Active' END AS role_stagnation,
	CASE WHEN YearsSinceLastPromotion > 2 THEN 'Stagnant' ELSE 'Active' END AS promo_stagnation,
	CASE WHEN YearsAtCompany > 5 THEN 'Tenured' ELSE 'New' END AS tenure,
	ROUND(100.0 * COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) / COUNT(*), 2) AS attrition_rate,
	COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS attrition_count,
	COUNT(*) AS employee_count
FROM
	HR
GROUP BY
	role_stagnation, promo_stagnation, tenure
ORDER BY
	attrition_rate DESC

/* Question 5 */
WITH ranked AS (
	SELECT
		JobRole,
		MonthlyIncome,
		ROW_NUMBER() OVER (PARTITION BY JobRole ORDER BY MonthlyIncome) AS row_num,
		COUNT(*) OVER (PARTITION BY JobRole) AS role_total
	FROM 
		HR
),

medians AS (
    SELECT
        JobRole,
        AVG(MonthlyIncome) AS median_income
    FROM ranked
    WHERE row_num IN (
        (role_total + 1) / 2,
        (role_total + 2) / 2
    )
    GROUP BY JobRole
),

employee_salary_position AS (
	SELECT
		h.EmployeeNumber,
		h.JobRole,
		h.Gender,
		h.MonthlyIncome,
		m.median_income,
		CASE WHEN h.MonthlyIncome < m.median_income THEN 'Below Median' ELSE 'At or Above Median' END AS income_position
	FROM 
		HR h
	JOIN 
		medians m ON h.JobRole = m.JobRole
)

SELECT
	JobRole,
	Gender,
	median_income,
	SUM(CASE WHEN income_position = 'Below Median' THEN 1 ELSE 0 END) AS below_count,
	COUNT(*) AS total_employees,
	ROUND(SUM(CASE WHEN income_position = 'Below Median' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS below_percentage
FROM 
	employee_salary_position	
GROUP BY
	JobRole, Gender
ORDER BY
	JobRole

/* Question 6 */
SELECT
	CASE WHEN StockOptionLevel < 2 THEN 'Lower' ELSE 'Higher' END AS stock_group,
	CASE WHEN PercentSalaryHike < 16 THEN 'Lower' ELSE 'Higher' END AS salaryhike_group,
	ROUND(100.0 * COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) / COUNT(*), 2) AS attrition_rate,
	COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS attrition_count,
	COUNT(*) AS employee_count
FROM
	HR
GROUP BY
	stock_group, salaryhike_group
ORDER BY
	attrition_rate DESC

/* Question 7 */
WITH mins_and_max AS(
SELECT
	JobRole,
	MIN(MonthlyIncome) AS min_rate,
	MAX(MonthlyIncome) AS max_rate
FROM
	HR
GROUP BY
	JobRole)
	
SELECT
	JobRole,
	min_rate,
	max_rate,
	max_rate - min_rate AS income_range
FROM
	mins_and_max
ORDER BY
	income_range DESC

/* Question 8 */
WITH metrics AS(
SELECT
	JobRole,
	ROUND(AVG(CASE WHEN YearsAtCompany <= 5 THEN MonthlyIncome END), 2) AS new_income,
	ROUND(AVG(CASE WHEN YearsAtCompany > 5 THEN MonthlyIncome END), 2) AS tenured_income,
	COUNT(*) AS employee_count
FROM
	HR
GROUP BY
	JobRole)

SELECT
	JobRole,
	new_income,
	tenured_income,
	ROUND(tenured_income - new_income, 2) AS difference,
	employee_count
FROM 
	metrics
ORDER BY
	difference DESC