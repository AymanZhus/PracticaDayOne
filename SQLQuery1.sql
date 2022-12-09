--Запрос №1
use Education;
select * from subject;

--Запрос №2
select * from institute;

--Запрос №3
select stipendia from student GROUP BY stipendia;

--Запрос 4
select course from student GROUP BY course;

-- Запрос 5
select family, name, last_name, birthday from student ORDER BY family ASC, name ASC, last_name ASC, birthday ASC;

-- Запрос 6
select family,course, birthday from student ORDER BY course ASC, birthday DESC;

-- Запрос 7
select lect_id, family, name, last_name from lecturer;

-- Запрос 8
select family, name, last_name, stipendia from student WHERE stipendia != 0 ORDER BY family ASC, stipendia DESC;

-- Запрос 9
select * from student WHERE course = 1 ORDER BY family ASC;

-- Запрос 10
select * from student WHERE course IN (2, 3) ORDER BY family ASC;

-- Запрос 11
select * from student WHERE course NOT IN (1,3);
select * from student WHERE course = 2 or course > 3;

-- Запрос 12
select DISTINCT subj_name,subj_id,mark from subject,exam WHERE mark=5;

-- Запрос 13
select DISTINCT subj_name,hour,mark from subject,knowledge,exam,nagruzka 
WHERE (subject.subj_id=knowledge.subj_id AND knowledge.kvant_id = nagruzka.kvant_id AND nagruzka.nagr_id = exam.nagr_id) AND mark=2;

-- Запрсос 14
select DISTINCT family,town.town_name, mark 
from exam,town,knowledge,student,parents, nagruzka, subject 
WHERE (student.student_id = parents.parent_id AND town.town_id = parents.town_id)
and town_name = 'Березовский'and student.student_id = exam.student_id and mark > 2 and exam.nagr_id = nagruzka.nagr_id and nagruzka.kvant_id = knowledge.kvant_id and knowledge.subj_id = subject.subj_id and subject.subj_id = 1;

-- Запрос 15
select DISTINCT family, mark, subj_name from student
join exam on exam.student_id = student.student_id
join nagruzka on nagruzka.nagr_id = exam.nagr_id
join knowledge on knowledge.kvant_id = nagruzka.kvant_id
join subject on subject.subj_id = knowledge.subj_id
WHERE mark > 2
ORDER BY family ASC, mark DESC, subj_name ASC;

-- Запрос 16
select DISTINCT family, mark, subj_name from student
join exam on exam.student_id = student.student_id
join nagruzka on nagruzka.nagr_id = exam.nagr_id
join knowledge on knowledge.kvant_id = nagruzka.kvant_id
join subject on subject.subj_id = knowledge.subj_id
WHERE mark = 2 AND subject.subj_id = 1
ORDER BY family ASC;

-- Запрос 17
select DISTINCT family,town_name from student
join medalist on student.student_id = medalist.student_id
join parents on parents.student_id = student.student_id
join town on town.town_id = parents.town_id 
join eduinst on eduinst.eduinst_id = parents.eduinst_id
join medali on medalist.medal_id = medali.medal_id
WHERE name_medal = 'золотая'
ORDER BY family ASC;

-- Запрос 18
select DISTINCT family, mark, subj_name, exam_date from student
join exam on exam.student_id = student.student_id
join nagruzka on nagruzka.nagr_id = exam.nagr_id
join knowledge on knowledge.kvant_id = nagruzka.kvant_id
join subject on subject.subj_id = knowledge.subj_id
WHERE mark = 2
ORDER BY family ASC, subj_name ASC;

---- Запрос 19
select DISTINCT family, mark, subj_name, exam_date from student
join exam on exam.student_id = student.student_id
join nagruzka on nagruzka.nagr_id = exam.nagr_id
join knowledge on knowledge.kvant_id = nagruzka.kvant_id
join subject on subject.subj_id = knowledge.subj_id
WHERE exam_date IN ('24.05.2019', '13.06.2019') and mark = 2
ORDER BY family ASC, subj_name ASC;

-- Запрос 20
select DISTINCT student.family,mark,exam_date,subj_name,lecturer.family from student
join exam on exam.student_id = student.student_id
join nagruzka on nagruzka.nagr_id = exam.nagr_id
join knowledge on knowledge.kvant_id = nagruzka.kvant_id
join subject on subject.subj_id = knowledge.subj_id
join lecturer on lecturer.lect_id = nagruzka.lect_id
WHERE mark = 5

-- Запрос 21
SELECT DISTINCT institute.inst_name,knowledge.hour
FROM institute, lecturer, nagruzka, knowledge, exam
WHERE mark = 2 AND (institute.inst_id = lecturer.inst_id
AND lecturer.lect_id = nagruzka.lect_id
AND nagruzka.kvant_id = knowledge.kvant_id
AND nagruzka.nagr_id = exam.nagr_id)
AND hour >= 80
GROUP BY institute.inst_name,knowledge.hour;


select * from town;
select * from parents;
select * from subject;
select * from student;
select * from knowledge;
select * from exam;
select * from medalist;