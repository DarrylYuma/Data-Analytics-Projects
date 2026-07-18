# HR Workforce Analytics

An end-to-end HR analytics project exploring employee attrition, compensation, and workforce trends using SQL (SQLite) for querying and Power BI for visualization.

**Tools:** Excel · SQL · SQLite · Power BI

---

## Project Overview

This project investigates factors associated with employee attrition using a mock HR dataset containing 1,470 employee records. Through SQL analysis and Power BI visualization, the project explores employee turnover, compensation, promotion history, and organizational factors across eight business questions:

- Department-level attrition analysis
- Employee profile and retention patterns
- Career and promotion stagnation
- Compensation benchmarking by job role
- Employee benefits and retention
- Income distribution across job roles
- Income progression with company tenure

---

## Key Findings

**Employee Profile & Retention**
- Young, inexperienced employees working in entry-level roles experience the highest attrition rate at 33.12%, indicating early career turnover is a significant retention challenge.
- Married employees with longer commutes who frequently travel for business experience the highest attrition among married employees at 21.57%.
- Early-tenured employees consistently exhibit higher attrition regardless of career stagnation, while promotion stagnation becomes a stronger contributor among more experienced employees.

**Organizational Factors**
- The Sales department records the highest attrition rate at 20.63%, while Research & Development maintains the lowest at 13.84%.
- Employees receiving lower stock option benefits consistently experience higher attrition, with stock options demonstrating a stronger relationship to retention than salary hike percentage.

**Compensation Patterns**
- Salary positioning relative to job role median is generally consistent between genders, with Managers and Research Directors being the primary exceptions.
- Monthly income increases with company tenure across eight of nine job roles, with Research Directors displaying an atypical trend that warrants further investigation.

---

## Recommendations

- Strengthen onboarding and early-career development initiatives to reduce turnover among younger, entry-level employees.
- Review promotion timelines for long-tenured employees to reduce promotion stagnation and improve retention.
- Investigate factors contributing to elevated attrition within the Sales department.
- Prioritize stock option benefits when designing retention strategies, given their stronger association with employee retention compared to salary hikes.
- Review compensation structure and job level distribution for Research Directors and Managers to better understand observed salary positioning differences.

---

## Dashboard

The Power BI dashboard includes the following visualizations, all slicer-enabled for filtering by Department, Gender, and Job Role:

- **KPI Cards** – Total Employees, Attrition Rate, Average Monthly Income, and Average Years at Company
- **Department Attrition** – Comparison of attrition rates across departments
- **Career Stagnation** – Attrition by promotion history and tenure
- **Benefits Analysis** – Attrition by stock option level and salary hike
- **Commute & Business Travel Heatmap** – Attrition patterns among married employees
- **Salary Positioning** – Gender comparison against job role median income
- **Income Progression** – Average monthly income by job role and company tenure
- **Key Findings Panel** – Executive summary of analytical insights

Below is a preview of the dashboard:

<img width="1381" alt="Dashboard Image" src="https://github.com/DarrylYuma/Data-Analytics-Projects/blob/main/HR%20Analytics/HR%20Analytics%20Dashboard%20Preview.png">

---

## SQL Analysis

Eight SQL queries were developed to answer business questions related to employee attrition, compensation, promotion history, and workforce demographics. Techniques used include Common Table Expressions (CTEs), window functions, CASE expressions, manual median calculation, aggregation, and conditional analysis to uncover trends and generate business recommendations.

---

## Files

| File / Links | Description |
|---|---|
| [Dataset](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset) | IBM HR Analytics dataset |
| `HR DB.db` | SQLite database |
| `HR SQL Query List.sql` | All SQL queries |
| `HR SQL Analysis.pdf` | Documentation |
| `HR Dashboard.pbix` | Power BI dashboard |
| `HR Analysis csv.csv` | HR Analysis csv |
