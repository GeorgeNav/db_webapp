-- This file contains the MySQL code
-- Converted from Oracle SQL in Project 2
-- To be used with PHP as part of Project 3

-- Md Nabil Ahsan - E8
-- George Navarro - E7

-- Entering data into database
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Territory;
DROP TABLE IF EXISTS SalesPerson;
DROP TABLE IF EXISTS DoesBusinessIn;
DROP TABLE IF EXISTS ProductLine;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Orderr;
DROP TABLE IF EXISTS OrderLine;
DROP TABLE IF EXISTS PriceUpdate;
DROP PROCEDURE IF EXISTS ProductLineSale; 
DROP TRIGGER IF EXISTS StandardPriceUpdate;
SET FOREIGN_KEY_CHECKS = 1;

-- Customers
CREATE TABLE Customer (
    c_id CHAR(30) NOT NULL,
    c_name CHAR(30),
    c_address CHAR(30),
    c_city CHAR(30),
    c_state CHAR(2),
    c_postalcode CHAR(30),
    c_email CHAR(30),
    c_username CHAR(30),
    c_password CHAR(30),
    PRIMARY KEY ( c_id ) );

INSERT INTO Customer VALUES ( 1, 'Contemporary Casuals', '1355 S Hines Blvd', 'Gainesville', 'FL', '32601-2871', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 2, 'Value Furnitures', '15145 S.W. 17th St.', 'Plano', 'TX', '75094-7734', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 3, 'Home Furnishings', '1900 Allard Ave', 'Albany', 'NY', '12209-1125', 'homefurnishings?@gmail.com', 'CUSTOMER1', 'CUSTOMER1#' );
INSERT INTO Customer VALUES ( 4, 'Eastern Furniture', '1925 Beltline Rd.', 'Carteret', 'NJ', '07008-3188', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 5, 'Impressions', '5585 Westcott Ct.', 'Sacramento', 'CA', '94206-4056', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 6, 'Furniture Gallery', '325 Flatiron Dr.', 'Boulder', 'CO', '80514-4432', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 7, 'New Furniture', 'Palace Ave', 'Farmington', 'NM', '', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 8, 'Dunkins Furniture', '7700 Main St', 'Syracuse', 'NY', '31590', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 9, 'A Carpet', '434 Abe Dr', 'Rome', 'NY', '13440', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 12, 'Flanigan Furniture', 'Snow Flake Rd', 'Ft Walton Beach', 'FL', '32548', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 13, 'Ikards', '1011 S. Main St', 'Las Cruces', 'NM', '88001', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 14, 'Wild Bills', 'Four Horse Rd', 'Oak Brook', 'Il', '60522', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 15, 'Janet''s Collection', 'Janet Lane', 'Virginia Beach', 'VA', '10012', NULL, NULL, NULL);
INSERT INTO Customer VALUES ( 16, 'ABC Furniture Co.', '152 Geramino Drive', 'Rome', 'NY', '13440', NULL, NULL, NULL );

-- Territory
CREATE TABLE Territory (
    t_id CHAR(30),
    t_name CHAR(30),
    PRIMARY KEY ( t_id ) );
    
INSERT INTO Territory VALUES ( 1, 'SouthEast' );
INSERT INTO Territory VALUES ( 2, 'SouthWest' );
INSERT INTO Territory VALUES ( 3, 'NorthEast' );
INSERT INTO Territory VALUES ( 4, 'NorthWest' );
INSERT INTO Territory VALUES ( 5, 'Central' );

-- SalesPerson
CREATE TABLE SalesPerson (
    sp_id CHAR(30) NOT NULL,
    sp_name CHAR(30),
    sp_phone CHAR(30),
    sp_email CHAR(30),
    sp_username CHAR(30),
    sp_password CHAR(30),
    t_id CHAR(30),
    PRIMARY KEY ( t_id, sp_id ),
    FOREIGN KEY ( t_id ) REFERENCES Territory (t_id));

INSERT INTO SalesPerson VALUES ( 1, 'Doug Henny', '8134445555', 'salesperson?@gmail.com', 'SALESPERSON', 'SALESPERSON#', 1 );
INSERT INTO SalesPerson VALUES ( 2, 'Robert Lewis', '8139264006', '', '', '', 2 );
INSERT INTO SalesPerson VALUES ( 3, 'William Strong', '5053821212', '', '', '', 3 );
INSERT INTO SalesPerson VALUES ( 4, 'Julie Dawson', '4355346677', '', '', '', 4 );
INSERT INTO SalesPerson VALUES ( 5, 'Jacob Winslow', '2238973498', '', '', '', 5 );

-- DoesBusinessIn
CREATE TABLE DoesBusinessIn (
    c_id CHAR(30) NOT NULL,
    t_id CHAR(30) NOT NULL,
    PRIMARY KEY ( c_id, t_id ),
    FOREIGN KEY ( c_id ) REFERENCES Customer(c_id),
    FOREIGN KEY ( t_id ) REFERENCES Territory(t_id) );

INSERT INTO DoesBusinessIn VALUES ( 1, 1 );
INSERT INTO DoesBusinessIn VALUES ( 2, 2 );
INSERT INTO DoesBusinessIn VALUES ( 3, 3 );
INSERT INTO DoesBusinessIn VALUES ( 4, 4 );
INSERT INTO DoesBusinessIn VALUES ( 5, 5 );
INSERT INTO DoesBusinessIn VALUES ( 6, 1 );
INSERT INTO DoesBusinessIn VALUES ( 7, 2 );

-- ProductLine
CREATE TABLE ProductLine (
    pl_id CHAR(30) NOT NULL,
    pl_name CHAR(30),
    PRIMARY KEY ( pl_id ) );

INSERT INTO ProductLine VALUES ( 1, 'Cherry Tree' );
INSERT INTO ProductLine VALUES ( 2, 'Scandinavia' );
INSERT INTO ProductLine VALUES ( 3, 'Country Look' );

-- Product
CREATE TABLE Product (
    p_id CHAR(30) NOT NULL,
    p_name CHAR(30),
    p_finish CHAR(30),
    p_standard_price CHAR(30),
    pl_id CHAR(30),
    p_photo CHAR(30),
    PRIMARY KEY ( p_id ),
    FOREIGN KEY ( pl_id ) REFERENCES ProductLine(pl_id) );

INSERT INTO Product VALUES ( 1, 'End Table', 'Cherry', 175, 1, 'table.jpg' );
INSERT INTO Product VALUES ( 2, 'Coffee Table', 'Natural Ash', 200, 2, NULL );
INSERT INTO Product VALUES ( 3, 'Computer Desk', 'Natural Ash', 375, 2, NULL );
INSERT INTO Product VALUES ( 4, 'Entertainment Center', 'Natural Maple', 650, 3, NULL );
INSERT INTO Product VALUES ( 5, 'Writers Desk', 'Cherry', 325, 1, NULL );
INSERT INTO Product VALUES ( 6, '8-Drawer Desk', 'White Ash', 750, 2, NULL );
INSERT INTO Product VALUES ( 7, 'Dining Table', 'Natural Ash', 800, 2, NULL );
INSERT INTO Product VALUES ( 8, 'Computer Desk', 'Walnut', 250, 3, NULL );

-- Orderr
CREATE TABLE Orderr (
    o_id CHAR(30) NOT NULL,
    o_date DATE,
    c_id CHAR(30) NOT NULL, /* c_id is not a key, but has to reference a customer per Orderr */
    PRIMARY KEY ( o_id ),
    FOREIGN KEY ( c_id ) REFERENCES Customer(c_id) );

INSERT INTO Orderr VALUES ( 1001, '2016-8-21', 1 );
INSERT INTO Orderr VALUES ( 1002, '2016-7-21', 8 );
INSERT INTO Orderr VALUES ( 1003, '2016-8-22' , 15 );
INSERT INTO Orderr VALUES ( 1004, '2016-10-22', 5 );
INSERT INTO Orderr VALUES ( 1005, '2016-7-24', 3 );
INSERT INTO Orderr VALUES ( 1006, '2016-10-24', 2 );
INSERT INTO Orderr VALUES ( 1007, '2016-8-27', 5 );
INSERT INTO Orderr VALUES ( 1008, '2016-10-30', 12 );
INSERT INTO Orderr VALUES ( 1009, '2016-11-05', 4 );
INSERT INTO Orderr VALUES ( 1010, '2016-11-05', 1 );

-- OrderLine
CREATE TABLE OrderLine (
    o_id CHAR(30) NOT NULL,
    p_id CHAR(30) NOT NULL,
    quantity INTEGER,
    sale_price FLOAT,
    PRIMARY KEY ( o_id, p_id ),
    FOREIGN KEY ( o_id ) REFERENCES Orderr(o_id),
    FOREIGN KEY ( p_id ) REFERENCES Product(p_id) );

-- PriceUpdate
CREATE TABLE PriceUpdate (
    pu_id INT(11) AUTO_INCREMENT,
    pu_date DATETIME,
    pu_old_price FLOAT,
    pu_new_price FLOAT,
    PRIMARY KEY ( pu_id ) );

INSERT INTO OrderLine VALUES ( 1001, 1, 2, NULL );
INSERT INTO OrderLine VALUES ( 1001, 2, 2, NULL );
INSERT INTO OrderLine VALUES ( 1001, 4, 1, NULL );
INSERT INTO OrderLine VALUES ( 1002, 3, 5, NULL );
INSERT INTO OrderLine VALUES ( 1003, 3, 3, NULL );
INSERT INTO OrderLine VALUES ( 1004, 6, 2, NULL );
INSERT INTO OrderLine VALUES ( 1004, 8, 2, NULL );
INSERT INTO OrderLine VALUES ( 1005, 4, 4, NULL );
INSERT INTO OrderLine VALUES ( 1006, 4, 1, NULL );
INSERT INTO OrderLine VALUES ( 1006, 5, 2, NULL );
INSERT INTO OrderLine VALUES ( 1006, 7, 2, NULL );
INSERT INTO OrderLine VALUES ( 1007, 1, 3, NULL );
INSERT INTO OrderLine VALUES ( 1007, 2, 2, NULL );
INSERT INTO OrderLine VALUES ( 1008, 3, 3, NULL );
INSERT INTO OrderLine VALUES ( 1008, 8, 3, NULL );
INSERT INTO OrderLine VALUES ( 1009, 4, 2, NULL );
INSERT INTO OrderLine VALUES ( 1009, 7, 3, NULL );
INSERT INTO OrderLine VALUES ( 1010, 8, 10, NULL );

-- Question 1: Simple Stored Procedure
DELIMITER $$ -- Change delimiter from ; to $$
CREATE PROCEDURE ProductLineSale()
    BEGIN
    ALTER TABLE Product
        ADD COLUMN SalePrice DECIMAL(6,2) AFTER p_photo;
    UPDATE Product P
        SET SalePrice = (P.p_standard_price - P.p_standard_price * 0.15)
            WHERE P.p_standard_price < 400;
    UPDATE Product P
        SET SalePrice = (P.p_standard_price - P.p_standard_price * 0.1)
            WHERE P.p_standard_price >= 400;
    END$$
DELIMITER; -- Change delimiter back to ;

DELIMITER $$
CREATE OR REPLACE TRIGGER StandardPriceUpdate
	AFTER UPDATE ON Product
    FOR EACH ROW
        BEGIN
            INSERT INTO PriceUpdate
                (pu_date,pu_old_price,pu_new_price) VALUES
                    (NOW(), OLD.p_standard_price, NEW.p_standard_price)
        END$$
DELIMITER;
