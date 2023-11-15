# Northwind Sales Dashboard

The main purpose of this repository is to showcase the design, creation, and exploratory data analysis behind my designed Tableau dashboard. This project showcases my SQL and Tableau skills.

<img width="1368" alt="Screenshot 2023-11-14 at 22 17 37" src="https://github.com/nielsxklesper/Northwind_Sales_Dashboard/assets/150530277/001e21d7-a94d-4e7d-bac1-8b3db11100ee">

The dashboard can be found [here](https://public.tableau.com/app/profile/niels.klesper/viz/NorthwindSalesDashboard_16999993391500/Dashboard1) 

Below I outline the steps required to develop the dashboard

## 1. Data Wrangling

The first step involved uploading the different data files (the dataset can be found [here](https://mavenanalytics.io/challenges/maven-northwind-challenge/24)) into Excel for the initial data inspection. Before uploading the dataset into the database I had to prepare the dataset by changing the format of the date columns and formatting blank cells in the dataset.

## 2. Database Design & Development

From previous projects, I have already installed MySQL onto my local machine. With the following SQL script (can be found [here](https://github.com/nielsxklesper/Northwind_Sales_Dashboard/blob/main/table_creation.sql)), I have created the tables for the database and then uploaded the data into the database with the help of MySQL's data import wizard.


![Untitled Diagram-Page-1 drawio](https://github.com/nielsxklesper/Northwind_Sales_Dashboard/assets/150530277/8208f777-9371-4e83-bbd9-9c23e6928a47)

## 3. EDA

After the database was created I performed an EDA in SQL to develop a better understanding of the dataset and find interesting aspects that I wanted to display eventually in the dashboard. A few interesting findings are summarized down below:

- The top five revenue-generating categories are Beverages, Dairy Products, Meat & Poultry, Confections, and Seafood.
- The top five revenue-generating products are Cote de Blaye, Thuringer Rostbratwurst, Raclette Courdavault, Camembert Pierrot, and Tarte au sucre.
- Products frequently purchased together include Sir Rodney's Scones and Sirop d'erable, Pavlova and Gorgonzola Telino, Pavlova and Tarte au sucre, Pavlova and Camembert Pierrot, Nord-Ost Matjeshering and Tourtiere.
- The top five customer markets (countries) ranked by sales are the USA, Germany, Austria, Brazil, and France.


The full script can be found [here](https://github.com/nielsxklesper/Northwind_Sales_Dashboard/blob/main/EDA.sql)

## 4. Dashboard 

The final stage included the development of a Tableau dashboard, utilizing the following Tableau functionalities and features:

- Dynamic Parameters
- Parameter Actions
 -Level of Detail Expressions
