-- PP single row functions (unit 13)

-- slide 3
select initcap(firstname), initcap(lastname)
from customers
order by 2,1;
 
-- slide 4
select retail 
from books;
selet avg(retail)
from books;

-- slide 7 -> convert characters to lowercase
select lastname
from customers
where lower(lastname) = 'smith';

-- slide 9 -> INITCAP -> capitalizing first letter of word
select initcap(lastname) "Last", initcap(address) "Address"
from customers;

-- slide  11 -> returns subsection of specified string
select firstname, lastname, state, 
    substr(zip,1,3)"Section Ctr", zip
from customers 
where state in ('CA', 'FL')
order by 3,5;

-- slide 13 -> finding position within string
select instr('Calgary, AB, Canada', 'AB')
from dual;

-- slide 14
-- nesting functions -> display all books and the year they were published -> Format of pubdate is: Month dd, yyyy
column "Pub Date" format A20
select title, substr (to_char (pubdate, 'fmMonth dd, yyyy'), 1, 
				instr(to_char (pubdate, 'fmMonth dd, yyyy'), ' ')) "Pub Date"
from books;

-- slide 15
select name, length (name)
from publisher;

-- slide 16 -> right padding (RPAD), left padding (LPAD)
select lpad (firstname, 10, '*') "First",
    rpad (lastname, 10, '*')
from customers;

-- slide 17 -> RPAD example
column "Price" format A20
select title, retail, rpad ('Price: ', retail/10+7+1, '$') "Price"
from books;
clear columns

-- slide 18 -> LTRIM (left) and RTRIM (right)
select lastname, ltrim(address, 'P.O. BOX ') "Box Number", city
from customers
where address like 'P.O. BOX%';

-- slide 19 -> REPLACE function
column "Address" format A40
select lastname, replace(address, 'P.O. BOX', 'Post Office Box#') "Address"
from customers
where address like 'P.O. BOX%';
clear columns

-- slide 20 -> TRANSLATE function
select lastname, translate (lastname, 'AEITOS', '431705') "Translate to Gamers"
from customers;

select title, translate(pubdate, '-', '/') "Pub Date"
from books;

-- slide 21
select firstname, lastname, CONCAT ('Customer #', customer#) "Customer #"
from customers;

-- slide 22 -> TO_CHAR -> also using format elements (fm, fx)
select order#, to_char(orderdate, 'fmMonth DD, YYYY') "Order Date",
    to_char(shipdate, 'fmMonth DD, YYYY') "Ship Date"
from orders;

-- slide 25 
select title, to_char(retail*1.05, '$990.00') "Retail"
from books;

-- slide 26 -> SOUNDEX
select firstname
from customers
where soundex(firstname) = soundex ('nikolas');

-- slide 28 -> ROUND 
select sum(round(retail*1.05, 2))
from books;

-- slide 29
select title, trunc(cost,0) "Cost", retail
from books;


-- slide 31 -> manipulating dates
select SYSDATE
from dual;
-- tomorrow
select sysdate+1
from dual;
-- yesterday
select sysdate -1
from dual;
select to_char(sysdate+1/24, 'fxMonth dd, yyyy hh:mi:ss a.m.') "+1 hour"
from dual;

-- slide 32 -> MONTHS_BETWEEN
select order#, shipdate, orderdate, shipdate-orderdate "Days till Shipped"
from orders;
set pagesize 66
select title, order#, pubdate, MONTHS_BETWEEN(orderdate, pubdate)/12 "Years Old"
from books join orderitems using (isbn)
	join orders using (order#);
select add_months(sysdate, 1)
from dual;
-- add 1 month
select add_months(sysdate, 1)
from dual;
-- add 1 year (12 months)
select add_months(sysdate, 12)
from dual;
-- subtract 1 year (-12 months)
select add_months(sysdate, -12)
from dual;
 
-- slide 33 -> ADD_MONTHS
select title, name, pubdate, add_months(pubdate, 20*12) "Reneg Date"
from books join publisher
using (pubid);

-- slide 34 -> TO_DATE
-- April 3, 2009
-- NOTE for accept (user input) command:
-- entire query must be in separate file -> then use start command
-- eg. start C:/cprg250/filename.sql
accept shipdate char prompt 'Enter the shipping date (month dd, yyyy): '
select order#, orderdate, shipdate
from orders
where shipdate > to_date
('&shipdate', 'fmMonth dd, yyyy');

-- slide 35 -> ROUND function
column "Rounded Pub Date" format a25
select title, pubdate, round(pubdate, 'Month') "Rounded Pub Date"
from books;

-- slide 36 -> TRUNC function
select title, pubdate, round(pubdate, 'yyyy') "Trunc"
from books;

-- slide 38 -> NVL function -> substitutes a value for a NULL value
select title, retail, discount, retail - discount "Sale Price"
from books;

select title, retail, discount, retail - nvl(discount,0) "Sale Price"
from books;

-- slide 39 -> NVL2 function -> allows different action based on whether a value is NULL or not
select order#, orderdate, shipdate, 
	nvl2(shipdate, 'Shipped', 'Not Shipped') "Status"
from orders;

-- slide 41 -> NULLIF
select order#, item#, title, retail, nullif(paideach, retail) "Discount"
from books join orderitems using (isbn);
 
-- slide 44 -> DECODE -> determines action based upon values in a list
select firstname, lastname, state,
	decode (state, 'CA', 6.5,
		'FL', 7,
		'NJ', 7,
		'TX', 6.25,
		0) "Rate"
from customers;
 
-- slide 46 -> Exact match CASE -> like a switch statement
select firstname, lastname, state,
	case state 
        when 'CA' then 6.5
        when 'FL' then 
        when 'NJ' then 7
        when 'TX' then 6.25
        else 0
	end "Rate"
from customers;
 
-- slide 47 -> Relational CASE statement -> more flexible -> can analyse multiple columns to determine output
select firstname, lastname, state, 
	case when state = 'CA' then 6.5
		 when state = 'FL' or state = 'NJ' then 7
		 when state = 'TX' then 6.25
		 else 0
	end "Rate"
from customers;