-- Vertification Script for SIS populating database
 
set echo ON
set linesize 150
set pagesize 66
spool "C:\cprg250s\sis-project-5\verification\sis_instructor_report.txt"

column instructor_name format a20;
column course_code format a10;
column course_name format a40;
column credential_name format a25;

select 
    i.first_name || ' ' || i.last_name as instructor_name,
    sc.course_code,
    co.name as course_name,
    cr.name as credential_name
from 
    sis_instructor i
join 
    sis_instructor_course ic on i.instructor_id = ic.instructor_id
join 
    sis_schedule_course sc on ic.course_registration# = sc.course_registration# 
                            and ic.semester_code = sc.semester_code
join 
    sis_course co on sc.course_code = co.course_code
join 
    sis_course_within_cred cwc on co.course_code = cwc.course_code
join 
    sis_credential cr on cwc.credential# = cr.credential#
order by 
    i.instructor_id, co.name;




spool off