-- Build Script for SIS DATABASE
-- Last Modified: Oct 13, 2024
-- Name: victoria Cheng
 
set echo ON
set linesize 132
set pagesize 66
spool "C:\cprg250s\sis-project-4\SISCreateOutput.txt"
-- drop all the tables, child table first, parent second
drop table sis_student_course_record cascade constraint;
drop table sis_student_credential cascade constraint;
drop table sis_instructor_course cascade constraint;
drop table sis_schedule_course cascade constraint;
drop table sis_course_within_cred cascade constraint;
drop table sis_course_preq cascade constraint;
drop table sis_course cascade constraint;
drop table sis_student cascade constraint;
drop table sis_credential cascade constraint;
drop table sis_instructor cascade constraint;

-- need to double check on these FKs
 
-- create all the tables, parent first, child SECOND
-- create sis_instructor here
create table sis_instructor(
	instructor_id integer primary key,
	first_name NVARCHAR2(50) not null,
	last_name NVARCHAR2(50) not null,
	address NVARCHAR2(100) not null,
	city NVARCHAR2(50) not null,
	prov nchar(2) not null 
		constraint sis_instructor_prov_ck 
		check (prov in ('AB', 'BC', 'MB', 'NB', 'NL', 'NS', 'NT', 'NU', 'ON', 'PE', 'QC', 'SK', 'YT')),
	postal_code nchar(5) not null
		constraint sis_instructor_postal_code_ck 
		check(regexp_like(postal_code, '^[0-9]{5}(-[0-9]{4})?$')), 
	phone_number nchar(12) not null 
		constraint sis_instructor_phone_number_ck 
		check (REGEXP_LIKE(phone_number, '^[0-9]{3}\.[0-9]{3}\.[0-9]{4}$')),
	email NVARCHAR2(100) not null 
		unique 
		check (regexp_like(email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'))
);
-- create sis_credential here
create table sis_credential(
	credential# integer primary key,
	school NVARCHAR2(100) not null,
	name NVARCHAR2(100) not null,
	type NVARCHAR2(2) not null check(type in ('MI', 'FT', 'CT', 'PD', 'AD', 'D'))
);
 
-- create sis_student here
create table sis_student(
	student_id integer primary key,
	first_name NVARCHAR2(50) not null,
	last_name NVARCHAR2(50) not null,
	status NVARCHAR2(2) not null check(status in ('A', 'AP', 'S', 'E')),
	status_date date not null,
	phone nchar(12) check (REGEXP_LIKE(phone, '^[0-9]{3}\.[0-9]{3}\.[0-9]{4}$')),
	email nchar(100) not null 
		unique 
		check (regexp_like(email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'))
);
 
-- create sis_course here
create table sis_course (
    course_code NCHAR(7),
    name NVARCHAR2(100) NOT NULL,
    num_of_credits NUMBER(2,1) NOT NULL
);

alter table sis_course
add constraint sis_course_pk primary key (course_code);

alter table sis_course
add constraint sis_course_code_ck
check (REGEXP_LIKE(course_code, '^[A-Z]{4}[0-9]{3}$'));

alter table sis_course
add constraint sis_course_num_of_credits_ck
check (num_of_credits > 0 AND num_of_credits < 10);

 
-- create sis_course_preq here
create table sis_course_preq (
    course_code NCHAR(7),
    pre_course_code NCHAR(7)
);

alter table sis_course_preq
add constraint sis_course_preq_pk primary key (course_code);

alter table sis_course_preq
add constraint sis_course_preq_course_code_fk
foreign key (course_code) references sis_course(course_code);

alter table sis_course_preq
add constraint sis_course_preq_pre_course_code_fk
foreign key (pre_course_code) references sis_course(course_code);

 
-- create sis_course_within_cred here
create table sis_course_within_cred(
	credential# integer,
	course_code nchar(7),
	type_flag number(1)
		constraint sis_course_within_cred_type_flag_ck check (type_flag in (0, 1)),
	constraint sis_course_within_cred_pk 
		primary key(credential#, course_code),
	constraint sis_course_within_cred_credential_fk 
		foreign key(credential#) references sis_credential(credential#),
	constraint sis_course_within_cred_course_code_fk
		foreign key(course_code) references sis_course(course_code)
);
 
-- create sis_schedule_course here
create table sis_schedule_course(
	course_registration# number(5),
	semester_code nchar(6),
	course_code nchar(7) not null,
	section_code nchar(1) not null
		constraint sis_schedule_course_section_code_ck 
		check (regexp_like(section_code, '[A-Z]{1}')),
	constraint sis_schedule_course_pk 
		primary key(course_registration#, semester_code),
	constraint sis_schedule_course_course_code_fk
		foreign key(course_code) references sis_course(course_code)
);
 
-- create sis_instructor_course here
create table sis_instructor_course(
	instructor_id integer,
	course_registration# number(5),
	semester_code nchar(6),
	constraint sis_instructor_course_pk 
		primary key(instructor_id, course_registration#, semester_code),
	constraint sis_instructor_course_instructor_id 
		foreign key (instructor_id) references sis_instructor(instructor_id),
	constraint sis_instructor_course_course_rgn_semester_code_fk 
		foreign key (course_registration#, semester_code) references sis_schedule_course(course_registration#, semester_code)
);
 
-- create sis_student_credential
create table sis_student_credential(
	student_id integer,
	credential# integer,
	start_date date not null,
	completion_date date,
	credential_status nchar(1) not null
		constraint sis_student_credential_cred_status_ck
		check(credential_status in ('A', 'G', 'E')),
	GPA number(3,2) not null check(GPA between 0 and 4.00),
	constraint sis_student_credential_pk primary key (student_id, credential#),
	constraint sis_student_credential_student_id_fk 
		foreign key (student_id) references sis_student(student_id),
	constraint sis_student_credential_cred_fk 
		foreign key (credential#) references sis_credential(credential#)
);
 
-- create sis_student_course_record
create table sis_student_course_record(
	course_registration# integer,
	semester_code nchar(10),
	course_code nchar(7) not null,
	student_id integer,
	credential# integer,
	letter_grade nchar(2)
		constraint sis_letter_grade_ck 
		check (letter_grade in ('A', 'A-', 'A+', 'B', 'B+', 'B-', 'C', 'C+', 'C-', 'D', 'D+', 'D-', 'F', 'I')),
	constraint sis_student_course_record_pk 
		primary key (course_registration#, semester_code, student_id),
	constraint sis_student_course_record_course_rgn_semester_fk 
		foreign key(course_registration#, semester_code) references sis_schedule_course(course_registration#, semester_code),
	constraint sis_student_curse_record_student_id_fk 
		foreign key(student_id) references sis_student(student_id),
	constraint sis_student_course_record_cred_fk 
		foreign key(credential#) references sis_credential(credential#)
);

-- create sis_student_credential_in_schedule_course
create table sis_student_credential_in_schedule_course(
	student_id integer,
	credential# integer,
	course_registration# nchar(5),
	semester_code nchar(6),
		constraint sis_student_cred_in_sched_course_pk 
			primary key (student_id, credential#, course_registration#, semester_code),
		constraint sis_student_credential_fk
			foreign key (student_id, credential#) references sis_student_credential(student_id, credential#),
		constraint sis_course_reg#_fk
			foreign key (course_registration#, semester_code) references sis_schedule_course(course_registration#,semester_code)
);
 
spool off