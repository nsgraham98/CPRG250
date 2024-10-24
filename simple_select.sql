-- referencing powerpoint SQL - SELECT Stmts Student.pptx

set echo on
set linesize 132
set pagesize 66

-- slide 8
select * from customers;
select * from books;

-- slide 9
select title from books;

-- slide 10
select title, retail from books;

-- slide 12 -> aliases
select title as "Book Title", category "Genre"
from books;

-- slide 14
select title, retail, retail-cost "Profit/book", retail*0.05 "GST"
from books;

-- slide 15 -> NULL values
select * from books; -- some books have NULL value in discount column
select title "Title", retail "Retail $", discount "Discount",
    retail - discount "Discount $"
from books;

-- slide 16 -> unique/distinct keyword
select state from customers;
select unique state from customers; -- the same
select distinct state from customers; -- the same

-- slide 18 -> concatenation 
select lastname || ', ' || firstname "Customer Name"
from customers;