-- slide 6
-- single row subquery in WHERE clause
-- Find all books whose retail price is more than the retail price of 
-- the book ‘DATABASE IMPLEMENTATION’. Include the title and retail 
-- price on the report. Sort by title.
select title, retail
from books
where retail > 
    (select retail -- subquery
    from books
    where title = 'DATABASE IMPLEMENTATION');

-- slide 7
-- Single-Row Subquery in a HAVING Clause
-- Show all categories whose average profit is greater than the average 
-- profit of the ‘LITERATURE’ category. Show the category name and the 
-- average profitability.
select category, avg(retail-cost)
from books
group by category
having avg(retail-cost) > 
    (select avg(retail-cost) -- subquery
    from books
    where category = 'LITERATURE');

-- slide 9
-- Single-Row Subquery in a SELECT Clause
-- Show each category, show the price of the most expensive books in 
-- that category and the price of the most expensive book in the 
-- bookstore.
select category, max(retail) "Category Max", 
    (select max(retail)
    from books) "Most Exp Book"
from books
group by category;

-- slide 10
-- Subqueries in other clauses
-- Find the most expensive book in each category.
select bo.category, title, temp.maxi
from books bo, 
    (select max(retail) maxi, category -- creating new temp table
    from books
    group by category) temp
where bo.category = temp.category and retail = temp.maxi;

-- slide 13
-- Multiple-Row and Multi-Column Subquery in a WHERE Clause 
-- Show the most expensive book in each category.
-- The inner query (a set of category and max retail)
-- Now write the outer query to find the book in that category with that 
-- price.
select category, title, retail
from books
where (category, retail) IN 
    (select category, max(retail)
    from books
    group by category);

-- slide 15
-- Multiple-Row Subquery in a WHERE Clause 
-- Find all books whose retail price is less than the price of any 
-- computer book in the bookstore. Should the title, retail price and 
-- category. The list should not include computer books. Sort by title.
select title, retail, category
from books
where retail <any
    (select retail
    from books
    where category = 'COMPUTER')
    and category != 'COMPUTER';

-- slide 16
-- Multiple-Row Subquery in a HAVING Clause
-- Find all orders whose value is greater than the value of orders 
-- placed by customers in Florida. Show the order# and value of the 
-- order. Sort by order#.
-- solution slide 16
select order#, sum(paideach*quantity)
from orderitems
group by order#
having sum(paideach*quantity) >ALL 
	(select sum(paideach*quantity)
	 FROM orderitems 
        JOIN orders USING (order#) 
        JOIN customers USING (customer#)
	 where state = 'FL'
	 group by order#);
 
-- slide 17
-- Using EXISTS
-- Show all authors that have sold at least one book (an order exists 
-- for the book).  Requires correlation between inner and outer query.
select fname, lname
from author ao
where exists 
    (select authorid
	from bookauthor ba 
        join books using (isbn)
		join orderitems using(isbn)
	where ba.authorid = ao.authorid);
-- Show authors that have NOT sold any books yet.
select fname, lname
from author ao
where NOT exists -- just add NOT here
    (select authorid
	from bookauthor ba 
        join books using (isbn)
		join orderitems using(isbn)
	where ba.authorid = ao.authorid);

-- slide 20
-- Signle column subquery
-- Show all the customers (non-NE region) that have ordered the same 
-- books as customers in the NE region.
select firstname, lastname, isbn, title, region
from customers join orders using (customer#) join orderitems using (order#)
	join books using (isbn)
where region != 'NE' and 
	isbn IN
	(select isbn
     from customers join orders using (customer#) join orderitems using (order#)
     where region = 'NE');

-- slide 21
-- Multiple-Column Subqueries
select title, category, retail
from books
where (category, retail) IN
	(select category, min(retail)
     from books
     group by category);

-- slide 23
-- Multiple-Column Subquery in a WHERE Clause
-- What is the lowest price book in each category?
-- the category AND retail price must match members of the inner set
select books.category, title, retail
from books,
	(select category, avg(retail) catavg
     from books
     group by category) averages
where books.category = averages.category AND
	books.retail > averages.catavg;

-- slide 27
-- nested subqueries
-- Find the customer that has the largest number of items on an individual order.
select firstname, lastname, order#
from customers join orders using (customer#)
where order# in 
	(select order#
	 from orderitems
	 group by order#
	 having count(*) =
		(select max(count(*))
		from orderitems
		 group by order#));

-- slide 28
-- Correlated Subqueries versus Uncorrelated Subqueries
-- Show the most expensive book published by each publisher.

-- uncorrelated:
select name, title, retail
from publisher
    join books using(pubid)
where (name, retail) in
    (select name, max(retail)
    from publisher
        join books using (pubid)
    group by name);

-- correlated
select name, title, retail
from books b, publisher p
where p.pubid = b.pubid and 
    b.retail = 
        (select max(retail)
        from books bi 
        where bi.pubid = b.pubid);

-- slide 37
-- “TOP-N” Analysis and Pagination
-- Top 5 most profitable books using Oracle 12c
select title, retail-cost profit
from books
order by profit desc
fetch first 5 rows only;

-- slide 38
-- extract 1st page of customers (based on alphabetic order)
-- assuming 5 rows per form page
select firstname, lastname
from customers
order by 2,1
fetch first 5 rows only;
-- extract 2nd page of customers (based on alphabetic order)
-- assuming 5 rows per form page
select firstname, lastname
from customers
order by 2,1
offset 5 rows
fetch next 5 rows only;