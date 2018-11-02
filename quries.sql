-- All questions

-- Question 1
-- Listing all the products that cost less than $275

-- PRODUCTLESSTHAN275
-- 1                             
-- 2                             
-- 8                      

SELECT P.p_id AS ProductsLessThan275 FROM Product P
    WHERE P.p_standard_price < 275;       

-- Question 2
-- Listing the prices, names and product ID of all the products

-- PRODUCTUNITPRICE                 PRODUCTNAME                     PRODUCTID
-- 175                           	End Table                     	1                             
-- 200                           	Coffee Table                  	2                             
-- 375                           	Computer Desk                 	3                             
-- 650                           	Entertainment Center          	4                             
-- 325                           	Writers Desk                  	5                             
-- 750                           	8-Drawer Desk                 	6                             
-- 800                           	Dining Table                  	7                             
-- 250                           	Computer Desk                 	8                             

SELECT P.p_standard_price AS ProductUnitPrice, P.p_name AS ProductName, P.p_id AS ProductID
    FROM Product P;

-- Question 3
-- Calculating the average price for all our products

-- AVERAGEPRICE
-- 440.625

SELECT AVG(P.p_standard_price) AS AveragePrice
    FROM Product P;

-- Question 4
-- Returns the number of different items with order number 1004 

-- ITEMSORDER1004
-- 2
SELECT COUNT(*) AS ItemsOrdered1004 FROM OrderLine OL
    WHERE OL.o_id = '1004';

-- Question 5
-- Lists all the orders that have been completed since 10/24/2010

-- ORDERS
-- 1001                          
-- 1002                          
-- 1003                          
-- 1004                          
-- 1005                          
-- 1006                          
-- 1007                          
-- 1008                          
-- 1009                          
-- 1010                          

SELECT O.o_id AS Orders
    FROM Orderr O
        WHERE O.o_date >= STR_TO_DATE('10/24/2010', '%m/%d/%Y');

-- Question 6
-- List of all the furnitures that are NOT cherry

-- P_ID                              P_NAME                          P_FINISH                        P_STANDARD PRICE                PL_ID       P_PHOTO
-- 2                             	Coffee Table                  	Natural Ash                   	200                           	2                             	
-- 3                             	Computer Desk                 	Natural Ash                   	375                           	2                             	
-- 4                             	Entertainment Center          	Natural Maple                 	650                           	3                             	
-- 6                             	8-Drawer Desk                 	White Ash                     	750                           	2                             	
-- 7                             	Dining Table                  	Natural Ash                   	800                           	2                             	
-- 8                             	Computer Desk                 	Walnut                        	250                           	3                             	

SELECT *
    FROM Product P
        WHERE NOT P.p_finish = 'Cherry';

-- Question 7
-- Listing product name, finish, and standard price for all desks 
-- and all tables that cost more than $300 in the Product table. 

-- NAME                             FINISH                          PRICE
-- Computer Desk                 	Natural Ash                   	375                           
-- Entertainment Center          	Natural Maple                 	650                           
-- Writers Desk                  	Cherry                        	325                           
-- 8-Drawer Desk                 	White Ash                     	750                           
-- Dining Table                  	Natural Ash                   	800                           
SELECT P.p_name AS Name, P.p_finish AS Finish, P.p_standard_price AS Price
    FROM Product P
        WHERE P.p_standard_price >= '300';


-- Question 8
-- Listing all products in the Product table have a standard price between $ 200 and $ 300? 

-- NAME                             PRICE
-- Coffee Table                  	200                           
-- Computer Desk                 	250                           

SELECT P.p_name AS Name, P.p_standard_price AS Price
    FROM Product P
        WHERE P.p_standard_price BETWEEN '200' AND '300';

-- Question 9
-- Listing customer name, city, and state for all customers in the Customer table 
-- whose address is Florida, Texas, California, or Hawaii. 
-- List the customers alphabetically by state and alphabetically by customer within each state. 

-- NAME                             CITY                            STATE 
-- Impressions                   	Sacramento                    	CA
-- Contemporary Casuals          	Gainesville                   	FL
-- Flanigan Furniture            	Ft Walton Beach               	FL
-- Value Furnitures              	Plano                         	TX

SELECT C.c_name AS Name, C.c_city AS City, C.c_state AS State
    FROM Customer C
        WHERE C.c_state IN ('FL', 'TX', 'CA')
            ORDER BY C.c_state, C.c_name;

-- Question 10
-- Count the number of customers with addresses in each state to which we ship. 

--    STATE     CUSTOMER COUNT
--      NJ	        1
--      CA	        1
--      NM	        2
--      VA	        1
--      Il  	    1
--      NY	        4
--      CO	        1
--      FL	        2
--      TX	        1

SELECT C.c_state AS State, count(*) AS CustormerCount
    FROM Customer C
        GROUP BY C.c_state;

-- Question 11
-- Count the number of customers with addresses in each city to which we ship. List the cities by state. 

--  STATE   CITY                      CUSTOMERCOUNT
--    CA	Sacramento                    	1
--    CO	Boulder                       	1
--    FL	Ft Walton Beach               	1
--    FL	Gainesville                   	1
--    Il	Oak Brook                     	1
--    NJ	Carteret                      	1
--    NM	Farmington                    	1
--    NM	Las Cruces                    	1
--    NY	Albany                        	1
--    NY	Rome                          	2
--    NY	Syracuse                      	1
--    TX	Plano                         	1
--    VA	Virginia Beach                	1

SELECT C.c_state AS State, C.c_city AS City, COUNT(*) AS CustormerCount
    FROM Customer C
        GROUP BY C.c_city, C.c_state
        ORDER BY C.c_state;

-- Question 12
-- Find only states with more than one customer. 

--  STATESONEORMORE
--    NM
--    NY
--    FL
SELECT C.c_state AS StatesOneOrMore
    FROM Customer C
        GROUP BY C.c_state
        HAVING COUNT(C.c_id) > 1;

-- Question 13
-- List, in alphabetical order, the product finish and the average standard price for
-- each finish for selected finishes having an average standard price less than 750. 

--    FINISH                          AVERAGEPRICE
--    Cherry                        	250
--    Natural Ash                   	287.5
--    Natural Maple                 	650
--    Walnut                        	250

SELECT P.p_finish AS Finish, AVG(P.p_standard_price) AS AveragePrice
    FROM Product P
        WHERE P.p_standard_price < '750'
        GROUP BY P.p_finish
        ORDER BY P.p_finish;

-- Question 14
-- Total value of orders placed for each furniture product.

--      NAME                            FINISH                      PRODUCTSUM
--    End Table                     	Cherry                        	5
--    Computer Desk                 	Natural Ash                   	11
--    8-Drawer Desk                 	White Ash                     	2
--    Dining Table                  	Natural Ash                   	5
--    Computer Desk                 	Walnut                        	15
--    Writers Desk                  	Cherry                        	2
--    Entertainment Center          	Natural Maple                 	8
--    Coffee Table                  	Natural Ash                   	4

SELECT P.p_name AS Name, P.p_finish AS Finish, SUM(OL.quantity) AS ProductSum
    FROM OrderLine OL, Product P
        WHERE OL.p_id = P.p_id
        GROUP BY OL.p_id, P.p_name, P.p_finish;