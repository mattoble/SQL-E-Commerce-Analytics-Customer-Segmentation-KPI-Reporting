# SQL E-Commerce Analytics: Customer Segmentation, YoY Performance, & KPI Reporting

## Executive Summary
This analysis investigates the transactional and demographic data of a global sporting goods e-commerce retailer. Using SQL Server, over 4 years of sales history was processed to establish core business KPIs, segment the customer base by lifetime value, and identify primary revenue drivers within the product portfolio. 

The project culminates in the creation of production-ready SQL Views designed to feed directly into business intelligence tools like Microsoft Power BI for automated reporting.

## Core Business KPIs
The business currently operates with a solid baseline, supported by a wide customer base and a healthy average order value:
* **Total Gross Revenue:** $29,356,250
* **Total Units Sold:** 60,423
* **Average Order Value (AOV):** $1,061
* **Active Customer Base:** 18,484 customers generating 27,659 unique orders

## Data Segmentation & Insights

### Customer Demographics & Lifetime Value
By tracking the lifespan and spending habits of individual users, the customer base was categorized to identify where the most value is generated:
* **The VIP Cohort:** Customers with a lifespan of 12+ months and over $5,000 in lifetime spend account for 1,655 users. Despite being a smaller segment compared to the 14,631 new users, they generate a disproportionately high percentage of overall revenue.
* **Geographic Drivers:** The market is heavily concentrated, with United States and Australia making up the highest percentage of the customer base.
* **Demographic Target:** The business is highly engaged with the 45-54 years old demographic, with spending distributed almost evenly across male and female segments.

### Product Portfolio Performance
Revenue is heavily concentrated within a few core product lines, indicating a strong market fit for primary items but a reliance on a single category:
* **Category Dominance:** The Bikes category is the undisputed driver of the business, accounting for 96.46% of total gross revenue.
* **High-Performers:** There are 66 products classified as "High-Performers" (generating >$50k each), primarily consisting of Mountain Bikes, Road Bikes, Sports Bikes and Touring Bikes.
* **Low-Performers:** Products classified in the bottom tier (generating <$10k) consist mostly of Accessories and Clothing. While they drive high volume in units sold, their low average price point limits their impact on gross revenue.


## Strategic Recommendations
1. **Protect the VIP Base:** With VIPs identified, marketing should transition from acquisition to retention for this cohort, offering loyalty programs or early access to new product lines to maintain their high monthly average spend.
2. **Upsell the "New" Cohort:** A large volume of customers falls into the "New" category (lifespan < 12 months). Post-purchase campaigns should be triggered at the 3-month and 6-month marks to convert these single-purchase users into recurring "Regulars".
3. **Bundle Low-Performing Products:** To increase the velocity of low-revenue accessories, consider bundling them with High-Performer items at the point of checkout to organically increase the overall Average Order Value (AOV).


## Technical Implementation
* **SQL Server (T-SQL):** Primary scripting environment.
* **Window Functions:** Utilized `OVER()`, `PARTITION BY`, and `LAG()` to calculate running totals, dynamic percentage distributions, and previous-year sales comparisons.
* **Common Table Expressions (CTEs):** Structured multi-step data transformations for readability and optimal execution.
* **Conditional Logic:** Engineered custom dimensional categories (e.g., Age Groups, VIP Status, Revenue Tiers) using nested `CASE WHEN` statements.
* **Data Modeling:** Consolidated complex multi-table joins and aggregations into streamlined `CREATE VIEW` statements (`gold.report_customers` and `gold.report_products`) for BI dashboard integration.

## How to Run This Project
1. Clone this repository and download the raw `.csv` files located in the `/data` folder.
2. Execute `01_init_database.sql` in SQL Server Management Studio (SSMS) to build the `ECommerceAnalytics` database schema and bulk-import the raw data.
3. Run `02_ecommerce_business_analytics.sql` to replicate the EDA, performance benchmarking, data segmentations, and automated reporting views.

**Author:** Matthew Oblea