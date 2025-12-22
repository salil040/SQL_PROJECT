create database project
use project

select * from Books
select * from Customers
select * from Orders


--1) Retrieve all books in the "Fiction" genre:		

select * from Books
where Genre='Fiction'

---2) Find books Published after the year 1950:
select * from Books
where Published_Year>1950

---3)List all customers from the Canada
select * from Customers
where Country='Canada'

--4)Show orders placed in november 2023;

select * from Orders
where Order_Date between '2023-11-01' and '2023-11-30'

---5) Retrieve the total stock of books available

select SUM(stock) as Total_Stock
from Books

--6)Find the details of the most expansive books;

select top 1 * from Books order by Price desc 

--7)Show all customer who ordered more than 1 quantity of a book

select * from Orders
where Quantity >1

--8)Retrieve all oreders where the total amount exceeds $20

select * from Orders
where Total_Amount >20

--9) List all genres available in the Books table:

select distinct genre from Books

--10) Find the book with the lowest stock

select top 1* from Books order by Stock 

--11)calculate the total revenue generated from all orders

select sum(Total_Amount) as Revenue from Orders

--Advance questions 

--1) Retrieve the total number of books sold for each genre

select * from Orders

select b.genre,SUM( o.quantity) as Total_Books_sold
from Orders o
join Books b on o.Book_ID=b.Book_ID
group by b.Genre

---2)Find the average price of books in the "Fantancy" genre

select AVG(price) as Average_Price
from Books
where Genre='Fantasy'

---3)List customer who have placed at least 2 orders

select o.Customer_ID,c.name, COUNT(o.Order_id) as order_count
from Orders o
join Customers c on o.Customer_ID=c.Customer_ID
group by o.Customer_ID,c.Name
having  COUNT(o.Order_id)>=2


--4) Find the most frequently order book

select top 1 o.Book_ID,b.title, COUNT(o.order_id) as order_count
from Orders o
join Books b on o.Book_ID=b.Book_ID
group by o.book_id,b.title
order by  order_count desc

---5) Show the top 3 most expensive books of 'Fantsy' Genre
select top 3 * from Books
where Genre='Fantasy'
order by Price desc 

--6) Retrieve the total quantity of books sold by each author

select b.author, SUM(o.quantity) as total_books_sold
from Orders o
join Books b on o.Book_ID=b.Book_ID
group by b.Author

---7)List the cities where customers who spent over $30 are located

select distinct c.City, Total_Amount
from Orders o
join Customers c on o.Customer_ID=c.Customer_ID
where o.Total_Amount>30

---8) Find the customer who spent the most on orders

select top 1 c.customer_id, c.name, SUM(o.total_amount) as Total_Spent
From Orders o
join Customers c on o.Customer_ID=c.Customer_ID
group by c.Customer_ID, c.Name
order by Total_Spent desc






