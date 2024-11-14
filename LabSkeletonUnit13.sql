set echo on
set linesize 160
set pagesize 66
spool c:/cprg250s/unit13.txt

-- Q1 - b
break on "Last" on "First";
column "Description" format A20
column "Date Completed" format A15
column "Expiry Date" format A15
select first_name "First", last_name "Last", 
    substr(training_description, 1, 20)"Description", 
    to_char(date_completed, 'fmMon DD, YYYY') "Date Completed", 
    to_char(add_months(date_completed, 5*12), 'fmMon DD, YYYY') "Expiry Date", 
    to_char(duration_hours, '9.00') "Hrs"
from rcv_agent 
    join rcv_agent_training using (agent_id)
    join rcv_training using (training_code)
order by 2,1,3;
clear column;
clear breaks;

-- Q2 
set linesize 200
break on "Country" on "State" on "City" on "Category";
column "Country" format A15
column "State" format A5
column "City" format A15
column "Category" format A10
column "Destination" format A100
column "Price" format A10

select country "Country", 
    NVL(state, 'N/A') "State",
    city "City",
    case 
        when price <= 50 then 'Budget'
        when price > 50 and price <= 100 then 'Regular'
        when price > 100 then 'Premium'
        end "Category", 
    dest_description "Destination", 
    to_char(price, '$999.00' )"Price"
from rcv_destination
order by 1,2,3,4,6;


spool off

