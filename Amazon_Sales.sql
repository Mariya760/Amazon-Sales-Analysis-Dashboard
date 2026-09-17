create database amazon_sales;
use amazon_sales;
create table amazon_sales_data (OrderID varchar(20),OrderDate date,CustomerID varchar(20),CustomerName varchar(100),ProductID varchar(20),
    ProductName varchar(100),Category varchar(100),Brand varchar(100),Quantity int,UnitPrice decimal(10,2),Discount decimal(10,2),
    Tax decimal(10,2),ShippingCost decimal(10,2),TotalAmount decimal(10,2),PaymentMethod varchar(50),OrderStatus varchar(30),
    City varchar(100),State varchar(100),Country varchar(100),SellerID varchar(20));
use amazon_sales;
select count(*) as Total_Rows from amazon_sales_data;
select min(OrderDate) as First_Order,max(OrderDate) as Last_Order from amazon_sales_data;
select min(OrderID) as First_OrderID,max(OrderID) as Last_OrderID from amazon_sales_data;
select count(*) as Total_Rows,sum(OrderID is null) as Missing_OrderID,sum(OrderDate is null) as Missing_OrderDate,sum(Category is null) as Missing_Category,sum(Quantity is null) as Missing_Quantity,sum(TotalAmount is null) as Missing_TotalAmount from amazon_sales_data;
select sum(TotalAmount) as Total_Sales,count(distinct OrderID) as Total_Orders,sum(Quantity) as Total_Quantity,avg(TotalAmount) as Average_Order_Value from amazon_sales_data;
select Category,sum(TotalAmount) as Total_Sales from amazon_sales_data group by Category order by Total_Sales desc;
select ProductName,sum(TotalAmount) as Total_Sales from amazon_sales_data group by ProductName order by Total_Sales desc limit 10;
select Brand,sum(TotalAmount) as Total_Sales from amazon_sales_data group by Brand order by Total_Sales desc;
select year(OrderDate) as year,month(OrderDate) as month,sum(TotalAmount) as Total_Sales from amazon_sales_data group by year(OrderDate), month(OrderDate)order by year, Month;
select Country,sum(TotalAmount) AS Total_Sales from amazon_sales_data group by Country order by Total_Sales desc;
select State,sum(TotalAmount) AS Total_Sales from amazon_sales_data group by State order by Total_Sales desc;
select CustomerID,CustomerName,sum(TotalAmount) AS Total_Sales from amazon_sales_data group by CustomerID, CustomerName order by Total_Sales desc limit 10;