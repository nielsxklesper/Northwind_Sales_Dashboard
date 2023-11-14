-- Connect to DB:
USE shippment_db;

-- Which product categories generated the most revenue?:
SELECT c.categoryName as Category, ROUND(SUM(od.unitPrice * od.quantity)) as Sales
FROM categories c
LEFT JOIN products p ON c.categoryID = p.categoryID
LEFT JOIN order_details od ON p.productID = od.productID
GROUP BY c.categoryName
ORDER BY Sales DESC
Limit 5;

-- Answer:
-- Category         Sales
-- Beverages   		$286527
-- Dairy Products 	$251331
-- Meat & Poultry  	$178189
-- Confections 		$177099
-- Seafood 			$141623

-- Which products generated the most revenue?:
SELECT p.productName as Product, ROUND(SUM(od.unitPrice * od.quantity)) as Sales
FROM products p
LEFT JOIN order_details od ON p.productID = od.productID
GROUP BY p.productName
ORDER BY Sales DESC
LIMIT 5;

-- Answer:
-- Product         			Sales
-- Cote de Blaye   			$149984
-- Thuringer Rostbratwurst 	 $87736
-- Raclette Courdavault  	 $76296
-- Camembert Pierrot 		 $50286
-- Tarte au sucre 			 $49828

-- Which products are frequently purchased together?:
SELECT p1.productName AS Product1, p2.productName AS Product2, COUNT(od1.orderID) AS OrderCount
FROM order_details od1
JOIN order_details od2 ON od1.orderID = od2.orderID
JOIN products p1 ON od1.productID = p1.productID
JOIN products p2 ON od2.productID = p2.productID
WHERE od1.productID < od2.productID
GROUP BY p1.productName, p2.productName
ORDER BY orderCount DESC
LIMIT 5;

-- Answer:
-- Product1					Product2         		OrderCount
-- Sir Rodney's Scones   	Sirop d'erable				8
-- Pavlova 					Gorgonzola Telino			7
-- Pavlova					Tarte au sucre				6
-- Pavlova 					Camembert Pierrot			6
-- Nord-Ost Matjeshering 	Tourtiere 					6

-- Which customers have placed the most orders?
SELECT c.companyName, COUNT(o.orderID) as orderCount
FROM customers c
LEFT JOIN orders o ON c.customerID = o.customerID
GROUP BY c.companyName
ORDER BY orderCount DESC
Limit 5;

-- Answer:
-- CompanyName         				OrderCount
-- Save-a-lot Markets   				31
-- Ernst Handel 						30
-- QUICK-Stop  							28
-- Folk och fa HB 	 					19
-- Hungry Owl All-Night Grocers		 	19

-- Who are the top 5 customers by the generated sales?:
SELECT c.companyName AS CompanyName, SUM(p.unitPrice * od.quantity) AS Sales
FROM customers c
LEFT JOIN orders o ON c.customerID = o.customerID
LEFT JOIN order_details od ON o.orderID = od.orderID
LEFT JOIN products p ON od.productID = p.productID
GROUP BY c.customerID, c.companyName
ORDER BY Sales DESC
LIMIT 5;

-- Answer:
-- CompanyName         				Sales
-- QUICK-Stop   					$122252
-- Save-a-lot Markets 				$121121
-- Ernst Handel  					$120625
-- Hungry Owl All-Night Grocers 	 $60498
-- Rattlesnake Canyon Grocery 		 $58639

-- What is the average order value for each customer?:
SELECT c.companyName, AVG(o.freight) as avgOrderValue
FROM customers c
LEFT JOIN orders o ON c.customerID = o.customerID
GROUP BY c.companyName
ORDER BY avgOrderValue DESC
LIMIT 5;

-- Answer:
-- CompanyName         			Average Order Value
-- Save-a-lot Markets   			$216.8065
-- Ernst Handel 					$207.5000
-- QUICK-Stop 						$201.8214
-- Queen Cozinha 					$152.4615
-- Hungry Owl All-Night Grocers 	$145.0526

-- What are the cutomer key markets (countries) ranked by sales?:
SELECT c.country AS Country, SUM(od.unitPrice * od.quantity) as Sales
FROM customers c
LEFT JOIN orders o ON c.customerID = o.customerID
LEFT JOIN order_details od ON o.orderID = od.orderID
GROUP BY c.country
ORDER BY Sales DESC
Limit 5;

-- Answer:
-- Country        Sales
-- USA   	    $263566.98
-- Germany 		$244640.63
-- Austria		$139496.63
-- Brazil 		$114968.48
-- France 		 $85498.76 

-- Which shipping companies have processed the highest number of shipments?
SELECT s.companyName, COUNT(o.shipperID) as shipmentsProcessed
FROM shippers s
LEFT JOIN orders o ON s.shipperID = o.shipperID
GROUP BY s.companyName
ORDER BY shipmentsProcessed DESC;

-- Answer:
-- CompanyName        shipmentsProcessed
-- United Package   	    326
-- Federal Shipping 		255
-- Speedy Express			249

-- What is the average shipment delay for each shipper?
SELECT s.companyName, AVG(TIMESTAMPDIFF(DAY, orderDate, shippedDate)) as avgShipmentDelay
FROM shippers s
LEFT JOIN orders o ON s.shipperID = o.shipperID
WHERE shippedDate IS NOT NULL
GROUP BY s.companyName
ORDER BY avgShipmentDelay DESC;

-- Answer:
-- CompanyName        avgShipmentDelay
-- United Package   	   9.2349
-- Federal Shipping 	   8.5714
-- Speedy Express		   7.4739
