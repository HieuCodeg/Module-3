use appbanking;
DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
   `id` bigint(20) NOT NULL AUTO_INCREMENT,
   `full_name` varchar(255) NOT NULL ,
   `email` varchar(50) NOT NULL UNIQUE ,
   `phone` varchar(255) DEFAULT NULL ,
   `address` varchar(255) DEFAULT NULL ,
   `balance` decimal(12,0) DEFAULT 0,
   `created_at` datetime DEFAULT now(),
   `created_by` bigint(20) DEFAULT NULL,
   `updated_at` datetime DEFAULT NULL,
   `updated_by` bigint(20) DEFAULT NULL,
   `deleted` tinyint(1) DEFAULT '0',
   PRIMARY KEY (`id`)
);


--
-- Table structure for table `deposits`
--

DROP TABLE IF EXISTS `deposits`;

CREATE TABLE `deposits` (
   `id` bigint(20) NOT NULL AUTO_INCREMENT,
   `created_at` datetime DEFAULT now(),
   `created_by` bigint(20) DEFAULT NULL,
   `deleted` tinyint(1) DEFAULT '0',
   `updated_at` datetime DEFAULT NULL,
   `updated_by` bigint(20) DEFAULT NULL,
   `customer_id` bigint(20) DEFAULT NULL,
   `transaction_amount` decimal(12,0) NOT NULL,
   PRIMARY KEY (`id`),
   KEY `FK_CustomerDeposit` (`customer_id`),
   CONSTRAINT `FK_CustomerDeposit` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
);


--
-- Table structure for table `withdraws`
--

DROP TABLE IF EXISTS `withdraws`;

CREATE TABLE `withdraws` (
   `id` bigint(20) NOT NULL AUTO_INCREMENT,
   `created_at` datetime DEFAULT now(),
   `created_by` bigint(20) DEFAULT NULL,
   `deleted` tinyint(1) DEFAULT '0',
   `updated_at` datetime DEFAULT NULL,
   `updated_by` bigint(20) DEFAULT NULL,
   `customer_id` bigint(20) DEFAULT NULL,
   `transaction_amount` decimal(12,0) NOT NULL,
   PRIMARY KEY (`id`),
   KEY `FK_CustomerWithdraw` (`customer_id`),
   CONSTRAINT `FK_CustomerWithdraw` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
);


--
-- Table structure for table `transfers`
--

DROP TABLE IF EXISTS `transfers`;

CREATE TABLE `transfers` (
   `id` bigint(20) NOT NULL AUTO_INCREMENT,
   `created_at` datetime DEFAULT now(),
   `created_by` bigint(20) DEFAULT NULL,
   `deleted` tinyint(1) DEFAULT '0',
   `updated_at` datetime DEFAULT NULL,
   `updated_by` bigint(20) DEFAULT NULL,
   `fees` int(11) NOT NULL,
   `fees_amount` decimal(12,0) NOT NULL,
   `transaction_amount` decimal(12,0) NOT NULL,
   `transfer_amount` decimal(12,0) NOT NULL,
   `recipient_id` bigint(20) DEFAULT NULL,
   `sender_id` bigint(20) DEFAULT NULL,
   PRIMARY KEY (`id`),
   KEY `FK_RecipientTransfer` (`recipient_id`),
   KEY `FK_SenderTransfer` (`sender_id`),
   CONSTRAINT `FK_RecipientTransfer` FOREIGN KEY (`recipient_id`) REFERENCES `customers` (`id`),
   CONSTRAINT `FK_SenderTransfer` FOREIGN KEY (`sender_id`) REFERENCES `customers` (`id`)
);
----------------

delimiter //
CREATE PROCEDURE `sp_deposit_c6`(
	IN sFullName varchar(100),
    IN sEmail varchar(50),
    IN sPhone varchar(11),
    IN sAddress varchar(50),
    IN sTransactionAmount decimal(12,0)
)
begin
	declare total decimal(12,0);
    declare sCustomerId integer;
    
    # Kiem tra customer_id co ton tai hay chua
    if(not exists (SELECT `email` FROM `customers` where `email` = sEmail)) then 
		INSERT INTO `customers` (`full_name`, `email`, `phone`, `address`, `balance`, `deleted`) VALUES (sFullName, sEmail, sPhone, sAddress, '0', '0');
    end if;
    
    set sCustomerId = (SELECT id FROM `customers` where `email` = sEmail);
	INSERT INTO `deposits` (`created_at`, `deleted`, `customer_id`, `transaction_amount`) VALUES (now(), '0', sCustomerId, sTransactionAmount);
    
    set total = (SELECT balance from customers where id = sCustomerId);
    set total = total + sTransactionAmount;
    
    UPDATE `customers` SET `balance` = total WHERE (`id` = sCustomerId);

end //

delimiter //
CREATE PROCEDURE `sp_deposit`(
	in sID bigint,
    IN sTransactionAmount decimal(12,0),
    out notice text
)
begin
	declare total decimal(12,0);
    
    # Kiem tra customer_id co ton tai hay chua
    if(not exists (SELECT `id` FROM `customers` where `id` = sID)) then 
		set notice = 'Tai khoan khong ton tai';
	else 
		
		INSERT INTO `deposits` (`created_at`, `deleted`, `customer_id`, `transaction_amount`) 
			VALUES (now(), '0', sID, sTransactionAmount);
    
		set total = (SELECT balance from customers where id = sID);
		set total = total + sTransactionAmount;
    
		UPDATE `customers` SET `balance` = total WHERE (`id` = sID);
        set notice = 'Nop tien thanh cong';
    end if;
end //

delimiter //
create procedure sp_withdraws(
	in sID bigint,
    in sAmount decimal(12,0),
    out notice text
)
begin
	declare total decimal(12,0);
	if (not exists (select `id` from `customers` where `id` = siD)) then
		set notice = 'Tai khoan khong ton tai';
	else 
		set total = (SELECT balance from customers where id = sID);
		if (sAmount > total) then
			set notice = 'So du tai khoan hien tai khong du';
		else
			set total = total - sAmount;
			UPDATE `customers` SET `balance` = total WHERE (`id` = sID);
            insert into `withdraws` (customer_id, transaction_amount) values (sID, sAmount);
            set notice = 'Rut tien thanh cong';
		end if;
	end if;
end; //

delimiter //
create procedure sp_transfers(
	in sSender_id bigint,
    in sRecipient_id bigint,
    in sTransaction_amount decimal(12,0),
    out notice text
)
begin
	declare totalSend decimal(12,0);
    declare totalRecipient decimal(12,0);
    declare sFees int;
    declare sfees_amount decimal(12,0);
    declare sTransfer_amount decimal(12,0);
    if ((not exists (select `id` from `customers` where `id` = sSender_id)) or
		(not exists (select `id` from `customers` where `id` = sRecipient_id))) then
		set notice = 'Tai khoan khong ton tai!';
	elseif (sTransaction_amount < 10000) then set notice = 'So tien toi thieu chuyen la 10000 VND!';
	else
		set totalSend = (SELECT balance from customers where id = sSender_id);
        set totalRecipient = (SELECT balance from customers where id = sRecipient_id);
        
        if (sTransaction_amount <= 1000000) then set sFees = 0;
        elseif (sTransaction_amount <= 100000000) then set sFees = 1;
        else set sFees = 2;
        end if;
        set sfees_amount = round((sTransaction_amount * sFees)/100);
        set sTransfer_amount =  sTransaction_amount - sfees_amount;
        
		if (sTransaction_amount > totalSend) then
			set notice = 'So du tai khoan hien tai khong du!';
		else
			set totalSend = totalSend - sTransaction_amount;
            UPDATE `customers` SET `balance` = totalSend WHERE (`id` = sSender_id);
            set totalRecipient = totalRecipient + sTransfer_amount;
            UPDATE `customers` SET `balance` = totalRecipient WHERE (`id` = sRecipient_id);
            
            insert into `transfers` (fees, fees_amount, transaction_amount, transfer_amount, recipient_id, sender_id)
				values(sFees, sfees_amount, sTransaction_amount, sTransfer_amount, sRecipient_id, sSender_id);
                
			INSERT INTO `deposits` (`customer_id`, `transaction_amount`) VALUES (sRecipient_id, sTransfer_amount);
            insert into `withdraws` (customer_id, transaction_amount) values (sSender_id, sTransaction_amount);
            set notice = 'Chuyen tien thanh cong!';
        end if;
    end if;
end; //

create view lichsunoptien as
select * from deposits 
where customer_id = 2;
insert into appbanking.lichsunoptien (customer_id, transaction_amount)
values (2, 100000);

