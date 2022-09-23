delimiter //
create procedure getCusById(IN cusNum INT(11))
begin
	select * from customers where customerNumber = cusNum;
end //
delimiter ;

call getCusById(175);

delimiter //
create procedure getCustomersCountByCity(
	in in_city varchar(50),
    out total int
)
begin
	select count(customerNumber) into total
    from customers
    where city = in_city;
end//
delimiter ;

CALL GetCustomersCountByCity('Lyon',@total);
SELECT @total;

delimiter //
create procedure setCounter(
	inout counter int,
	in inc int
)
begin
	set counter = counter + inc;
end //
delimiter ;

SET @counter = 1;

CALL SetCounter(@counter,1); -- 2

CALL SetCounter(@counter,1); -- 3

CALL SetCounter(@counter,5); -- 8

SELECT @counter; -- 8