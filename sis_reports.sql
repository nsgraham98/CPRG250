-- Displays all students who are enrolled in classes taught by a particular teacher - displays student name, instructor name, and course
-- can likely be changed to an input query

select * from sis_instructor;
accept instructor_name char prompt 'Enter Instructor Name: '

column "Instructor" format A30
column "Student" format A30
column "Course" format A30
select unique 
    i.first_name || ' ' || i.last_name as "Instructor", 
    s.first_name || ' ' || s.last_name as "Student", 
    c.name as "Course"
from sis_instructor i
    join sis_instructor_course using (instructor_id) 
    join sis_schedule_course using (course_registration#)
    join sis_course c using (course_code)
    join sis_student_course_record using (course_registration#)
    join sis_student_credential using (student_id) 
    join sis_student s using (student_id)
where upper(i.first_name || ' ' || i.last_name) = UPPER('&instructor_name')
order by 3,2;

-- Displays all courses with pre-requisites, the pre-requisites themselves, and the total number of prereqs
Column "Base Course" format A40
column "Base" format A8
column "Pre-req" format A8
column "Pre-req Course" format A40
column "Preqs" format 99
select 
    main.course_code as "Base",
    case when
        main.name is null
            then lpad(N' Total:', 40, '-')
        else main.name
    end as "Base Course",
    count(preq.course_code) as "Preqs",
    preq.course_code as "Pre-req",
    preq.name as "Pre-req Course"
from
    sis_course_preq preqtb
join
    sis_course preq on preqtb.pre_course_code = preq.course_code
join
    sis_course main on main.course_code = preqtb.course_code
group by grouping sets(
    (main.course_code, main.name, preq.course_code, preq.name),
    main.course_code
    )
order by 1,3;

-- Displays all students, the courses they are enrolled in, and the amount of credits per course,
-- and the total amount of credits the student has
column "ID" format 999
Column "Name" format A40
column "Course" format A8
column "Course Name" format A40
column "Cred" format 999
SELECT unique
    s.student_id as "ID",
    s.first_name || ' ' || s.last_name as "Name", 
    c.course_code as "Course",
    case when 
        c.name is null then lpad(N' Total:',40, '-')
        else c.name
    end as "Course Name",
    sum(c.num_of_credits) as "Cred"
FROM sis_student s 
    JOIN sis_student_course_record cr on s.student_id = cr.student_id
    JOIN sis_schedule_course sc ON cr.course_code = sc.course_code
    JOIN sis_course c ON sc.course_code = c.course_code
GROUP BY grouping sets(
    (s.student_id, s.first_name || ' ' || s.last_name, c.course_code, c.name,
        sc.semester_code),
    (s.student_id, s.first_name || ' ' || s.last_name, 
        sc.semester_code)
    )
order by 1,2,3,4,5;
