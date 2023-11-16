# Northwind Sales Dashboard

The executive management team has encountered challenges foreseeing future billings and adapting to shifts in customer demand behavior. In light of these emerging complexities, the executive team recognizes the need for a comprehensive analysis of sales and customer data to make well-informed decisions. This data-driven approach is essential to navigate the evolving landscape, understand the intricacies of customer behavior, and strategically position the organization to address the current challenges and capitalize on emerging opportunities.

This repository aims to seamlessly walk you through my process of data processing, exploration, designing, and developing a Tableau dashboard. Therefore it showcases my capabilities to build end-to-end data products contributing to organizational problem-solving efforts by leveraging my SQL and Tableau skills.

<img width="1368" alt="Screenshot 2023-11-14 at 22 17 37" src="https://github.com/nielsxklesper/Northwind_Sales_Dashboard/assets/150530277/001e21d7-a94d-4e7d-bac1-8b3db11100ee">

The dashboard can be found [here](https://public.tableau.com/app/profile/niels.klesper/viz/NorthwindSalesDashboard_16999993391500/Dashboard1).

## 1. Data Wrangling

The initial step involved uploading various data files ([found here](https://mavenanalytics.io/challenges/maven-northwind-challenge/24)) into Excel for an initial data inspection. Before initiating the design, development, and transfer of the data into the database, I took the time to familiarize myself with the data and conducted a comprehensive inspection of its overall quality. Specifically, I identified that various date features needed a format change, and empty cells required formatting to ensure they were suitable for the database.

## 2. Database Design & Development

In previous projects, I have already installed MySQL on my local machine. Using the provided SQL script ([available here](https://github.com/nielsxklesper/Northwind_Sales_Dashboard/blob/main/table_creation.sql)), I created the necessary tables for the database and subsequently uploaded the data using MySQL's data import wizard.

Database Schema:

![Untitled Diagram-Page-1 drawio](https://github.com/nielsxklesper/Northwind_Sales_Dashboard/assets/150530277/8208f777-9371-4e83-bbd9-9c23e6928a47)

## 3. EDA

After creating the database, I conducted an Exploratory Data Analysis (EDA) in SQL to gain a deeper understanding of the dataset and identify compelling aspects to showcase in the eventual dashboard. Here are a few noteworthy findings:

**Question 1:** Which product categories generated the most revenue?
```
SELECT c.categoryName as Category, ROUND(SUM(od.unitPrice * od.quantity)) as Sales
FROM categories c
LEFT JOIN products p ON c.categoryID = p.categoryID
LEFT JOIN order_details od ON p.productID = od.productID
GROUP BY c.categoryName
ORDER BY Sales DESC
Limit 5;
```
Beverages lead in sales with $286,527, followed by Dairy Products at $251,331. Meat & Poultry, Confections, and Seafood also contribute significantly to the overall sales, with $178,189, $177,099, and $141,623, respectively.

**Question 2:** Which products generated the most revenue?
```
SELECT p.productName as Product, ROUND(SUM(od.unitPrice * od.quantity)) as Sales
FROM products p
LEFT JOIN order_details od ON p.productID = od.productID
GROUP BY p.productName
ORDER BY Sales DESC
LIMIT 5;
```
Notably, "Cote de Blaye" stands out with the highest sales at $149,984, followed by "Thuringer Rostbratwurst" with $87,736. "Raclette Courdavault," "Camembert Pierrot," and "Tarte au sucre" also play significant roles in the sales landscape, contributing $76,296, $50,286, and $49,828, respectively. 

**Question 3:** Which products are frequently purchased together?
```
SELECT p1.productName AS Product1, p2.productName AS Product2, COUNT(od1.orderID) AS OrderCount
FROM order_details od1
JOIN order_details od2 ON od1.orderID = od2.orderID
JOIN products p1 ON od1.productID = p1.productID
JOIN products p2 ON od2.productID = p2.productID
WHERE od1.productID < od2.productID
GROUP BY p1.productName, p2.productName
ORDER BY orderCount DESC
LIMIT 5;
```
"Sir Rodney's Scones" and "Sirop d'erable" lead with the highest order count of 8, suggesting a strong association between these products. The product "Pavlova" appears in multiple pairs, with "Gorgonzola Telino" and "Tarte au sucre," as well as "Camembert Pierrot," all sharing a similar order count of 6. Additionally, "Nord-Ost Matjeshering" and "Tourtiere" form another pair with an order count of 6. This detailed breakdown provides valuable insights into the relationships and popularity of specific product combinations based on order frequency.

**Question 4:** What are the customer key markets (countries) ranked by sales?:
```
SELECT c.country AS Country, SUM(od.unitPrice * od.quantity) as Sales
FROM customers c
LEFT JOIN orders o ON c.customerID = o.customerID
LEFT JOIN order_details od ON o.orderID = od.orderID
GROUP BY c.country
ORDER BY Sales DESC
Limit 5;
```
USA leading with $263,566.98. Germany follows closely with $244,640.63, and Austria, Brazil, and France contribute to the overall sales landscape with figures of $139,496.63, $114,968.48, and $85,498.76, respectively.

The full script can be found [here](https://github.com/nielsxklesper/Northwind_Sales_Dashboard/blob/main/EDA.sql).

## 4. Dashboard 

The final stage included the development of a Tableau dashboard. This dashboard is designed to provide a comprehensive overview of crucial sales metrics encompassing product performance, key product categories, customer insights, and shipping analytics. The aim is to empower executive managers with a centralized and visually intuitive platform, enabling them to make informed decisions, optimize product strategies, identify profitable categories, understand customer behaviors, and streamline shipping processes for enhanced overall sales performance. Tableau functionality and features used:
- Dynamic Parameters
- Parameter Actions
- Level of Detail Expressions
