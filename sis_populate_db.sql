-- Build Script for SIS DATABASE
-- Last Modified: Oct 24, 2024
-- Name: victoria Cheng
-- AI and populating data for instructor and credential - 0.5 hour
 
set echo ON
set linesize 132
set pagesize 66
spool "C:\cprg250s\sis-project-5\populate\sis_populate_db_1.txt"
-- act as sql expert in oracle 12c, i will post a full script, but please work step by step based on my instruction
-- posted full script from sis create table
-- instructed the AI to waiting for my instruction first before move forward
-- first, delete existing data from these table.

-- Delete data from child tables first then parent tables
DELETE FROM sis_student_course_record;
DELETE FROM sis_student_credential;
DELETE FROM sis_instructor_course;
DELETE FROM sis_schedule_course;
DELETE FROM sis_course_within_cred;
DELETE FROM sis_course_preq;

DELETE FROM sis_course;
DELETE FROM sis_student;
DELETE FROM sis_credential;
DELETE FROM sis_instructor;
 
-- insert data for sis_instructor here
-- recommended number of rows: 10
-- please create script for inserting 10 instructors data based on famous people in computer science related with a canada address. write in oracle sql 12c, you need to write insert command individually for each instructor
-- can you edit the script for updating postal code to "A1A 1A1"

INSERT INTO sis_instructor (instructor_id, first_name, last_name, address, city, prov, postal_code, phone_number, email)
VALUES (1, 'Tim', 'Berners-Lee', '123 Innovation Dr', 'Toronto', 'ON', 'A1A 1A1', '416.555.1234', 'tim.lee@webtech.com');

INSERT INTO sis_instructor (instructor_id, first_name, last_name, address, city, prov, postal_code, phone_number, email)
VALUES (2, 'Alan', 'Turing', '456 Logic Ln', 'Ottawa', 'ON', 'A1A 1A1', '613.555.5678', 'alan.turing@cryptotech.ca');

INSERT INTO sis_instructor (instructor_id, first_name, last_name, address, city, prov, postal_code, phone_number, email)
VALUES (3, 'Grace', 'Hopper', '789 Compiler Rd', 'Vancouver', 'BC', 'A1A 1A1', '604.555.2345', 'grace.hopper@navytech.ca');

INSERT INTO sis_instructor (instructor_id, first_name, last_name, address, city, prov, postal_code, phone_number, email)
VALUES (4, 'John', 'von Neumann', '101 Quantum St', 'Calgary', 'AB', 'A1A 1A1', '403.555.3456', 'john.neumann@mathetech.com');

INSERT INTO sis_instructor (instructor_id, first_name, last_name, address, city, prov, postal_code, phone_number, email)
VALUES (5, 'Ada', 'Lovelace', '202 Analytical Dr', 'Halifax', 'NS', 'A1A 1A1', '902.555.4567', 'ada.lovelace@programmingtech.ca');

INSERT INTO sis_instructor (instructor_id, first_name, last_name, address, city, prov, postal_code, phone_number, email)
VALUES (6, 'Donald', 'Knuth', '303 Algorithm Ave', 'Montreal', 'QC', 'A1A 1A1', '514.555.5678', 'donald.knuth@algotech.ca');

INSERT INTO sis_instructor (instructor_id, first_name, last_name, address, city, prov, postal_code, phone_number, email)
VALUES (7, 'Linus', 'Torvalds', '404 Kernel Rd', 'Winnipeg', 'MB', 'A1A 1A1', '204.555.6789', 'linus.torvalds@linuxtech.ca');

INSERT INTO sis_instructor (instructor_id, first_name, last_name, address, city, prov, postal_code, phone_number, email)
VALUES (8, 'Barbara', 'Liskov', '505 Abstraction Ln', 'Edmonton', 'AB', 'A1A 1A1', '780.555.7890', 'barbara.liskov@programmingtech.ca');

-- insert data for sis_credential here
-- recommended number of rows: 4
-- for sis_credential, please populating 4 rows of data based on Southern Alberta Institute of technology for school, name and credential. 
INSERT INTO sis_credential (credential#, school, name, type)
VALUES (1, 'Southern Alberta Institute of Technology', 'Computer Programming', 'D');

INSERT INTO sis_credential (credential#, school, name, type)
VALUES (2, 'Southern Alberta Institute of Technology', 'Information Technology', 'AD');

INSERT INTO sis_credential (credential#, school, name, type)
VALUES (3, 'Southern Alberta Institute of Technology', 'Software Development', 'CT');

INSERT INTO sis_credential (credential#, school, name, type)
VALUES (4, 'Southern Alberta Institute of Technology', 'Web Development', 'MI');


-- insert data for sis_student here
-- recommended number of rows: 5
-- Insert data for sis_student with 5 as recommended number of rows
INSERT INTO sis_student (student_id, first_name, last_name, status, status_date, phone, email)
VALUES (1, 'Alice', 'Johnson', 'A', DATE '2024-01-15', '403.555.0001', 'alice.johnson@student.sait.ca');

INSERT INTO sis_student (student_id, first_name, last_name, status, status_date, phone, email)
VALUES (2, 'Bob', 'Smith', 'AP', DATE '2024-02-20', '403.555.0002', 'bob.smith@student.sait.ca');

INSERT INTO sis_student (student_id, first_name, last_name, status, status_date, phone, email)
VALUES (3, 'Catherine', 'Li', 'S', DATE '2024-03-10', '403.555.0003', 'catherine.li@student.sait.ca');

INSERT INTO sis_student (student_id, first_name, last_name, status, status_date, phone, email)
VALUES (4, 'David', 'Brown', 'E', DATE '2024-04-05', '403.555.0004', 'david.brown@student.sait.ca');

INSERT INTO sis_student (student_id, first_name, last_name, status, status_date, phone, email)
VALUES (5, 'Emma', 'Garcia', 'A', DATE '2024-05-12', '403.555.0005', 'emma.garcia@student.sait.ca');

insert into sis_student (student_id, first_name, last_name, status, status_date, phone, email)
values (6, 'Frank', 'Hernandez', 'A', date '2024-06-18', '403.555.0006', 'frank.hernandez@student.sait.ca');

insert into sis_student (student_id, first_name, last_name, status, status_date, phone, email)
values (7, 'Grace', 'Kim', 'AP', date '2024-07-22', '403.555.0007', 'grace.kim@student.sait.ca');

insert into sis_student (student_id, first_name, last_name, status, status_date, phone, email)
values (8, 'Henry', 'Nguyen', 'S', date '2024-08-30', '403.555.0008', 'henry.nguyen@student.sait.ca');

insert into sis_student (student_id, first_name, last_name, status, status_date, phone, email)
values (9, 'Isabella', 'Martinez', 'E', date '2024-09-15', '403.555.0009', 'isabella.martinez@student.sait.ca');

insert into sis_student (student_id, first_name, last_name, status, status_date, phone, email)
values (10, 'Jack', 'Wilson', 'A', date '2024-10-05', '403.555.0010', 'jack.wilson@student.sait.ca');


-- insert data for sis_course here
-- recommended number of rows: 20
-- now insert 20 rows of data for sis_course based on computer science classes
INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES (N'COMP100', 'Introduction to Computer Science', 3.0);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES (N'COMP101', 'Programming Fundamentals', 3.0);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES (N'COMP102', 'Data Structures', 3.0);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES (N'COMP201', 'Web Development', 3.0);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES (N'COMP202', 'Database Management Systems', 3.0);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES (N'COMP203', 'Software Engineering', 4.0);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES (N'COMP204', 'Operating Systems', 4.0);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES (N'COMP301', 'Computer Networks', 3.0);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES (N'COMP302', 'Artificial Intelligence', 4.0);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES (N'COMP303', 'Machine Learning', 4.0);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES (N'COMP304', 'Human-Computer Interaction', 3.0);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES (N'COMP401', 'Mobile App Development', 3.0);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES (N'COMP402', 'Cloud Computing', 4.0);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES (N'COMP403', 'Cybersecurity', 4.0);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES (N'COMP404', 'Data Science', 4.0);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES (N'COMP501', 'Game Development', 3.0);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES (N'COMP502', 'Blockchain Technology', 4.0);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES (N'COMP503', 'DevOps Practices', 3.0);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES (N'COMP504', 'Advanced Programming', 4.0);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES (N'COMP505', 'Ethical Hacking', 4.0);


-- insert data for sis_course_preq here
-- certificates should have 2 to 3 coures, diplomas should have 5 coures
-- create required corses for 2 certificates and 2 diplomas

-- Certificate 1: Basic Web Development Certificate
-- Prerequisite: 'Introduction to Computer Science' for 'Web Development'
INSERT INTO sis_course_preq (course_code, pre_course_code)
VALUES (N'COMP201', N'COMP100');

-- Prerequisite: 'Programming Fundamentals' for 'Web Development'
INSERT INTO sis_course_preq (course_code, pre_course_code)
VALUES (N'COMP201', N'COMP101');

-- Certificate 2: Database Specialist Certificate
-- Prerequisite: 'Introduction to Computer Science' for 'Database Management Systems'
INSERT INTO sis_course_preq (course_code, pre_course_code)
VALUES (N'COMP202', N'COMP100');

-- Prerequisite: 'Programming Fundamentals' for 'Database Management Systems'
INSERT INTO sis_course_preq (course_code, pre_course_code)
VALUES (N'COMP202', N'COMP101');

-- Diploma 1: Software Development Diploma
-- Prerequisite: 'Introduction to Computer Science' for 'Software Engineering'
INSERT INTO sis_course_preq (course_code, pre_course_code)
VALUES (N'COMP203', N'COMP100');

-- Prerequisite: 'Programming Fundamentals' for 'Software Engineering'
INSERT INTO sis_course_preq (course_code, pre_course_code)
VALUES (N'COMP203', N'COMP101');

-- Prerequisite: 'Data Structures' for 'Software Engineering'
INSERT INTO sis_course_preq (course_code, pre_course_code)
VALUES (N'COMP203', N'COMP102');

-- Prerequisite: 'Operating Systems' for 'Software Engineering'
INSERT INTO sis_course_preq (course_code, pre_course_code)
VALUES (N'COMP203', N'COMP204');

-- Prerequisite: 'Database Management Systems' for 'Software Engineering'
INSERT INTO sis_course_preq (course_code, pre_course_code)
VALUES (N'COMP203', N'COMP202');

-- Diploma 2: Advanced Computer Science Diploma
-- Prerequisite: 'Introduction to Computer Science' for 'Artificial Intelligence'
INSERT INTO sis_course_preq (course_code, pre_course_code)
VALUES (N'COMP302', N'COMP100');

-- Prerequisite: 'Programming Fundamentals' for 'Artificial Intelligence'
INSERT INTO sis_course_preq (course_code, pre_course_code)
VALUES (N'COMP302', N'COMP101');

-- Prerequisite: 'Data Structures' for 'Artificial Intelligence'
INSERT INTO sis_course_preq (course_code, pre_course_code)
VALUES (N'COMP302', N'COMP102');

-- Prerequisite: 'Machine Learning' for 'Artificial Intelligence'
INSERT INTO sis_course_preq (course_code, pre_course_code)
VALUES (N'COMP302', N'COMP303');

-- Prerequisite: 'Computer Networks' for 'Artificial Intelligence'
INSERT INTO sis_course_preq (course_code, pre_course_code)
VALUES (N'COMP302', N'COMP301');


-- insert data for sis_course_within_cred here
-- Certificate 1: Basic Web Development Certificate (credential# 1)
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (1, N'COMP100', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (1, N'COMP101', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (1, N'COMP201', 1);

-- Certificate 2: Database Specialist Certificate (credential# 2)
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (2, N'COMP100', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (2, N'COMP101', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (2, N'COMP202', 1);

-- Diploma 1: Software Development Diploma (credential# 3)
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (3, N'COMP100', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (3, N'COMP101', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (3, N'COMP102', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (3, N'COMP203', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (3, N'COMP204', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (3, N'COMP301', 0);

-- Diploma 2: Advanced Computer Science Diploma (credential# 4)
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (4, N'COMP100', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (4, N'COMP101', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (4, N'COMP102', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (4, N'COMP302', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (4, N'COMP303', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (4, N'COMP304', 0);


-- insert data for sis_schedule_course here
-- Fall 2024 Semester (semester_code = '202402')
INSERT INTO sis_schedule_course (course_registration#, semester_code, course_code, section_code) VALUES (10001, N'202402', N'COMP100', N'A');
INSERT INTO sis_schedule_course (course_registration#, semester_code, course_code, section_code) VALUES (10002, N'202402', N'COMP101', N'A');
INSERT INTO sis_schedule_course (course_registration#, semester_code, course_code, section_code) VALUES (10003, N'202402', N'COMP102', N'B');
INSERT INTO sis_schedule_course (course_registration#, semester_code, course_code, section_code) VALUES (10004, N'202402', N'COMP201', N'A');
INSERT INTO sis_schedule_course (course_registration#, semester_code, course_code, section_code) VALUES (10005, N'202402', N'COMP202', N'B');
INSERT INTO sis_schedule_course (course_registration#, semester_code, course_code, section_code) VALUES (10006, N'202402', N'COMP301', N'A');

-- Winter 2025 Semester (semester_code = '202403')
INSERT INTO sis_schedule_course (course_registration#, semester_code, course_code, section_code) VALUES (20001, N'202403', N'COMP100', N'A');
INSERT INTO sis_schedule_course (course_registration#, semester_code, course_code, section_code) VALUES (20002, N'202403', N'COMP101', N'B');
INSERT INTO sis_schedule_course (course_registration#, semester_code, course_code, section_code) VALUES (20003, N'202403', N'COMP202', N'A');
INSERT INTO sis_schedule_course (course_registration#, semester_code, course_code, section_code) VALUES (20004, N'202403', N'COMP203', N'A');
INSERT INTO sis_schedule_course (course_registration#, semester_code, course_code, section_code) VALUES (20005, N'202403', N'COMP204', N'B');
INSERT INTO sis_schedule_course (course_registration#, semester_code, course_code, section_code) VALUES (20006, N'202403', N'COMP302', N'A');
INSERT INTO sis_schedule_course (course_registration#, semester_code, course_code, section_code) VALUES (20007, N'202403', N'COMP303', N'B');


-- Inserting data for sis_instructor_course
-- Assuming instructor_ids 1, 2, and 3 exist in sis_instructor
-- Fall 2024 Semester (semester_code = '202402')
INSERT INTO sis_instructor_course (instructor_id, course_registration#, semester_code) VALUES (1, 10001, N'202402');
INSERT INTO sis_instructor_course (instructor_id, course_registration#, semester_code) VALUES (1, 10002, N'202402');
INSERT INTO sis_instructor_course (instructor_id, course_registration#, semester_code) VALUES (2, 10003, N'202402');
INSERT INTO sis_instructor_course (instructor_id, course_registration#, semester_code) VALUES (2, 10004, N'202402');
INSERT INTO sis_instructor_course (instructor_id, course_registration#, semester_code) VALUES (3, 10005, N'202402');
INSERT INTO sis_instructor_course (instructor_id, course_registration#, semester_code) VALUES (3, 10006, N'202402');

-- Winter 2025 Semester (semester_code = '202403')
INSERT INTO sis_instructor_course (instructor_id, course_registration#, semester_code) VALUES (1, 20001, N'202403');
INSERT INTO sis_instructor_course (instructor_id, course_registration#, semester_code) VALUES (1, 20002, N'202403');
INSERT INTO sis_instructor_course (instructor_id, course_registration#, semester_code) VALUES (2, 20003, N'202403');
INSERT INTO sis_instructor_course (instructor_id, course_registration#, semester_code) VALUES (2, 20004, N'202403');
INSERT INTO sis_instructor_course (instructor_id, course_registration#, semester_code) VALUES (3, 20005, N'202403');
INSERT INTO sis_instructor_course (instructor_id, course_registration#, semester_code) VALUES (3, 20006, N'202403');
INSERT INTO sis_instructor_course (instructor_id, course_registration#, semester_code) VALUES (1, 20007, N'202403');

-- insert data for sis_student_credential
-- 2 students with 1 credential and 1 student with 2 credential

INSERT INTO sis_student_credential (student_id, credential#, start_date, completion_date, credential_status, GPA) 
VALUES (1, 1, DATE '2024-01-10', DATE '2024-12-10', N'A', 3.75);

INSERT INTO sis_student_credential (student_id, credential#, start_date, completion_date, credential_status, GPA) 
VALUES (2, 2, DATE '2024-02-01', NULL, N'G', 3.50);

INSERT INTO sis_student_credential (student_id, credential#, start_date, completion_date, credential_status, GPA) 
VALUES (3, 1, DATE '2024-03-01', DATE '2024-06-01', N'A', 3.90);

INSERT INTO sis_student_credential (student_id, credential#, start_date, completion_date, credential_status, GPA) 
VALUES (3, 2, DATE '2024-03-01', NULL, N'E', 2.80);

INSERT INTO sis_student_credential (student_id, credential#, start_date, completion_date, credential_status, GPA) 
VALUES (4, 1, DATE '2024-04-01', DATE '2024-12-15', N'A', 3.65);

INSERT INTO sis_student_credential (student_id, credential#, start_date, completion_date, credential_status, GPA) 
VALUES (5, 2, DATE '2024-05-01', NULL, N'G', 3.30);

INSERT INTO sis_student_credential (student_id, credential#, start_date, completion_date, credential_status, GPA) 
VALUES (6, 1, DATE '2024-06-01', DATE '2024-12-20', N'A', 3.85);

INSERT INTO sis_student_credential (student_id, credential#, start_date, completion_date, credential_status, GPA) 
VALUES (7, 1, DATE '2024-07-01', DATE '2024-11-30', N'A', 3.92);

INSERT INTO sis_student_credential (student_id, credential#, start_date, completion_date, credential_status, GPA) 
VALUES (7, 2, DATE '2024-07-01', NULL, N'G', 3.60);

INSERT INTO sis_student_credential (student_id, credential#, start_date, completion_date, credential_status, GPA) 
VALUES (8, 1, DATE '2024-08-01', DATE '2024-12-25', N'A', 3.77);

INSERT INTO sis_student_credential (student_id, credential#, start_date, completion_date, credential_status, GPA) 
VALUES (9, 1, DATE '2024-09-01', DATE '2024-12-30', N'A', 3.91);

INSERT INTO sis_student_credential (student_id, credential#, start_date, completion_date, credential_status, GPA) 
VALUES (10, 2, DATE '2024-10-01', NULL, N'E', 2.65);



-- insert data for sis_student_course_record
-- recommended number of rows: 5
-- Fall 2024 Semester (semester_code = '202402')
insert into sis_student_course_record (course_registration#, semester_code, course_code, student_id, credential#, letter_grade)
values (10001, n'202402', n'COMP100', 1, 1, 'A');

insert into sis_student_course_record (course_registration#, semester_code, course_code, student_id, credential#, letter_grade)
values (10002, n'202402', n'COMP101', 2, 2, 'B+');

insert into sis_student_course_record (course_registration#, semester_code, course_code, student_id, credential#, letter_grade)
values (10003, n'202402', n'COMP102', 3, 1, 'A-');

insert into sis_student_course_record (course_registration#, semester_code, course_code, student_id, credential#, letter_grade)
values (10004, n'202402', n'COMP201', 4, 2, 'B');

insert into sis_student_course_record (course_registration#, semester_code, course_code, student_id, credential#, letter_grade)
values (10005, n'202402', n'COMP202', 5, 1, 'B-');

insert into sis_student_course_record (course_registration#, semester_code, course_code, student_id, credential#, letter_grade)
values (10001, '202402', 'COMP100', 6, 1, 'B');

insert into sis_student_course_record (course_registration#, semester_code, course_code, student_id, credential#, letter_grade)
values (10002, '202402', 'COMP101', 6, 1, 'A-');

insert into sis_student_course_record (course_registration#, semester_code, course_code, student_id, credential#, letter_grade)
values (10003, '202402', 'COMP102', 7, 2, 'B+');

insert into sis_student_course_record (course_registration#, semester_code, course_code, student_id, credential#, letter_grade)
values (10004, '202402', 'COMP201', 7, 2, 'A');

insert into sis_student_course_record (course_registration#, semester_code, course_code, student_id, credential#, letter_grade)
values (20001, '202403', 'COMP100', 8, 1, 'C');

insert into sis_student_course_record (course_registration#, semester_code, course_code, student_id, credential#, letter_grade)
values (20002, '202403', 'COMP202', 8, 1, 'B-');

insert into sis_student_course_record (course_registration#, semester_code, course_code, student_id, credential#, letter_grade)
values (20003, '202403', 'COMP203', 9, 2, 'A');

insert into sis_student_course_record (course_registration#, semester_code, course_code, student_id, credential#, letter_grade)
values (20004, '202403', 'COMP204', 9, 2, 'B+');

insert into sis_student_course_record (course_registration#, semester_code, course_code, student_id, credential#, letter_grade)
values (20005, '202403', 'COMP302', 10, 1, 'A');

insert into sis_student_course_record (course_registration#, semester_code, course_code, student_id, credential#, letter_grade)
values (20006, '202403', 'COMP303', 10, 1, 'B');


spool off