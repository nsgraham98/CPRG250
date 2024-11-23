-- Displays all students who are enrolled in classes taught by a particular teacher - displays student name, instructor name, and course
-- can likely be changed to an input query
column "Instructor FName" format A15
column "Instructor LName" format A15
column "Student FName" format A15
column "Student LName" format A15
column "Course" format A20
select unique 
    i.first_name as "Instructor FName", i.last_name as "Instructor LName", s.first_name as "Student FName", s.last_name as "Student LName", c.name as "Course"
from sis_instructor i
    join sis_instructor_course using (instructor_id) 
    join sis_schedule_course using (course_registration#)
    join sis_course c using (course_code)
    join sis_student_course_record using (course_registration#)
    join sis_student_credential using (student_id) 
    join sis_student s using (student_id)
where i.last_name = 'Turing';

-- Displays all courses with pre-requisites, the pre-requisites themselves, and the total number of prereqs
Column "Base Course Name" format A40
column "Base" format A8
column "Pre-req" format A8
column "Pre-req Course Name" format A40
SELECT
    preq.course_code "Base",
    --base.name AS "Base Course Name",
        CASE
            when pre_course.name IS NULL 
                AND preq.pre_course_code IS NULL 
                AND base.name IS NOT NULL 
                AND preq.course_code IS NOT NULL 
            THEN base.name || ' Total:'
            ELSE base.name
        END AS "Base Course Name",
    count(preq.pre_course_code) "# of Pre-reqs",
    preq.pre_course_code AS "Pre-req",
    pre_course.name AS "Pre-req Course Name"
FROM sis_course_preq preq
    JOIN sis_course base ON base.course_code = preq.course_code
    JOIN sis_course pre_course ON pre_course.course_code = preq.pre_course_code
GROUP BY ROLLUP (preq.course_code, base.name, preq.pre_course_code, pre_course.name)
    HAVING (pre_course.name IS NOT NULL AND preq.pre_course_code IS NOT NULL AND base.name IS NOT NULL)
    OR (pre_course.name IS NULL AND preq.pre_course_code IS NULL AND base.name IS NOT NULL AND preq.course_code IS NOT NULL)
order by 1;

-- Displays all students, the courses they are enrolled in, and the amount of credits per course
Column "First Name" format A15
column "Last Name" format A15
column "Course" format A8
column "Course Name" format A40
SELECT 
    s.first_name "First Name", 
    s.last_name "Last Name", 
    c.course_code "Course",
    c.name "Course Name",
    c.num_of_credits "Credits"
FROM sis_student s 
    JOIN sis_student_course_record cr USING (student_id)
    JOIN sis_schedule_course sc ON cr.course_code = sc.course_code
    JOIN sis_course c ON sc.course_code = c.course_code
order by 2, 1, 3, 4, 5;


select sis_student.student_id,
    sis_student_course_record.course_code
from sis_student join sis_student_course_record on sis_student.student_id = sis_student_course_record.student_id;

select sis_schedule_course.course_code,
    sis_student_course_record.student_id,
    sis_student.last_name
from sis_schedule_course join sis_student_course_record on sis_schedule_course.course_code = sis_student_course_record.course_code
    join sis_student on sis_student.student_id = sis_student_course_record.student_id;
