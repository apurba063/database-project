create database food;

use food;

CREATE TABLE Vender_Info
(
 first_name VARCHAR(10) NOT NULL,
 middle_name VARCHAR(10) NOT NULL,
 last_name VARCHAR(10) NOT NULL,
 city VARCHAR(10) NOT NULL,
 state VARCHAR(10) NOT NULL,
 zip VARCHAR(10) NOT NULL,
 gender VARCHAR(10) NOT NULL,
 tin_number INT NOT NULL,
 street_name VARCHAR(10) NOT NULL,
 street_number VARCHAR(10) NOT NULL,
 house_no INT NOT NULL,
 PRIMARY KEY (tin_number)
);

CREATE TABLE Food_Info
(
 item_code INT NOT NULL,
 item_name VARCHAR(15) NOT NULL,
 PRIMARY KEY (item_code)
);

CREATE TABLE Restaurant_Info
(
 city VARCHAR(10) NOT NULL,
 state VARCHAR(10) NOT NULL,
 zip VARCHAR(10) NOT NULL,
 restaurant_no INT NOT NULL,
 street_name VARCHAR(10) NOT NULL,
 street_number VARCHAR(10) NOT NULL,
 house_no INT NOT NULL,
 PRIMARY KEY (restaurant_no)
);

CREATE TABLE Payment_Info
(
 payment_id INT NOT NULL,
 PRIMARY KEY (payment_id)
);

CREATE TABLE Ordered_restaursnt
(
 tin_number INT NOT NULL,
 restaurant_no INT NOT NULL,
 PRIMARY KEY (tin_number, restaurant_no),
 FOREIGN KEY (tin_number) REFERENCES Vender_Info(tin_number),
 FOREIGN KEY (restaurant_no) REFERENCES Restaurant_Info(restaurant_no)
);

CREATE TABLE Odered_Food
(
 tin_number INT NOT NULL,
 item_code INT NOT NULL,
 PRIMARY KEY (tin_number, item_code),
 FOREIGN KEY (tin_number) REFERENCES Vender_Info(tin_number),
 FOREIGN KEY (item_code) REFERENCES Food_Info(item_code)
);
CREATE TABLE Vender_Number
(
 vender_phoneno INT NOT NULL,
 tin_number INT NOT NULL,
 PRIMARY KEY (vender_phoneno, tin_number),
 FOREIGN KEY (tin_number) REFERENCES Vender_Info(tin_number)
);

CREATE TABLE Food_Info_Quantity
(
 Quantity INT NOT NULL,
 item_code INT NOT NULL,
 PRIMARY KEY (Quantity, item_code),
 FOREIGN KEY (item_code) REFERENCES Food_Info(item_code)
);

CREATE TABLE Restaurant_Name
(
 restaurant_name VARCHAR(15) NOT NULL,
 restaurant_no INT NOT NULL,
 PRIMARY KEY (restaurant_name, restaurant_no),
 FOREIGN KEY (restaurant_no) REFERENCES Restaurant_Info(restaurant_no)
);

CREATE TABLE Payment_Method (
payment_method VARCHAR(10) NOT NULL,
payment_id INT NOT NULL,
PRIMARY KEY (payment_method, payment_id), 
FOREIGN KEY (payment_id) REFERENCES Payment_Info(payment_id) );

CREATE TABLE Customer_Info
(
 first_name VARCHAR(10) NOT NULL,
 middle_name VARCHAR(10) NOT NULL,
 last_name VARCHAR(10) NOT NULL,
 city VARCHAR(10) NOT NULL,
 state VARCHAR(15) NOT NULL,
 zip VARCHAR(10) NOT NULL,
 email_address VARCHAR(20) NOT NULL,
 customer_id INT NOT NULL,
 street_name VARCHAR(10) NOT NULL,
 house_no INT NOT NULL,
 street_number VARCHAR(10) NOT NULL,
 payment_id INT NOT NULL,
 PRIMARY KEY (customer_id),
 FOREIGN KEY (payment_id) REFERENCES Payment_Info(payment_id),
 UNIQUE (email_address)
);

CREATE TABLE Food_Type
(
 customer_id INT NOT NULL,
 item_code INT NOT NULL,
 PRIMARY KEY (customer_id, item_code),
 FOREIGN KEY (customer_id) REFERENCES Customer_Info(customer_id),
 FOREIGN KEY (item_code) REFERENCES Food_Info(item_code)
);
CREATE TABLE Received_Order_
(
 tin_number INT NOT NULL,
 customer_id INT NOT NULL,
 PRIMARY KEY (tin_number, customer_id),
 FOREIGN KEY (tin_number) REFERENCES Vender_Info(tin_number),
 FOREIGN KEY (customer_id) REFERENCES Customer_Info(customer_id)
);
CREATE TABLE Customer_Number
(
 customer_phoneno INT NOT NULL,
 customer_id INT NOT NULL,
 PRIMARY KEY (customer_phoneno, customer_id),
 FOREIGN KEY (customer_id) REFERENCES Customer_Info(customer_id)
);





INSERT INTO vender_info VALUES 
('md', 'karim', 'hasan', 'Dhaka', 'mirpur', 1213,'Male', 10001, 'block-A', 'road-1', 10), 
('md ', 'rahim', 'ahmed', 'dhaka', 'banani', 1296,'Male', 10002, 'block-B', 'road-2', 20), 
('mrs', 'rahima', 'hasan', 'Dhaka', 'malibagh', 1213,'Female', 10003, 'block-C', 'road-3', 30), 
('mrs', 'rahima', 'ahmed', 'Dhaka', 'baily road', 1215,'Female', 10004, 'block-D', 'road-4', 40), 
('md', 'samima', 'islam', 'Dhaka', 'rampura', 1219,'Female', 10005, 'block-F', 'road-5', 50);




Insert Payment_Info Values (01), (02), (03), (04), (05);

Insert into Payment_Method Values 
('Cash',01), ('Card',02), ('Bkash',03), ('Nagad',04), ('Roket',05);

INSERT into restaurant_name VALUES 
('Kudos',138), ('KFC',301), ('Chillox',496), ('PizzaKing',323), ('Pabulum',333);

Insert into restaurant_info values 
('Dhaka','Gulshan',1212,138,'vip_area',4,22), 
('Dhaka','Bashaboo',1214,301,'sat_musjid_road',7,4), 
('Dhaka','Bashundhara',1216,496,'FDC',6,16), 
('Dhaka','Gulshan',1212,323,'police_plaza',3,22),
('Dhaka','Bonosree',1219,333,'block_c',4,20);

Insert into ordered_food Values (10001,101), (10002,102), (10003,103), (10004,104), (10004,105);

Insert into vender_number values (01856434655,10001), (01854734782,10002), 
(01866744695,10003), (01816734885,10004), (01850734605,10005);

INSERT into Customer_info Values
( 'mr', 'karim', 'hasan','Dhaka', 'Banasree', 1213, 'karim@gmail.com', 1000, 'bonosree', 05, 
'road-5',01), 
('mr', 'rahim', 'ahmed', 'dhaka','kongkalpara', 1296,'rahim@gmail.com',1001, 
'kongkalpara',20, 'road-3', 02), 
('mrs', 'rahima', 'ahmed', 'dkaha','malibagh', 1213, 
'rahima@yahoo.com',1002, 'malibagh',9, 'road-9', 03),
 ('mrs', 'karima', 'hasan', 
'dkaha','mahommedpur', 1215, 'karimaa@gmail.com',1003,'mahommedpur',33, 'road-8', 04), 

('mrs', 'sokhina', 'hasan', 'dkaha','aftabnagar', 1219, 'sokhina@gmail.com',1004,'aftabnagar',5, 
'road-05', 05);

Insert into customer_number Values (01711013811,1000), (01672052222,1001), 
(01677523777,1002), (01706068325,1003), (01631111444,1004);

Insert into food_info Values 
(101, 'Burger'), (102, 'Pizza'), (103, 'Kacchi'), (104, 'Chowmin'), (105, 'Fried Rice');

Insert into food_info_quantity Values (3,101), (1,102), (1,103), (3,104), (2,105);

Insert into food_type Values (1000,101), (1001,102), (1002,103), (1003,104), (1004,105);

Insert into received_order_ Values 
(10001,1000), (10002,1001), (10003,1002), (10004,1003), (10004,1004);

Insert into ordered_restaursnt Values 
(10001,301), (10002,138), (10003,496), (10004,323), (10004,333);







