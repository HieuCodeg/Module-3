use banking;
DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
   `id` bigint(20) NOT NULL AUTO_INCREMENT,
   `full_name` varchar(255) NOT NULL COLLATE utf8mb4_unicode_ci,
   `email` varchar(50) NOT NULL UNIQUE COLLATE utf8mb4_unicode_ci,
   `phone` varchar(255) DEFAULT NULL COLLATE utf8mb4_unicode_ci,
   `address` varchar(255) DEFAULT NULL COLLATE utf8mb4_unicode_ci,
   `balance` decimal(12,0) DEFAULT 0,
   `created_at` datetime DEFAULT now(),
   `created_by` bigint(20) DEFAULT NULL,
   `updated_at` datetime DEFAULT NULL,
   `updated_by` bigint(20) DEFAULT NULL,
   `deleted` tinyint(1) DEFAULT '0',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
----------------
SET GLOBAL log_bin_trust_function_creators = 1;
delimiter //
create function sumAB(a Integer, b Integer)
returns Integer
begin
	#if, else, while....
    #declare
	return a + b;
end //
-----------------

delimiter //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deposit_c6`(
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
    if(not exists (SELECT `email` FROM `customers` where `email` COLLATE utf8mb4_0900_ai_ci like sEmail)) then 
		INSERT INTO `customers` (`full_name`, `email`, `phone`, `address`, `balance`, `deleted`) VALUES (sFullName, sEmail, sPhone, sAddress, '0', '0');
    end if;
    
    set sCustomerId = (SELECT id FROM `customers` where `email` COLLATE utf8mb4_0900_ai_ci like sEmail);
	INSERT INTO `deposits` (`created_at`, `deleted`, `customer_id`, `transaction_amount`) VALUES (now(), '0', sCustomerId, sTransactionAmount);
    
    set total = (SELECT balance from customers where id = sCustomerId);
    set total = total + sTransactionAmount;
    
    UPDATE `customers` SET `balance` = total WHERE (`id` = sCustomerId);

end //

