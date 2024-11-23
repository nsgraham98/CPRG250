-- slide 8
-- GROUPING SETS
-- most flexible way to solve problems
select name, category, count(*) "# of Books"
from publisher join books using (pubid)
group by GROUPING SETS(name, (name, category), category, ())
order by name, category;

-- slide 11
-- CUBE
-- The CUBE keywords instructs Oracle to automatically 
-- generate all possible adjacent combinations of 
-- grouping sets based on the columns provided.
select name, category, count(*)
from publisher join books using (pubid)
group by CUBE (name, category)
order by name, category;

-- slide 16
-- ROLLUP function
-- provide cumulative sub-totals for the columns provided
select name, category, count(*)
from publisher join books using (pubid)
group by ROLLUP (name, category);
--or using grouping sets:
select name, category, count(*)
from publisher join books using (pubid)
group by grouping sets (name, (name, category), ());

-- slide 18
-- count the # of orders for publishers on a 
-- per-month and category basis
select name, to_char(orderdate, 'MM-YYYY') Mth, category, count(*)
from publisher join books using (pubid) join orderitems using (isbn)
  join orders using (order#)
group by rollup (name, to_char(orderdate, 'MM-YYYY'), category)
order by name, 2,3;
-- or using grouping sets:
select name, to_char(orderdate, 'MM-YYYY') Mth, category, count(*)
from publisher join books using (pubid) join orderitems using (isbn)
  join orders using (order#)
group by grouping sets (name, (name, to_char(orderdate, 'MM-YYYY')), 
	(name, to_char(orderdate, 'MM-YYYY'), category), ())
order by name, 2,3;

-- slide 22
-- improving readability
-- revision 1: adding 'Grand Total' to last row
select case when name is null and category is null then 'Grand Total'
            else initcap(name) 
        end "Publisher", 
	category "Category", count(*) "# of Books"
from publisher join books using (pubid)
group by rollup (name, category)
order by name, category;

-- revision 2:
-- adding Grand total and '.......' to null category rows
select 
	case when name is null and category is null then 'Grand Total'
        else initcap(name)
	   	end "Publisher", 
	case when category is null then '..........'
	    else initcap(category)
		end "Category", count(*) "# of Books"
	from publisher join books using (pubid)
group by rollup (name, category)
order by name, category;