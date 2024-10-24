-- references SQL Restricting Data and Sorting Student

-- slide 3
select firstname, lastname, city, state
from customers
where state = 'FL'
order by lastname;

-- slide 5
select title, retail
from books
where retail > 55
order by title;

-- slide 7
select title, retail
from books
where retail between 20 and 30;

-- slide 9 -> primary and secondary sort
select title, category
from books
where category IN ('CHILDREN', 'FAMILY LIFE', 'COOKING')
--where category = 'CHILDREN' or category = 'FAMILY LIFE' or category = 'COOKING' -- <- also works
order by category, title;

-- slide 11 -> 'P%' <- entries that begin with 'P'
select firstname, lastname
from customers
where lastname like 'P%'
order by lastname;

-- slide 12 -> select all books published in january
select title, pubdate
from books
where pubdate like '%JAN%';

-- slide 15 -> select all computer books published by pubid = 2, sort by title
select title, category, pubid
from books
where category = 'COMPUTER' and pubid = 2
order by title;

-- slide 16 -> multiple logical operators
select title, category, retail, pubid
from books
where category NOT IN ('FAMILY LIFE') and retail > 20 or pubid = 5;

-- slide 17 -> using parentheses
select title, category, pubid, retail
from books
where (category = 'FAMILY LIFE' or pubid = 3) and retail > 25;

-- slide 18 -> treatment of NULL values
select order#, shipdate 
from orders
where shipdate IS NULL; -- must use 'IS NULL'
-- where shipdate = NULL <- WRONG

-- slide 20 -> NOT NULL
select title, retail, discount, retail-discount "New Price"
from books
where discount IS NOT NULL;

-- slide 24 -> order by
select state, zip, lastname
from customers
where state in ('FL', 'CA')
order by state asc, zip desc;

-- slide 25 -> 'order by' can reference column position
column state format A6 heading 'State' -- format A6 -> displays the column as 6 characters wide
break on state -- state is only shown when it changes
select state, city, lastname, firstname
from customers
order by 1, 2, 3;
clear COLUMNS
clear breaks

-- slide 26 -> order by alias
select title, retail-cost "Profit"
from books
order by "Profit" desc; -- sorting by alias

-- slide 27
select title, pubdate
from books
order by pubdate desc;