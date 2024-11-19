-- slide 6
-- SUM function
select order#, quantity*paideach
from orderitems
where order# = 1007;
 
-- slide 7
-- total Value of Order #1007
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
 -- COUNT Function
select count(distinct category)
from books;

select count(discount)
from books;
 
select count(*)
from orders
where shipdate is null;

select retail-COST
from books;

select max(retail-COST)
from books;
 
select title, retail-COST
from books
where retail-cost = 41.95;

-- book with highest profit
-- Max funciton
select title, retail-COST
from books
where retail-cost = 
   (select max(retail-COST)
    from books);

-- MIN function
select min(pubdate)
from books;

select title, pubdate
from books
where pubdate =
    (select min(pubdate)
     from books);
 
-- slide 16
-- MAX on diff data types
select max(lastname) from customers;
select max(pubdate) from books;
select max(customer#) from customers;
 
 -- slide 18
 --GROUP BY funciton
select category, title, retail-cost
from books
order by category;

select category
from books
group by category;

select category, count(*) "# of Books",
	avg(retail-cost) "Avg Profit"
from books
group by category;
 
-- slide 19
-- common error:
-- missing a GROUP BY clause for nonaggregated 
-- columns in the SELECT clause 
select category, avg(retail)
from books
group by category;
 
select category, avg(retail-cost)
from books
group by category;

-- slide 22
-- HAVING clause
-- like where clause for groups
select category, avg(retail-cost)
from books
group by category
having avg(retail-cost) > 15;
 
-- slide 24
-- restricting aggregated output
-- Show the average profitability of each book category, 
-- only include categories that have 2 or more books published after Jan 1, 2004.
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
-- STDDEV function
-- standard deviation
select category, count(*) "# of BOoks", avg(retail), stddev(retail)
from books
group by category;
 
