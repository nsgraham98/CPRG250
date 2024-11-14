-- Vertification Script for SIS populating database
 
set echo ON
set linesize 150
set pagesize 66
spool "C:\cprg250s\sis-project-5\verification\sis_student_report.txt"

column student_name format a20;
column credential_name format a25;
column school_name format a20;
column course_code format a10;
column course_name format a30;
column letter_grade format a10;

select 
    s.first_name || ' ' || s.last_name as student_name,
    c.name as credential_name,
    c.school as school_name,
    cr.course_code,
    co.name as course_name,
    cr.letter_grade
from 
    sis_student s
join 
    sis_student_credential sc on s.student_id = sc.student_id
join 
    sis_credential c on sc.credential# = c.credential#
join 
    sis_student_course_record cr on s.student_id = cr.student_id
join 
    sis_course co on cr.course_code = co.course_code
where 
    cr.credential# = sc.credential#
order by 
    s.student_id, c.name, cr.course_code;



spool off