-- Unit 12 Lab Using Joins

set linesize 160
set echo on
column tour_description format a30
column dest_description format a70
column first_name format a15
column last_name format a15

spool c:/cprg250s/Unit12LabOutput.txt

-- Question 1
-- Show all the Customers and a unique list of their vacation destinations for non-California customers. Remember is it possible for the customer province to be null if it is a Eurpoean customer. Sort by last name, first name and destination description. (Join using(…))

break on first_name on last_name;
select unique first_name, last_name, customer_province, dest_description
from rcv_customer c 
    join rcv_tour_customer tc using(customer_number)
    join rcv_vacation_tour vt using(tour_code)
    join rcv_tour_destination td using(tour_code)
    join rcv_destination d using(dest_code)
where not c.customer_province = 'CA' OR c.customer_province IS NULL
order by 2,1,4,3;
 
-- Question 2
-- Show all destinations that have not been visited by customers. Make the destination column A100 (100 alphanumeric characters wide). Sort by destination.

column dest_description format A100
select dest_description "Destination"
from rcv_destination
MINUS
select dest_description
from rcv_destination
    join rcv_tour_destination using(dest_code)
    join rcv_vacation_tour using(tour_code)
    join rcv_tour_customer using(tour_code)
order by 1;

-- Question 3
-- Provide a list of Agents and all the vacation tours booked by them, remove any duplicates. Include vacation tours that have yet to be booked by agents. Solve using JOIN...ON. Clear any previous break commands before running this query. Sort by Agent Lastname, Agent Firstname and tour description.

clear breaks;
select unique a.first_name "Agent", a.last_name "Agent Last",  tour_description, rating_description
from rcv_agent a join rcv_customer c on (a.agent_id = c.agent_id)
join rcv_tour_customer tc on (c.customer_number = tc.customer_number)
right outer join rcv_vacation_tour vt on (tc.tour_code = vt.tour_code) 
join rcv_rating r on (vt.rating_code = r.rating_code)
order by 2,1,3;

-- Question 4
-- Provide a list of customers and the type of tours they have booked. Remove any duplicates. Solve using JOIN..USING. Sort by Customer lastname, Customer firstname and type of tour.  

break on first_name on last_name;
select unique c.first_name, c.last_name, rating_description "Rating Description" from rcv_customer c
    join rcv_tour_customer tc using(customer_number)
    join rcv_vacation_tour vt using(tour_code)
    join rcv_rating using(rating_code)
    join rcv_tour_destination using(tour_code)
    join rcv_destination using (dest_code)
order by 2,1,3;

spool off





