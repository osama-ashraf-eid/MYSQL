/**** Advanced Level *****/

/*1. Select customer name together with each order the customer made*/
select c.CustomerName, o.OrderID from customers c
inner join orders o
on c.CustomerID = o.CustomerID;


/*2. Select order id together with name of employee who handled the order*/
select e.FirstName, e.LastName, o.OrderID from employees e
inner join orders o
on e.EmployeeID = o.EmployeeID;

/*3. Select customers who did not placed any order yet*/
select c.CustomerName, o.OrderID from customers c
left join orders o
on c.CustomerID = o.CustomerID
where o.OrderID is null;

/*4. Select order id together with the name of products*/
select o.OrderID, p.ProductName from orders o
inner join order_details od
on o.OrderID = od.OrderID
inner join products p
on od.ProductID = p.ProductID;

/*5. Select products that no one bought*/
select p.ProductName, od.OrderID from products p
left join order_details od
on p.ProductID = od.ProductID
where od.OrderID is null;

/*6. Select customer together with the products that he bought*/
select c.CustomerID, c.CustomerName, count(p.ProductID) as Total_Products
from orders o
inner join order_details od
on o.OrderID = od.OrderID
inner join products p
on od.ProductID = p.ProductID
inner join customers c
on c.CustomerID = o.CustomerID
group by c.CustomerID, c.CustomerName
order by Total_Products desc;

/*7. Select product names together with the name of corresponding category*/
SELECT ProductName,CategoryName
FROM products p
inner join  categories c 
on p.CategoryID=c.CategoryID;

/*8. Select orders together with the name of the shipping company*/
SELECT o.OrderID,sh.ShipperName
FROM orders o 
inner join shippers sh 
on o.ShipperID=sh.ShipperID;

/*9. Select customers with id greater than 50 together with each order they made*/
SELECT c.CustomerID,c.CustomerName,o.OrderID
FROM customers c 
inner join orders o
on c.CustomerID=o.CustomerID
WHERE c.CustomerID>50;

/*10. Select employees together with orders with order id greater than 10400*/
SELECT *
FROM employees e
inner join orders o
on e.EmployeeID=o.EmployeeID
WHERE OrderID>10400;

# Anthor answer 
SELECT e.FirstName, e.LastName, o.OrderID
FROM employees e
inner join orders o
on e.EmployeeID=o.EmployeeID
WHERE OrderID>10400;

/************ Expert Level ************/

/*1. Select the most expensive product*/
SELECT MAX(Price) AS Most_ex_Product
FROM products;


/*2. Select the second most expensive product*/
SELECT Price 
FROM products
order by Price DESC
limit 1 offset 1;
/*3. Select name and price of each product, sort the result by price in decreasing order*/
SELECT ProductName , Price 
FROM products
ORDER BY Price DESC;

/*4. Select 5 most expensive products*/
SELECT Price 
FROM products
ORDER BY Price DESC 
LIMIT 5 ;

/*5. Select 5 most expensive products without the most expensive (in final 4 products)*/
SELECT Price 
FROM products
ORDER BY Price DESC 
LIMIT 4 offset 1 ;


/*6. Select name of the cheapest product*/
SELECT ProductName 
FROM products 
ORDER BY Price asc
LIMIT 1;

/*7. Select number of employees with LastName that starts with 'D'*/
SELECT COUNT(LastName) AS no_of_em_strat_D
FROM employees
where LastName LIKE 'D%';

/* BONUS : same question for Customer this time */


/*9. Select customer name together with the number of orders made by the corresponding customer 
sort the result by number of orders in decreasing order*/
SELECT c.CustomerName, COUNT(o.OrderID) AS no_of_order
FROM customers c
inner join orders o
on c.CustomerID=o.CustomerID
group by CustomerName
ORDER BY no_of_order desc;

/*10. Add up the price of all products*/
SELECT SUM(Price ) AS sum_of_price
FROM products;

/*11. Select orderID together with the total price of  that Order, order the result by total price of order in increasing order*/
SELECT o.OrderID , SUM(p.Price) AS total_price
FROM orders o
inner join order_details od 
on o.OrderID=od.OrderID
inner join products p
on od.ProductID=p.ProductID
group by o.OrderID
order by total_price asc;

/*12. Select customer who spend the most money*/
select c.CustomerName
FROM customers c 
inner join orders o
on c.CustomerID =  o.CustomerID
inner join order_details od
on o.OrderID=od.OrderID
inner join products P
on od.ProductID=p.ProductID
GROUP BY c.CustomerName 
ORDER BY sum(p.Price) desc
LIMIT 1;

/*13. Select customer who spend the most money and lives in Canada*/
select c.CustomerName
FROM customers c 
inner join orders o
on c.CustomerID =  o.CustomerID
inner join order_details od
on o.OrderID=od.OrderID
inner join products P
on od.ProductID=p.ProductID
WHERE c.Country='Canada'
GROUP BY c.CustomerName 
ORDER BY sum(p.Price) desc
limit 1;





/*14. Select customer who spend the second most money*/
select c.CustomerName
FROM customers c 
inner join orders o
on c.CustomerID =  o.CustomerID
inner join order_details od
on o.OrderID=od.OrderID
inner join products P
on od.ProductID=p.ProductID
GROUP BY c.CustomerName 
ORDER BY sum(p.Price) desc
LIMIT 1 offset 1;

/*15. Select shipper together with the total price of proceed orders*/
select sh.ShipperName,sum(p.Price) AS total_price
FROM shippers  sh
inner join orders o
on sh.ShipperID =  o.ShipperID
inner join order_details od
on o.OrderID=od.OrderID
inner join products P
on od.ProductID=p.ProductID
GROUP BY sh.ShipperName ;

