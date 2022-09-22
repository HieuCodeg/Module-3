use quanlybanhang;
insert into customer
values(1, 'Minh Quan', 10),
	(2, 'Ngoc Oanh', 20),
    (3, 'Hong Ha', 50);
    
insert into oder(oID, cID, oDate)
values(1,1,'2006-3-21'),
	(2,2,'2006-3-23'),
	(3,1,'2006-3-16');
    
insert into product
values(1,'May Giat', 3),
	(2,'Tu Lanh', 5),
    (3,'Dieu Hoa', 7),
    (4,'Quat', 1),
    (5,'Bep dien', 2);

insert into orderDetail
values(1,1,3),
	(1,3,7),
    (1,4,2),
    (2,1,1),
    (3,1,8),
    (2,5,4),
    (2,3,3);
    
select oID, ODate, OtotalPrice from oder;

select DISTINCT customer.cID, cName, cAge , product.pName
from ((orderdetail inner join oder on orderdetail.oID = oder.oID)
inner join product on orderdetail.pID  = product.pID) 
inner join customer on oder.cID = customer.cID;

select customer.cID, cName, cAge
from customer
where customer.cID not in 
(select customer.cID 
from (customer inner join oder on 
customer.cID = oder.cID));

select oder.oID, oder.oDate,sum((orderdetail.odQTY * product.pPrice)) as Price
from ((orderdetail inner join product on orderdetail.pID = product.pID)
inner join oder on  orderdetail.oID = oder.oID)
group by oder.oID;
