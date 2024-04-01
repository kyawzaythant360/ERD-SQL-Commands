CREATE TABLE `Customer` (
  `Customer_Id` int,
  `Customer_name` String,
  `Address`  varchar(225) ,
  `Country` varchar(255),
  `Phone_number` varchar(255),
  PRIMARY KEY (`Customer_Id`)
);

CREATE TABLE `WishList` (
  `wishlistId` int,
  `Customer_Id` int,
  `ProductId` int,
  PRIMARY KEY (`wishlistId`),
  FOREIGN KEY (`wishlistId`) REFERENCES `Customer`(`Customer_Id `)
);

CREATE TABLE `Cart` (
  `CartId` Int,
  `Customer_Id` int, 
  `Product_Id` int,
  `Quantity` int,
  PRIMARY KEY (`CartId`),
  FOREIGN KEY (`Customer_Id`) REFERENCES `Customer` (`Customer_Id`),
  FOREIGN KEY (`Product_Id`) REFERENCES `Product` (`Product_Id`)
);

CREATE TABLE `Category` (
  `Cat_ID` int,
  `CatName` varchar(255),
  `Product_Id` int,
  `Quantity` int,
  PRIMARY KEY (`Cat_ID`),
  FOREIGN KEY (`Product_Id`) REFERENCES `Product` (`Product_Id`)
);

CREATE TABLE `Product` (
  `Product_Id` Int,
  `Product_name` varchar(100),
  `Category_name` varchar(100),
  `manufacture_date` date,
  `CartId` int,
  `price` float,
  `discountedPrice` float,
  `Expried_Date` date,
  `Seller_id` int,
  PRIMARY KEY (`Product_Id`),
  FOREIGN KEY (`Product_name`) REFERENCES `Cart`(`CartId`),
  FOREIGN KEY (`Product_name`) REFERENCES `Category`(`CatName`)
);

CREATE TABLE `Seller` (
  `Seller_Id` int,
  `Product_Id` int,
  `ProductName` varchar(255),
  `vendorName` varchar(255),
  `Description` varchar(255)  ,
  `Quantity` int,
  `Price` float,
  PRIMARY KEY (`Seller_Id`),
  FOREIGN KEY (`Product_Id`) REFERENCES `Product` (`Product_Id`)
);

CREATE TABLE `Order` (
  `Order_id` int,
  `CartId` int,
  `Customer_Id` int,
  PRIMARY KEY (`Order_id`),
  FOREIGN KEY (`CartId`) REFERENCES `Cart` (`CartId`),
  FOREIGN KEY (`Customer_Id`) REFERENCES `Customer` (`Customer_Id`)
);

CREATE TABLE `Payment` (
  `PaymentID` int,
  `PType` varchar(30),
  `OrderId` int,
  `Customer_Id` int,
  `Amount` float,
  PRIMARY KEY (`PaymentID`),
  FOREIGN KEY (`Customer_Id`) REFERENCES `Customer` (`Customer_Id`),
  FOREIGN KEY (`OrderId`)   REFERENCES `Order` (`OrderId`)
);

CREATE TABLE `Delivery` (
  `Deli_Id` int,
  `OrderId` int,
  `Address` varchar(30),
  `CustomerID` int,
  PRIMARY KEY (`Deli_Id`),
  FOREIGN KEY (`OrderId`)   REFERENCES `Order` (`OrderId`),
  FOREIGN KEY (`Customer_Id`) REFERENCES `Customer` (`Customer_Id`)
);