use demo;
drop table if exists `Products`;
create table Products(
Id int auto_increment primary key,
productCode  varchar(15),
productName varchar(50),
productPrice int,
productAmount int,
productDescription text,
productStatus int);

insert into products(productCode, productName, productPrice, productAmount, productDescription, productStatus)
values('SP_01','May giat', 5000,20,'Hang CLC', 1),
('SP_02','Ti vi', 7000,20,'Hang nhap khau', 1),
('SP_03','Tu lanh', 9000,20,'Hang noi dia', 0),
('SP_04','Laptop', 125000,20,'Hang nhai', 0),
('SP_05','Dieu hoa', 8000,20,'Hang CLT', 1);

alter table products add unique idx_productCode(productCode);
EXPLAIN SELECT * FROM products WHERE productCode = 'SP_05'; 

alter table products add index idx_product(productName, productPrice);
EXPLAIN SELECT * FROM products WHERE productName = 'Laptop' or productPrice = 8000;

create view product_view as
select productCode, productName, productPrice, productStatus
from products;

select * from product_view;

create or replace view product_view as
select productCode, productName, productPrice, productStatus
from products
where productName = 'Dieu hoa';

drop view product_view;

delimiter //
create procedure getAllProduct()
begin
	select * from products;
end //
delimiter ;

call getAllProduct();

delimiter //
create procedure addProduct(
in pCode  varchar(15),
in pName varchar(50),
in pPrice int,
in pAmount int,
in pDescription text,
in pStatus int)
begin
	insert into products(productCode, productName, productPrice, productAmount, productDescription, productStatus)
values(pCode,pName, pPrice,pAmount,pDescription, pStatus);
end //
delimiter ;

call addProduct('SP_06', 'Dien thoai', 30000, 39, 'Dien thoai TQ', 1);
select * from products;

delimiter //
create procedure editProduct(
in pid int,
in pCode  varchar(15),
in pName varchar(50),
in pPrice int,
in pAmount int,
in pDescription text,
in pStatus int)
begin
update products
set productCode = pCode,
productName = pName,
 productPrice = pPrice, 
 productAmount = pAmount, 
 productDescription = pDescription, 
 productStatus = pStatus
where id = pid;
end //
delimiter ;

call editProduct(6,'SP_07','May ui',30000,30,'Hang dom',0);

delimiter //
create procedure deleteProduct(in pid int)
begin
	delete from products
    where id = pid;
end //
delimiter ;
call deleteProduct(7);