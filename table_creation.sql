CREATE TABLE `shippment_db`.`categories` (
  `categoryID` INT NOT NULL,
  `categoryName` VARCHAR(45) NOT NULL,
  `description` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`categoryID`)
);

CREATE TABLE `shippment_db`.`customers` (
  `customerID` VARCHAR(10) NOT NULL,
  `companyName` VARCHAR(40) NOT NULL,
  `contactName` VARCHAR(30) NOT NULL,
  `contactTitle` VARCHAR(30) NOT NULL,
  `city` VARCHAR(15) NOT NULL,
  `country` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`customerID`)
);

CREATE TABLE `shippment_db`.`employees` (
  `employeeID` INT NOT NULL,
  `employeeName` VARCHAR(20) NOT NULL,
  `title` VARCHAR(30) NOT NULL,
  `city` VARCHAR(30) NOT NULL,
  `country` VARCHAR(15) NOT NULL,
  `reportsTo` INT DEFAULT 0,
  PRIMARY KEY (`employeeID`)
);

CREATE TABLE `shippment_db`.`products` (
  `productID` INT NOT NULL,
  `productName` VARCHAR(40) NOT NULL,
  `quantityPerUnit` VARCHAR(20) NOT NULL,
  `unitPrice` DECIMAL NOT NULL,
  `discontinued` INT NOT NULL,
  `categoryID` INT NOT NULL,
  PRIMARY KEY (`productID`),
  FOREIGN KEY (`categoryID`) REFERENCES `categories`(`categoryID`)
);

CREATE TABLE `shippment_db`.`shippers` (
  `shipperID` INT NOT NULL,
  `companyName` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`shipperID`)
);

CREATE TABLE `shippment_db`.`orders` (
  `orderID` INT NOT NULL,
  `customerID` VARCHAR(10) NOT NULL,
  `employeeID` INT NOT NULL,
  `orderDate` DATETIME,
  `requiredDate` DATETIME,
  `shippedDate` DATETIME NULL,  
  `shipperID` INT NOT NULL,
  `freight` DECIMAL,
  PRIMARY KEY (`orderID`),
  FOREIGN KEY (`customerID`) REFERENCES `customers` (`customerID`),
  FOREIGN KEY (`employeeID`) REFERENCES `employees` (`employeeID`),
  FOREIGN KEY (`shipperID`) REFERENCES `shippers` (`shipperID`)
);

CREATE TABLE `shippment_db`.`order_details` (
	`OrderID` int NOT NULL,
	`ProductID` int NOT NULL,
	`UnitPrice` decimal(19, 4) NOT NULL DEFAULT 0,
	`Quantity` smallint NOT NULL DEFAULT 1,
	`Discount` float NOT NULL DEFAULT 0,
	PRIMARY KEY (`OrderID`, `ProductID`),
	FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`),
	FOREIGN KEY (`ProductID`) REFERENCES `Products` (`ProductID`)
);


