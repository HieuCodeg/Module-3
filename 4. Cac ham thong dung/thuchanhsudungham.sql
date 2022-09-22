use quanlysinhvien;
select address, count(StudentID) as 'So luong hoc vien'
from student
group by address;

select S.StudentId, S.StudentName, avg(Mark)
from student S join mark M on S.StudentId = M.StudentId
group by S.StudentId, S.StudentName;

select S.StudentId, S.StudentName, avg(Mark)
from student S join mark M on S.StudentId = M.StudentId
group by S.StudentId, S.StudentName
having AVG(Mark) > 5;

select S.StudentId, S.StudentName, avg(Mark)
from student S join mark M on S.StudentId = M.StudentId
group by S.StudentId, S.StudentName
having AVG(Mark) >= All (select AVG(Mark) from Mark group by Mark.StudentId);