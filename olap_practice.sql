set echo on
set linesize 160
set pagesize 66
spool c:/cprg250s/olap_practice.txt

-- q1
-- List all authors and the value of the orders associated with the books
-- that they wrote. Author’s get a 1% commission based on the value of 
-- the sales. Sum the value of their commissions and totals in each 
-- column. Notice the presence of a total for all authors. You can use 
-- grouping sets to solve this problem. Carefully note the formatting of 
-- the resultant table. Sort by author firstname and lastname.

Column "Commission" format A10
select 
    initcap(a.fname || ' ' || a.lname) as "Author Name",
    to_char(sum(oi.paideach * oi.quantity), '$9990.00') as "Value",
    to_char((sum(oi.paideach * oi.quantity) * 0.01), '$9990.00') as "Commission"
from 
    author a
    join bookauthor ba using (authorid)
    join books b on ba.isbn = b.isbn
    join orderitems oi on b.isbn = oi.isbn
    join orders o on oi.order# = o.order#
group by 
    grouping sets(
        (a.fname || ' ' || a.lname),
        ()
    )
order by 1;

-- q2
-- What is the average profit per book for each publisher? Include an 
-- average profit for all publishers.

column "Avg Profit" format A10
select
    initcap(p.name) as "Publisher",
    to_char(avg(b.retail - b.cost), '$990.00') as "Avg Profit"
from
    publisher p
    join books b using (pubid)
group by
    grouping sets(
        p.name,
        ()
    )
order by 1;

-- Modify the previous query so that a title of ‘Total” appears for the 
-- final total. 
-- Hint: Use a Case to return ‘Total’ when publisher name is null.

column "Avg Profit" format A10
select
    case when
        p.name is null
            then 'Total'
        else initcap(p.name)
    end as "Publisher",
    to_char(avg(b.retail - b.cost), '$990.00') as "Avg Profit"
from
    publisher p
    join books b using (pubid)
group by
    grouping sets(
        p.name,
        ()
    )
order by 1;

spool off