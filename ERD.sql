CREATE DATABASE ThePizzaCompany;

CREATE TABLE `Customer` (
  `CustomerID` int,
  `Fname` varchar(25),
  `Lname` varchar(25),
  `Address` varchar(30),
  `Phone` int,
  `Email` varchar(255),
  PRIMARY KEY (`CustomerID`)
);

CREATE TABLE `OrderHeader` (
  `OrderID` int,
  `OrderDate` date,
  `OrderTime` time,
  `CustomerID` int    ,
  PRIMARY KEY (`OrderID`),
  FOREIGN KEY (`OrderDate`) REFERENCES `Customer`(`Lname`)
);

CREATE TABLE `Pizza` (
  `PizzaID` int,
  `Name ` varchar(30),
  `Specification` varchar(255),
  `Price` float,
  PRIMARY KEY (`PizzaID`)
);

CREATE TABLE `OrderLine` (
  `OrderID` int,
  `LineID` int,
  `PizzaID` int,
  `Quantity` int,
  PRIMARY KEY (`OrderID`),
  FOREIGN KEY (`PizzaID`) REFERENCES `OrderHeader`(`OrderDate`),
  FOREIGN KEY (`LineID`) REFERENCES `Pizza`(`Name `)
);

CREATE TABLE `Delivery` (
  `DeliveryID` int,
  `OrderID` int,
  `Type` varchar(30),
  `Status` varchar(30),
  `Departure` time,
  `Arrival` time,
  PRIMARY KEY (`DeliveryID`)
);

CREATE TABLE `Payment` (
  `PaymentID` int,
  `PDate` date,
  `Type` varchar(30),
  `OrderID` int,
  `CustomerID` int,
  `Total` int,
  PRIMARY KEY (`PaymentID`)
);

