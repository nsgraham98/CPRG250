-- 12 SQL Students Join ppt

select * from publisher;
select * from books;

-- slide 6
-- joining publisher pubid and books pubid
select name, title 
from publisher, books
where publisher.pubid = books.pubid
order by name, title;

-- slide 7
-- INCORRECT
-- select firstname, lastname, order#, customer#, orderdate
-- from customers, orders
-- where customer# = customer#;

-- CORRECT
select firstname, lastname, order#, customers.customer#, orderdate
from customers, orders
where customers.customer# = orders.customer#;

-- slide 8
select name, title, retail
from publisher, books
where publisher.pubid = books.pubid and 
    retail >= 50
order by name, title;

-- slide 9
-- using aliases (publisher p, books b)
select name, title, retail
from publisher p, books b
where p.pubid = b.pubid and 
    retail >= 50
order by 1, 2;

-- slide 12 
break on lastname on firstname;
select unique firstname, lastname, title
from customers c, orders o, orderitems oi, books b
where c.customer# = o.customer# and o.order# = oi.order# and oi.isbn = b.isbn
order by lastname, title;
clear break;

-- slide 14 
-- natural join -> BE CAREFUL!
select name, title
from publisher natural join books
order by name, title;

-- slide 15
select name, title, pubid
from publisher natural join books
order by name, title;

-- slide 16
-- BEST SYNTAX (join ... using (...))
select name, title, order#
from publisher join books using (pubid)
    join orderitems using (isbn)
order by 1,2,3;

-- slide 17
-- join ... on
select name, title, order#
from publisher p join books b on (p.pubid = b.pubid)
    join orderitems oi on (b.isbn = oi.isbn)
order by name, title, order#;

-- slides 20
select * from customers;

-- slide 23
-- self join
select c.firstname "Customer", rb.firstname "Referrer"
from customers c, customers rb
where c.referred = rb.customer#;

-- slide 27
clear breaks;
select firstname, lastname, order#
from customers c, orders o
where c.customer# = o.customer#(+) -- (+) generates a null row in order table
order by 2,1,3;

-- slide 28
-- left outer, right outer, full outer
select firstname, lastname, order#
from customers left outer join orders using(customer#)
order by 2,1,3;

-- slide 30
select firstname, lastname, order#, title
from customers full outer join orders using (customer#)
    full outer join orderitems using (order#)
    full outer join books using (isbn)
order by 2, 1, 3, 4;

-- slide 34
select title, retail, gift
from promotion p, books b
where b.retail between p.minretail and p.maxretail
order by title;

-- slide 35
-- join ... on 
select title, retail, gift
from promotion p join books b on 
(b.retail between p.minretail and p.maxretail)
order by title;

-- slide 38
-- UNION logical OR
-- INTERSECT logical AND
-- MINUS subtracts 2nd list from 1st list
select 'Author: ' || fname ||' '||lname
from author
UNION 
select 'Pub Contact: ' || contact
from publisher;

-- slide 39
select lastname
from customers
INTERSECT
select lname
from author;

-- slide 40
select customer#
from customers
MINUS
select customer#
from customers join orders using (customer#);