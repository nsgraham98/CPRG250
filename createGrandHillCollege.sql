--script to create the Grand Hill college database
--Dave Leskiw
--Sept 2022

-- this script will populate the grand hill college database
set echo on
spool "c:\cprg250s\populategrandhillcollege.txt"
-- drop child tables first and then the parent tables
drop table ghc_expertise cascade constraints;
drop table ghc_course cascade constraints;
drop table ghc_faculty cascade constraints;
drop table ghc_department cascade constraints;
--Create parent tables first and then their children after
--Create the department table without any constraints, add the
--constraints after.
CREATE TABLE GHC_DEPARTMENT (
    dept_no NUMBER,
    dept_name VARCHAR2(20)
);
--Add the constraints

ALTER TABLE GHC_DEPARTMENT 
    ADD CONSTRAINT sys_ghc_dept_pk PRIMARY KEY (dept_no);
ALTER TABLE GHC_DEPARTMENT 
    MODIFY (dept_name NOT NULL);

-- insert data into ghc_department
insert into ghc_department values (25,'ICT');
insert into ghc_department values (26, 'Business');

--create ghc_course table with constraints
CREATE TABLE GHC_COURSE (
   course_code CHAR(7) CONSTRAINT SYS_GHC_COURSE_PK PRIMARY KEY,
   course_title VARCHAR2(60) CONSTRAINT SYS_GHC_COURSE_TITLE_NN NOT NULL,
   credits NUMBER(2) 
        CONSTRAINT SYS_GHC_COURSE_CREDITS_NN NOT NULL
        CONSTRAINT SYS_GHC_COURSE_CREDITS_CK CHECK (credits between 1 and 9)
);

-- insert data into ghc_course
insert into ghc_course values('CMPS253', 'Interface Design', 3);
insert into ghc_course values('CPRG250', 'Database Design and Programming', 5);
insert into ghc_course values('CPRG251', 'Object Oriented Programming Essentials', 5);
insert into ghc_course values('CPRG302', 'Web Essentials', 3);
insert into ghc_course values('HREL250', 'Business Dynamics', 3);


--create ghc_faculty table with constraints
--notice that the foreign key is done at the column level
--so you dont need the keyword foreign key
CREATE TABLE GHC_FACULTY (
   faculty_id NUMBER CONSTRAINT SYS_GHC_FAC_PK PRIMARY KEY,
   surname VARCHAR2(50) CONSTRAINT SYS_GHC_FAC_SURNAME_NN NOT NULL,
   firstname VARCHAR2(50) CONSTRAINT SYS_GHC_FAC_FIRSTNAME_NN NOT NULL,
   date_hired DATE CONSTRAINT SYS_GHC_FAC_DATE_HIRED_NN NOT NULL,
   date_fired DATE,
   is_active NUMBER(1) CONSTRAINT SYS_GHC_IS_ACTIVE_NN NOT NULL
       CONSTRAINT SYS_GHC_IS_ACTIVE_CK CHECK (is_active in (0,1)),
   dept_no NUMBER CONSTRAINT SYS_GHC_FAC_GHC_DEPT_FK 
      REFERENCES ghc_department(dept_no)
);

--insert data into ghc_faculty
insert into ghc_faculty values(1294, 'Harris', 'Len', '15-Dec-19
', NULL, 1, 25);
insert into ghc_faculty values(1244, 'Lock', 'Sara', '15-Dec-19
', '01-May-20', 0, 25);
insert into ghc_faculty values(1948, 'Fischer', 'Jenny', '15-Mar-21
', NULL, 1, 26);
insert into ghc_faculty values(7839, 'Wallbanger', 'Harvey', '15-Aug-02
', NULL, 1, 25);


--create ghc_expertise table with constraints
--the primary key constraint has to be done at the table level
CREATE TABLE GHC_EXPERTISE (
    faculty_id NUMBER,
    course_code CHAR(7),
    CONSTRAINT sys_ghc_expert_pk PRIMARY KEY (faculty_id, course_code),
    CONSTRAINT sys_ghc_expert_faculty_fk FOREIGN KEY (faculty_id)
        REFERENCES GHC_FACULTY (faculty_id),
    CONSTRAINT sys_ghc_expert_course_fk FOREIGN KEY (course_code) 
        REFERENCES GHC_COURSE (course_code)
);

insert into ghc_expertise values(1294, 'CMPS253');
insert into ghc_expertise values(1294, 'CPRG302');
insert into ghc_expertise values(1294, 'CPRG251');
insert into ghc_expertise values(1948, 'HREL250');
insert into ghc_expertise values(7839, 'CPRG251');
insert into ghc_expertise values(7839, 'CPRG250');
insert into ghc_expertise values(7839, 'CMPS253');
insert into ghc_expertise values(1244, 'HREL250');
insert into ghc_expertise values(1244, 'CMPS253');

spool off




