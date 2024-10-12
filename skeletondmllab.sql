-- skeleton script
set echo on
set linesize 132
set pagesize 66
delete from ghc_expertise;
delete from ghc_faculty;
delete from ghc_course;
delete from ghc_faculty;
-- you can change this pathname to point to a file on your computer

spool "c:\cprg250s\dmllab.txt"
-- Q1 solution


-- Q2 solution

-- Q3 solution

-- Q4 solution

-- Q5 Script
select surname, dept_name, date_hired, course_code
from ghc_course natural join ghc_expertise natural join
     ghc_faculty natural join ghc_department
order by 1,4;

-- Q6 solution

-- Q7 solution

-- Q8 script

select course_code, course_title, faculty_id
from ghc_course natural join ghc_expertise 
    natural join ghc_faculty
order by 1,2;

spool off

