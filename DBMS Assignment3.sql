CREATE DATABASE restaurant1;
USE restaurant1;

CREATE TABLE Customer(Customer_ID VARCHAR(50) PRIMARY KEY,Name VARCHAR(50),Contact_iNFORMATION VARCHAR(50),Loyalty_Points INT);

CREATE TABLE Dish (Dish_ID VARCHAR(50) PRIMARY KEY,Name VARCHAR(50),Description VARCHAR(50),Price INT,Category ENUM('Appetizer', 'Main Course', 'Dessert','Mocktails'));

CREATE TABLE ORDERS(Order_ID VARCHAR(50) PRIMARY KEY,date DATE,time TIME,Customer_ID VARCHAR(50),FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID));

CREATE TABLE OrderDish(Order_ID VARCHAR(50),Dish_ID VARCHAR(50),FOREIGN KEY (Order_ID) REFERENCES ORDERS(Order_ID),FOREIGN KEY (Dish_ID) REFERENCES Dish(Dish_ID));

INSERT INTO Dish (Dish_ID, Name, Description, Price, Category) VALUES ('D1', 'Burger', 'Spicy', 90, 'Appetizer'),
																	  ('D2','Pizza','Less Spicy',200,'Appetizer'),
																	  ('D3','Mojito','Drink',100,'Mocktails'),
																	  ('D4','paneer Tikka','Spicy',350,'Main Course'),
																	  ('D5','Ice Cream','Sweet',120,'Dessert');

INSERT INTO Customer(Customer_ID, Name, Contact_Information, Loyalty_Points) VALUES('C1','Gaurav','9876543210',200),
																				   ('C2','Chirag','9999999999',800),
																				   ('C3','Kalash','9123456780',733);

INSERT INTO Orders(Order_ID, date,time,Customer_ID) Values('O1','2024-02-03','09:37:00','C2'),
														  ('O2','2024-02-15','12:30:00','C1'),
														  ('O3','2024-02-17','08:00:00','C3'),
														  ('O4','2024-02-25','16:00:00','C2'),
														  ('O5','2024-02-25','20:00:00','C3');


INSERT INTO OrderDish(Order_ID, Dish_ID) values('O1','D3'),
											   ('O1','D4'),
											   ('O2','D1'),
											   ('O3','D1'),
											   ('O3','D5'),
											   ('O4','D2'),
											   ('O4','D3'),
											   ('O5','D4');

-- SELECT * from customer;
-- SELECT * from dish;
-- SELECT * from orders;
-- SELECT * from OrderDish;

CREATE PROCEDURE UpdateLoyaltyPoints(IN customerID VARCHAR(50))
    UPDATE Customer SET Loyalty_Points = Loyalty_Points + 10 WHERE Customer_ID = customerID;

SELECT * from Orders where Customer_ID = 'C2';

SELECT * from dish where category = 'Mocktails';

SELECT 
    o.date,SUM(d.Price) AS Total_Revenue
FROM 
    Orders o
JOIN 
    OrderDish od ON o.Order_ID = od.Order_ID
JOIN 
    Dish d ON od.Dish_ID = d.Dish_ID
WHERE 
    o.date = '2024-02-25';
    
Update dish SET price=140 WHERE Dish_ID='D3';

SELECT name,Loyalty_Points from customer;