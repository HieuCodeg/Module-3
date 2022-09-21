use Quanlysinhvien;
select *
from student;

select *
from student
where Status = true;

select *
from subject
where Credit <10;

select S.StudentId, S.StudentName, C.ClassName
from student S join Class C 
on S.classId = c.ClassID
where C.ClassName = 'A1';

SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId
WHERE Sub.SubName = 'CF';