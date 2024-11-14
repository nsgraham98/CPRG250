-- slide 6 
-- SUM function
select order#, quantity*paideach
from orderitems
where order# = 1007;
-- slide 7
-- SUM function
-- total value of order 1007
select sum(quantity*paideach)
from orderitems
where order# = 1007;

-- slide 8
-- AVG function
select title, retail-COST
from books
where category = 'COMPUTER';

select avg(retail-COST)
from books
where category = 'COMPUTER';

-- slide 10
-- COUNT function
select count(distinct category)
from books;

select count(discount)
from books;

--slide 12
-- COUNT function with NULL values
select count(*)
from orders
where shipdate is null;

-- slide 13
-- MAX function
select max(retail-COST)
from books;

select title, retail-COST
from books
where retail-cost = 41.95;
-- book with highest profit
select title, retail-COST
from books
where retail-cost = 
   (select max(retail-COST)
    from books);
    
-- slide 14
-- MIN function
-- when was the oldest book published
select min(pubdate)
from books;
-- what is the oldest book
select title, pubdate
from books
where pubdate =
    (select min(pubdate)
     from books);

-- slide 16
-- MAX on different datatypes
select max(lastname) from customers;
select max(pubdate) from books;
select max(customer#) from customers;

-- slide 18
-- GROUP BY function
select category, title, retail-cost
from books
order by category;

select category
from books
group by category;
-- show avg profitability and # of books in each category
select category, count(*) "# of Books",
	avg(retail-cost) "Avg Profit"
from books
group by category;

-- slide 19
-- common GROUP BY ERROR
-- missing a GROUP BY clause for nonaggregated
-- columns in the SELECT clause
select category, avg(retail)
from books
group by category;

-- slide 22
-- restricting groups (like a WHERE clause for groups)
-- HAVING clause
select category, avg(retail-cost)
from books
group by category
having avg(retail-cost) > 15;
 
-- slide 24
-- HAVING clause cont.
-- avg profitability of each book category
-- only include categories that have:
    -- 2 or more books published after jan 1, 2004
select category
from books
where pubdate > '01-JAN-04'
group by category;

SELECT max(avg(retail-cost)) "Profit"
FROM books
GROUP BY category;

SELECT category, avg(retail-cost) "Profit"
FROM books
GROUP BY category
having avg(retail-cost) = 
		(SELECT max(avg(retail-cost)) "Profit"
         FROM books
         GROUP BY category);

-- slide 27
-- STDDEV function (standard deviation)
select category, count(*) "# of BOoks", avg(retail), stddev(retail)
from books
group by category;