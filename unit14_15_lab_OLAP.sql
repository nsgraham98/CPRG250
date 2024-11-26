-- For customer show the number of vacation tours taken by each customer (firstname, lastname) 
-- as well as the total value of all vacation tours. Provide a grand total () as well. For the grand total display 
-- the words ‘Grand Total’ under the first name. Sort by last name and first name.
-- Hint: unique tour_codes tell you the number of tours and adding up all of the prices for the destinations within a tour tells you the value. 

column "Customer" format A40
select
    case
        when c.first_name || ' ' || c.last_name is null
            then 'Grand Total'
            else c.first_name || ' ' || c.last_name
        end "Customer",
    count(unique vt.tour_code) "# of Tours",
    to_char(sum(d.price), '$99990.00') "Value"
from 
    rcv_customer c 
    join rcv_tour_customer tc using (customer_number)
    join rcv_vacation_tour vt on tc.tour_code = vt.tour_code
    join rcv_tour_destination td on vt.tour_code = td.tour_code
    join rcv_destination d on td.dest_code = d.dest_code
group by rollup (c.first_name || ' ' || c.last_name)
order by 2,1;


-- Show all customers with tour packages whose value is greater than $2,000 (using a having clause). 
-- Sort by last name and first name. Grouping by customer name (firstname, lastname)

select
    c.first_name "First",
    c.last_name "Last",
    sum(d.price) "Total"
from 
    rcv_customer c 
    join rcv_tour_customer tc using (customer_number)
    join rcv_vacation_tour vt on tc.tour_code = vt.tour_code
    join rcv_tour_destination td on vt.tour_code = td.tour_code
    join rcv_destination d on td.dest_code = d.dest_code
group by rollup (c.last_name, c.first_name)
    having (c.first_name is not null) 
    and sum(d.price) > 2000
order by 2,1;


-- Create a multi-dimension report showing the number of customer tours booked based on the following dimensions: 
    -- tour region
    -- tour-rating description
    -- tour region, tour rating, full name (first name concatenated with last name)
    -- tour region, rating description and full name
    -- grand total
-- Requires OLAP (grouping sets, rollup or cube). The resultant report should look like this:

select
    vt.tour_region as "Region",
    r.rating_description as "Rating Desc",
    c.first_name || ' ' || c.last_name as "Full Name",
    count(unique vt.tour_code) as "# of Tours"
from 
    rcv_customer c 
    join rcv_tour_customer tc using (customer_number)
    join rcv_vacation_tour vt on tc.tour_code = vt.tour_code
    join rcv_tour_destination td on vt.tour_code = td.tour_code
    join rcv_destination d on td.dest_code = d.dest_code
    join rcv_rating r on vt.rating_code = r.rating_code
group by grouping sets(
    vt.tour_region,
    r.rating_description,
    (vt.tour_region, r.rating_code, c.first_name || ' ' || c.last_name),
    (vt.tour_region, r.rating_description, c.first_name || ' ' || c.last_name),
    ()
    )
having
    (vt.tour_region is not null and r.rating_description is not null and c.first_name || ' ' || c.last_name is not null)
    or (vt.tour_region is not null and r.rating_description is not null and c.first_name || ' ' || c.last_name is null)
    or (vt.tour_region is not null and r.rating_description is null and c.first_name || ' ' || c.last_name is null)
    or (vt.tour_region is null and r.rating_description is null and c.first_name || ' ' || c.last_name is null)
order by 1,2,3;
