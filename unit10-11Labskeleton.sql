-- Lab Unit 10-11 Simple SELECT and Sorting 
set echo on
set linesize 100
set pagesize 66
spool c:/cprg250s/unit10-11LabOutput.txt

-- Q1 - basic select columns with headers
column agent_id format A4
select last_name, first_name, agent_id "AGEN"
from rcv_agent
where agent_speciality = 'US'
order by last_name;


-- COLUMN commands here to set column width and heading
-- column xxx format A80 heading "The Heading"
set linesize 160
column dest_description format A80 heading "Destination Desc."
column country format A15
column city format A10
-- Q2 
select dest_description, country, state, city, price
from rcv_destination
where country in ('Spain', 'France') and price <= 100
order by country, state, city, price;
clear columns;

-- Q3 
column customer_province format A4 heading "Prov"
select first_name "First", last_name "Last", customer_phone "Phone", customer_province
from rcv_customer
where customer_phone like '310%' and customer_province = 'CA'
order by last_name, first_name;

spool off


