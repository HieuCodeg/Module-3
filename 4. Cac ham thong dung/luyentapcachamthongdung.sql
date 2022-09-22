use quanlysinhvien;
select *
from subject
where  Credit = (select max(Credit) from subject);

select *
from subject 
where SubId = ( select SubId from mark 
where mark = (select max(Mark) from mark));

select student.StudentId, StudentName, address, phone, status, ClassId, avg(mark) as average
from student inner join mark
on student.StudentId = mark.StudentId
group by student.StudentId
order by average desc;

