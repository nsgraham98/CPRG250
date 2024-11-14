-- help me populate this sql oracle 12c database, i will give instructions next message. here is all the tables (given tables)

-- =================================================================

--add 10 instructors using simpsons characters, using canadian addresses, cities, and provinces. please follow the formatting in sis_instructors

--add the insert into line between every entry


INSERT INTO sis_instructor (instructor_id, first_name, last_name, address, city, prov, postal_code, phone_number, email) VALUES 
(1, 'Homer', 'Simpson', '742 Evergreen Terrace', 'Springfield', 'AB', 'A1B 2C3', '123.456.7890', 'homer.simpson@example.com');

INSERT INTO sis_instructor (instructor_id, first_name, last_name, address, city, prov, postal_code, phone_number, email) VALUES 
(2, 'Marge', 'Simpson', '742 Evergreen Terrace', 'Springfield', 'BC', 'A1B 2C4', '123.456.7891', 'marge.simpson@example.com');

INSERT INTO sis_instructor (instructor_id, first_name, last_name, address, city, prov, postal_code, phone_number, email) VALUES 
(3, 'Bart', 'Simpson', '742 Evergreen Terrace', 'Springfield', 'MB', 'A1B 2C5', '123.456.7892', 'bart.simpson@example.com');

INSERT INTO sis_instructor (instructor_id, first_name, last_name, address, city, prov, postal_code, phone_number, email) VALUES 
(4, 'Lisa', 'Simpson', '742 Evergreen Terrace', 'Springfield', 'NB', 'A1B 2C6', '123.456.7893', 'lisa.simpson@example.com');

INSERT INTO sis_instructor (instructor_id, first_name, last_name, address, city, prov, postal_code, phone_number, email) VALUES 
(5, 'Maggie', 'Simpson', '742 Evergreen Terrace', 'Springfield', 'NL', 'A1B 2C7', '123.456.7894', 'maggie.simpson@example.com');

INSERT INTO sis_instructor (instructor_id, first_name, last_name, address, city, prov, postal_code, phone_number, email) VALUES 
(6, 'Mr.', 'Burns', '1 Burns Manor', 'Springfield', 'NS', 'A1B 2C8', '123.456.7895', 'mr.burns@example.com');

INSERT INTO sis_instructor (instructor_id, first_name, last_name, address, city, prov, postal_code, phone_number, email) VALUES 
(7, 'Waylon', 'Smithers', '1 Burns Manor', 'Springfield', 'NT', 'A1B 2C9', '123.456.7896', 'smithers@example.com');

INSERT INTO sis_instructor (instructor_id, first_name, last_name, address, city, prov, postal_code, phone_number, email) VALUES 
(8, 'Apu', 'Nahasapeemapetilon', '2 Convenient Store', 'Springfield', 'NU', 'A1B 2D1', '123.456.7897', 'apu@example.com');

INSERT INTO sis_instructor (instructor_id, first_name, last_name, address, city, prov, postal_code, phone_number, email) VALUES 
(9, 'Seymour', 'Skinner', '3 Springfield Elementary', 'Springfield', 'ON', 'A1B 2D2', '123.456.7898', 'seymour.skinner@example.com');

INSERT INTO sis_instructor (instructor_id, first_name, last_name, address, city, prov, postal_code, phone_number, email) VALUES 
(10, 'Edna', 'Krabappel', '3 Springfield Elementary', 'Springfield', 'PE', 'A1B 2D3', '123.456.7899', 'edna.krabappel@example.com');


-- add 4 entries to sis_credential, based on SAIT for the school

INSERT INTO sis_credential (credential#, school, name, type) VALUES 
(1, 'Southern Alberta Institute of Technology', 'Diploma in Applied Technology', 'AD');

INSERT INTO sis_credential (credential#, school, name, type) VALUES 
(2, 'Southern Alberta Institute of Technology', 'Certificate in Business Administration', 'CT');

INSERT INTO sis_credential (credential#, school, name, type) VALUES 
(3, 'Southern Alberta Institute of Technology', 'Advanced Diploma in Networking', 'AD');

INSERT INTO sis_credential (credential#, school, name, type) VALUES 
(4, 'Southern Alberta Institute of Technology', 'Professional Development in Cybersecurity', 'PD');



-- sis_student
INSERT INTO sis_student (student_id, first_name, last_name, status, status_date, phone, email) 
VALUES 
(1, 'Marty', 'McFly', 'A', DATE '2024-04-01', '123.456.7890', 'marty.mcfly@example.com');

INSERT INTO sis_student (student_id, first_name, last_name, status, status_date, phone, email) 
VALUES 
(2, 'Ferris', 'Bueller', 'A', DATE '2024-04-02', '234.567.8901', 'ferris.bueller@example.com');

INSERT INTO sis_student (student_id, first_name, last_name, status, status_date, phone, email) 
VALUES 
(3, 'Elliott', 'Taylor', 'AP', DATE '2024-04-03', '345.678.9012', 'elliott.taylor@example.com');

INSERT INTO sis_student (student_id, first_name, last_name, status, status_date, phone, email) 
VALUES 
(4, 'Ally', 'Sheedy', 'S', DATE '2024-04-04', '456.789.0123', 'ally.sheedy@example.com');

INSERT INTO sis_student (student_id, first_name, last_name, status, status_date, phone, email) 
VALUES 
(5, 'Daniel', 'LaRusso', 'E', DATE '2024-04-05', '567.890.1234', 'daniel.larusso@example.com');



-- sis_course
INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES
('COMP101', 'Introduction to Programming', 3);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES
('COMP102', 'Data Structures and Algorithms', 3);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES
('COMP201', 'Web Development Fundamentals', 4);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES
('COMP202', 'Database Management Systems', 4);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES
('COMP301', 'Software Engineering Principles', 4);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES
('COMP302', 'Mobile Application Development', 3);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES
('COMP401', 'Object-Oriented Programming', 3);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES
('COMP402', 'User Interface Design', 3);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES
('COMP403', 'Full Stack Development', 4);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES
('COMP404', 'Software Testing and Quality Assurance', 3);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES
('COMP405', 'Cloud Computing Fundamentals', 3);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES
('COMP406', 'Agile Software Development', 3);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES
('COMP407', 'DevOps Practices', 3);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES
('COMP408', 'Cybersecurity Basics', 3);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES
('COMP409', 'Machine Learning Basics', 4);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES
('COMP410', 'Game Development Essentials', 3);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES
('COMP411', 'Systems Analysis and Design', 4);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES
('COMP412', 'Internet of Things (IoT) Development', 3);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES
('COMP413', 'Artificial Intelligence Principles', 4);

INSERT INTO sis_course (course_code, name, num_of_credits)
VALUES
('COMP414', 'Big Data Technologies', 4);


--sis_course_within_cred

INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (1, N'COMP100', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (1, N'COMP101', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (1, N'COMP102', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (1, N'COMP201', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (1, N'COMP202', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (1, N'COMP301', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (1, N'COMP302', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (1, N'COMP401', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (1, N'COMP402', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (1, N'COMP403', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (1, N'COMP404', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (1, N'COMP405', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (1, N'COMP406', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (1, N'COMP407', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (1, N'COMP408', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (1, N'COMP409', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (1, N'COMP410', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (1, N'COMP411', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (1, N'COMP412', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (1, N'COMP413', 1);
INSERT INTO sis_course_within_cred (credential#, course_code, type_flag) VALUES (1, N'COMP414', 1);


-- sis_schedule_course
INSERT INTO sis_schedule_course (course_registration#, semester_code, course_code, section_code) VALUES (10001, N'202402', N'COMP100', N'A');
INSERT INTO sis_schedule_course (course_registration#, semester_code, course_code, section_code) VALUES (10002, N'202402', N'COMP101', N'A');
INSERT INTO sis_schedule_course (course_registration#, semester_code, course_code, section_code) VALUES (10003, N'202402', N'COMP102', N'A');
INSERT INTO sis_schedule_course (course_registration#, semester_code, course_code, section_code) VALUES (10004, N'202402', N'COMP201', N'A');
INSERT INTO sis_schedule_course (course_registration#, semester_code, course_code, section_code) VALUES (10005, N'202402', N'COMP202', N'A');
INSERT INTO sis_schedule_course (course_registration#, semester_code, course_code, section_code) VALUES (10006, N'202402', N'COMP301', N'A');
INSERT INTO sis_schedule_course (course_registration#, semester_code, course_code, section_code) VALUES (20001, N'202403', N'COMP302', N'A');
INSERT INTO sis_schedule_course (course_registration#, semester_code, course_code, section_code) VALUES (20002, N'202403', N'COMP401', N'A');
INSERT INTO sis_schedule_course (course_registration#, semester_code, course_code, section_code) VALUES (20003, N'202403', N'COMP402', N'A');
INSERT INTO sis_schedule_course (course_registration#, semester_code, course_code, section_code) VALUES (20004, N'202403', N'COMP403', N'A');
INSERT INTO sis_schedule_course (course_registration#, semester_code, course_code, section_code) VALUES (20005, N'202403', N'COMP404', N'A');
INSERT INTO sis_schedule_course (course_registration#, semester_code, course_code, section_code) VALUES (20006, N'202403', N'COMP405', N'A');






--sis_instructor_course

INSERT INTO sis_instructor_course (instructor_id, course_registration#, semester_code) VALUES (1, 10001, N'202402');
INSERT INTO sis_instructor_course (instructor_id, course_registration#, semester_code) VALUES (1, 10002, N'202402');
INSERT INTO sis_instructor_course (instructor_id, course_registration#, semester_code) VALUES (1, 20001, N'202403');
INSERT INTO sis_instructor_course (instructor_id, course_registration#, semester_code) VALUES (2, 10003, N'202402');
INSERT INTO sis_instructor_course (instructor_id, course_registration#, semester_code) VALUES (2, 10004, N'202402');
INSERT INTO sis_instructor_course (instructor_id, course_registration#, semester_code) VALUES (2, 20002, N'202403');
INSERT INTO sis_instructor_course (instructor_id, course_registration#, semester_code) VALUES (3, 10005, N'202402');
INSERT INTO sis_instructor_course (instructor_id, course_registration#, semester_code) VALUES (3, 10006, N'202402');
INSERT INTO sis_instructor_course (instructor_id, course_registration#, semester_code) VALUES (3, 20003, N'202403');

-- sis_student_credential
INSERT INTO sis_student_credential (student_id, credential#, start_date, completion_date, credential_status, GPA) VALUES (1, 1, DATE '2023-01-10', DATE '2024-01-10', N'A', 3.8);
INSERT INTO sis_student_credential (student_id, credential#, start_date, completion_date, credential_status, GPA) VALUES (1, 2, DATE '2023-01-10', NULL, N'A', 3.8);
INSERT INTO sis_student_credential (student_id, credential#, start_date, completion_date, credential_status, GPA) VALUES (2, 2, DATE '2023-02-15', DATE '2024-02-15', N'G', 2.9);
INSERT INTO sis_student_credential (student_id, credential#, start_date, completion_date, credential_status, GPA) VALUES (3, 3, DATE '2023-03-20', DATE '2024-03-20', N'E', 2.0);
INSERT INTO sis_student_credential (student_id, credential#, start_date, completion_date, credential_status, GPA) VALUES (4, 4, DATE '2023-04-25', DATE '2024-04-25', N'A', 3.5);
INSERT INTO sis_student_credential (student_id, credential#, start_date, completion_date, credential_status, GPA) VALUES (5, 1, DATE '2023-05-30', NULL, N'A', 3.7);



-- sis_student_course_record
INSERT INTO sis_student_course_record (course_registration#, semester_code, course_code, student_id, credential#, letter_grade) VALUES ('10001', '202402', 'COMP100', 1, 1, 'A');
INSERT INTO sis_student_course_record (course_registration#, semester_code, course_code, student_id, credential#, letter_grade) VALUES ('10002', '202402', 'COMP101', 1, 1, 'B');
INSERT INTO sis_student_course_record (course_registration#, semester_code, course_code, student_id, credential#, letter_grade) VALUES ('10003', '202402', 'COMP102', 2, 2, 'C');
INSERT INTO sis_student_course_record (course_registration#, semester_code, course_code, student_id, credential#, letter_grade) VALUES ('10004', '202402', 'COMP201', 3, 3, 'A');
INSERT INTO sis_student_course_record (course_registration#, semester_code, course_code, student_id, credential#, letter_grade) VALUES ('20001', '202403', 'COMP301', 4, 4, 'B');
INSERT INTO sis_student_course_record (course_registration#, semester_code, course_code, student_id, credential#, letter_grade) VALUES ('20002', '202403', 'COMP401', 5, 1, 'A');
INSERT INTO sis_student_course_record (course_registration#, semester_code, course_code, student_id, credential#, letter_grade) VALUES ('20003', '202403', 'COMP402', 1, 2, 'B+');
INSERT INTO sis_student_course_record (course_registration#, semester_code, course_code, student_id, credential#, letter_grade) VALUES ('20004', '202403', 'COMP403', 2, 3, 'C-');
INSERT INTO sis_student_course_record (course_registration#, semester_code, course_code, student_id, credential#, letter_grade) VALUES ('20005', '202403', 'COMP404', 3, 4, 'D');


