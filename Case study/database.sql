use education;

CREATE TABLE `education`.`user` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NULL,
  `password` VARCHAR(255) NULL,
  `fullname` VARCHAR(255) NULL,
  `status` int NOT NULL,
  `roleid` BIGINT NOT NULL,  
  `createddate` TIMESTAMP NULL DEFAULT NULL,
  `modifieddate` TIMESTAMP NULL DEFAULT NULL,
  `createdby` VARCHAR(255) NULL DEFAULT NULL,
  `modifiedby` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT fk_user_role FOREIGN KEY (roleid) REFERENCES role(id)
  );
  
  CREATE TABLE `education`.`role` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `code` VARCHAR(255) NULL, 
  `createddate` TIMESTAMP NULL DEFAULT NULL,
  `modifieddate` TIMESTAMP NULL DEFAULT NULL,
  `createdby` VARCHAR(255) NULL DEFAULT NULL,
  `modifiedby` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
  );
  
  CREATE TABLE `education`.`news` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NULL,
  `thumbnail` VARCHAR(255) NULL,
  `shortdescription` TEXT NULL,
  `content` TEXT NULL,
  `categoryid` BIGINT NOT NULL,  
  `createddate` TIMESTAMP NULL DEFAULT NULL,
  `modifieddate` TIMESTAMP NULL DEFAULT NULL,
  `createdby` VARCHAR(255) NULL DEFAULT NULL,
  `modifiedby` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
   CONSTRAINT fk_news_category FOREIGN KEY (categoryid) REFERENCES category(id)
  );
  
  CREATE TABLE `education`.`category` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NULL,
  `code` VARCHAR(255) NULL, 
  `createddate` TIMESTAMP NULL DEFAULT NULL,
  `modifieddate` TIMESTAMP NULL DEFAULT NULL,
  `createdby` VARCHAR(255) NULL DEFAULT NULL,
  `modifiedby` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
  );
  
    CREATE TABLE `education`.`comment` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
	`content` TEXT NOT NULL,
  `userid` BIGINT NOT NULL, 
  `newsid` BIGINT NOT NULL, 
  `createddate` TIMESTAMP NULL DEFAULT NULL,
  `modifieddate` TIMESTAMP NULL DEFAULT NULL,
  `createdby` VARCHAR(255) NULL DEFAULT NULL,
  `modifiedby` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
   CONSTRAINT fk_comment_user FOREIGN KEY (userid) REFERENCES user(id),
    CONSTRAINT fk_comment_news FOREIGN KEY (newsid) REFERENCES news(id)
  );
  

INSERT INTO `education`.`students` (`name`, `gender`, `birthday`, `phone`, `classid`, `email`) VALUES ('Nguyễn Thị Trang',0,'2000/01/01','0346767100',1,'emailmau100@gmail.com'),
('Hoàng Hà',0,'2000/01/02','0346768101','2','emailmau101@gmail.com'),
('Đặng Công',1,'2000/01/03','0346769102','3','emailmau102@gmail.com'),
('Trần Văn Tâm',0,'2000/01/04','0346770103','4','emailmau103@gmail.com'),
('Nguyễn Thị Tẩm',0,'2000/01/05','0346771104','5','emailmau104@gmail.com'),
('Hoàng Hồ',1,'2000/01/06','0346772105','6','emailmau105@gmail.com'),
('Đỗ Hoàng Anh',1,'2000/01/07','0346773106','7','emailmau106@gmail.com'),
('Đỗ Văn Ban',1,'2000/01/08','0346774107','8','emailmau107@gmail.com'),
('Đỗ Thị Hà',0,'2000/01/09','0346775108','9','emailmau108@gmail.com'),
('Nguyễn Linh Linh',0,'2000/01/10','0346776109','10','emailmau109@gmail.com'),
('Tống Phước Ái ',0,'2000/01/11','0346777110','11','emailmau110@gmail.com'),
('Đỗ Đạt',1,'2000/01/12','0346778111','12','emailmau111@gmail.com'),
('Nguyễn Nông',0,'2000/01/13','0346779112','13','emailmau112@gmail.com'),
('Hoàng Hoa Thám',1,'2000/01/14','0346780113','14','emailmau113@gmail.com'),
('Nguyễn Thị Hồng',0,'2000/01/15','0346781114','15','emailmau114@gmail.com'),
('Nguyễn Hoàng Giang',0,'2000/01/16','0346782115','16','emailmau115@gmail.com'),
('Nguyễn Trần Quỳnh Hương',0,'2000/01/17','0346783116','17','emailmau116@gmail.com'),
('Phạm Quốc Bảo',1,'2000/01/18','0346784117',1,'emailmau117@gmail.com'),
('Phạm Thị Ngọc Hiền',0,'2000/01/19','0346785118','2','emailmau118@gmail.com'),
('Phạm Hoàng Bách',1,'2000/01/20','0346786119','3','emailmau119@gmail.com'),
('Nguyễn Thái Duy',1,'2000/01/21','0346787120','4','emailmau120@gmail.com'),
('Lê Lại Nhật Anh',1,'2000/01/22','0346788121','5','emailmau121@gmail.com'),
('Trần Hoàng An',0,'2000/01/23','0346789122','6','emailmau122@gmail.com'),
('Trần Đức Anh',1,'2000/01/24','0346790123','7','emailmau123@gmail.com'),
('Trương Thị Hương Giang',0,'2000/01/25','0346791124','8','emailmau124@gmail.com'),
('Thân Trần Quỳnh Anh',0,'2000/01/26','0346792125','9','emailmau125@gmail.com'),
('Nguyễn Phạm Mỹ Huyền',0,'2000/01/27','0346793126','10','emailmau126@gmail.com'),
('Lâm Thị Hồng',0,'2000/01/28','0346794127','11','emailmau127@gmail.com'),
('Nguyễn Thị Nhi',0,'2000/01/29','0346795128','12','emailmau128@gmail.com'),
('Đỗ Văn An',1,'2000/01/30','0346796129','13','emailmau129@gmail.com'),
('Nguyễn Văn Sơn',1,'2000/04/01','0346797130','14','emailmau130@gmail.com'),
('Trần Anh Khoa',1,'2000/04/02','0346798131','15','emailmau131@gmail.com'),
('Phạm Lê Khôi',1,'2000/04/03','0346799132','16','emailmau132@gmail.com'),
('Đinh Công Khánh',1,'2000/04/04','0346800133','17','emailmau133@gmail.com'),
('Nguyễn Thêm Thử',0,'2000/04/05','0346801134',1,'emailmau134@gmail.com'),
('Đoàn Thị Trà My',0,'2000/04/06','0346802135','2','emailmau135@gmail.com'),
('Nguyễn Trung Kiên',1,'2000/04/07','0346803136','3','emailmau136@gmail.com'),
('Nguyễn Ngọc Xuân Mai',0,'2000/04/08','0346804137','4','emailmau137@gmail.com'),
('Đặng Huỳnh Uyên Nhi',0,'2000/04/09','0346805138','5','emailmau138@gmail.com'),
('Đỗ Đạt',1,'2000/04/10','0346806139','6','emailmau139@gmail.com'),
('Phạm Thị Thanh Nguyên',0,'2000/04/11','0346807140','7','emailmau140@gmail.com'),
('Nguyễn Minh Quí',1,'2000/04/12','0346808141','8','emailmau141@gmail.com'),
('Nguyễn Trần Tấn',1,'2000/04/13','0346809142','9','emailmau142@gmail.com'),
('Đào Thiện Nhân',1,'2000/04/14','0346810143','10','emailmau143@gmail.com'),
('Nguyễn Vũ Thảo',0,'2000/04/15','0346811144','11','emailmau144@gmail.com'),
('Đặng Hoàng Phương Trâm',0,'2000/04/16','0346812145','12','emailmau145@gmail.com'),
('Phạm Thị Ngọc Thu',0,'2000/04/17','0346813146','13','emailmau146@gmail.com'),
('Nguyễn Thị Nga',0,'2000/04/18','0346814147','14','emailmau147@gmail.com'),
('Nghê Tài Phát',1,'2000/04/19','0346815148','15','emailmau148@gmail.com'),
('Nguyễn Minh Phúc',0,'2000/04/20','0346816149','16','emailmau149@gmail.com'),
('Phạm Huy Phúc',1,'2000/04/21','0346817150','17','emailmau150@gmail.com'),
('Hoàng Thị Kim Ngọc',0,'2000/04/22','0346818151',1,'emailmau151@gmail.com'),
('Trần Hồ Mỹ Trinh',0,'2000/04/23','0346819152','2','emailmau152@gmail.com'),
('Trần Nguyễn Thanh Trúc',0,'2000/04/24','0346820153','3','emailmau153@gmail.com'),
('Nguyễn Hoàng Gia Tuấn',1,'2000/04/25','0346821154','4','emailmau154@gmail.com'),
('Nguyễn Ngọc Đoan Trang',0,'2000/04/26','0346822155','5','emailmau155@gmail.com'),
('Trần Nguyễn Hạ Uyên',0,'2000/06/01','0346823156','6','emailmau156@gmail.com'),
('Nguyễn Đặng Nhã Uyên',0,'2000/06/02','0346824157','7','emailmau157@gmail.com'),
('Lê Minh Tuấn',1,'2000/06/03','0346825158','8','emailmau158@gmail.com'),
('Nguyễn Thị Thảo Vy',0,'2000/06/04','0346826159','9','emailmau159@gmail.com'),
('Phạm Khả Vân',0,'2000/06/05','0346827160','10','emailmau160@gmail.com'),
('Trần Ngọc Tường Vy',0,'2000/06/06','0346828161','11','emailmau161@gmail.com'),
('Nguyễn Đăng Vinh',1,'2000/06/07','0346829162','12','emailmau162@gmail.com'),
('Nguyễn Thị Hồng',0,'2000/06/08','0346830163','13','emailmau163@gmail.com');
SELECT * FROM STUDENTS AS S INNER JOIN CLASSED AS C ON S.CLASSID = C.cID
where id like '%10A%' or name like '%10A%' or birthday like '%10A%' or phone like '%10A%' or grade like '%10A%' or email like '%10A%'
order by grade asc
limit 0,65;
SELECT * FROM CLASSED;
select count(phone) from students where phone = '0878989999' and id != 1;

UPDATE `education`.`students` SET `name` = 'Nguyễn Thị Hoài Trang',
 `gender` = 0 , `birthday` = '2000-02-01', `phone` = '0349767100',
 `classid` = '2', `email` = 'emailmau1009@gmail.com',
 `modifieddate` = CURRENT_TIMESTAMP, `modifiedby` = 'Hiếu' WHERE (`id` = '130');
 
 INSERT INTO `education`.`students` (`name`, `gender`, `birthday`, `phone`, `classid`, `email`, `createdby`) VALUES 
 ('Nguyễn Bình Minh',1,'2001-06-06', '0346830164', 4, 'binhminh@gmail.com','Hiếu');
 
 INSERT INTO `education`.`user` (`username`, `password`, `fullname`, `gender`, `birthday`, `status`, `roleid`, `idSubject`) VALUES 
 ('gvcn10b', 'minhhieu', 'Nguyễn Huệ', 1, '1996-03-09', '1', '2', '4');

 INSERT INTO `education`.`user` (`username`, `password`, `fullname`, `gender`, `birthday`, `status`, `roleid`, `idSubject`) VALUES 
 ('gvcn11c', 'minhhieu', 'Nguyễn Huệ', 1, '1996-03-09', '1', '2', '5'),
  ('gvcn10c', 'minhhieu', 'Phan Sào Nam', 1, '1996-03-09', '1', '2', '6'),
   ('gvcn10d', 'minhhieu', 'Nguyễn Trường Tộ', 1, '1997-03-09', '1', '2', '7'),
    ('gvcn12b', 'minhhieu', 'Lý Bôn', 1, '1998-03-09', '1', '2', '8'),
     ('gvcn12a', 'minhhieu', 'Nguyễn Thị Diễm My', 0, '1999-03-09', '1', '2', '9'),
      ('gvcn12c', 'minhhieu', 'Lê Thị Anh Thư', 0, '1986-08-09', '1', '2', '10'),
       ('gvcn12d', 'minhhieu', 'Đỗ Tấn', 1, '1976-03-09', '1', '2', '11'),
        ('gvcn11e', 'minhhieu', 'Hoàng Hoa Thám', 1, '1989-07-09', '1', '2', '12'),
 ('gvcn10f', 'minhhieu', 'Nguyễn Tri Phương', 1, '1995-06-09', '1', '2', '1');
SELECT * FROM USER AS U INNER JOIN SUBJECT AS S ON U.IDSUBJECT = S.SID;
SELECT count(*) FROM user;

SELECT * FROM USER AS U INNER JOIN SUBJECT AS S ON U.IDSUBJECT = S.SID WHERE u.STATUS = 1 AND (id like '%thị%' or fullname like '%thị%' or birthday like '%thị%' or subject like '%thị%');
