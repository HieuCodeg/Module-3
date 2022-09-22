use quanlysinhvien;
select * 
from student
where StudentName like 'h%';

select * 
from class
where month(startdate) = 12;

select * 
from subject
where credit between 3 and 5;

update student
set classId = 2
where StudentName = 'Hung';

select s.StudentName, sub.SubName, m.Mark
from student s, subject sub, mark m
order by mark desc, studentName asc;
