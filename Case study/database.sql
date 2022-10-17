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
  
INSERT INTO `education`.`students` (`name`, `gender`, `birthday`, `phone`, `classid`, `email`) VALUES ('Nguyễn Thị Trang',0,'2000/01/01','0878989999','1','ThiTam@gmail.com'),
('Hoàng Hà',0,'2000/01/02','0909900009','2','Ainu@gmail.com'),
('Đặng Công',1,'2000/01/03','0346566758','3','AnDo@gmail.com'),
('Trần Văn Tâm',0,'2000/01/04','0878989999','4','ThiTam@gmail.com'),
('Nguyễn Thị Tẩm',0,'2000/01/05','0878989999','5','ThiTam@gmail.com'),
('Hoàng Hồ',1,'2000/01/06','0346566758','6','AnDo@gmail.com'),
('Đỗ Hoàng Anh',1,'2000/01/07','0346566758','7','AnDo@gmail.com'),
('Đỗ Văn Ban',1,'2000/01/08','0346566758','8','AnDo@gmail.com'),
('Đỗ Thị Hà',0,'2000/01/09','0909900009','9','Ainu@gmail.com'),
('Nguyễn Linh Linh',0,'2000/01/10','0909900009','10','Ainu@gmail.com'),
('Tống Phước Ái ',0,'2000/01/11','0909900009','11','Ainu@gmail.com'),
('Đỗ Đạt',1,'2000/01/12','0898989989','12','dodat@gmail.com'),
('Nguyễn Nông',0,'2000/01/13','0909900009','13','Ainu@gmail.com'),
('Hoàng Hoa Thám',1,'2000/01/14','0346566758','14','AnDo@gmail.com'),
('Nguyễn Thị Hồng',0,'2000/01/15','0878989999','15','ThiTam@gmail.com'),
('Nguyễn Hoàng Giang',0,'2000/01/16','0917410493','16','taikhoan1030@gmail.com'),
('Nguyễn Trần Quỳnh Hương',0,'2000/01/17','0918129188','17','taikhoan1033@gmail.com'),
('Phạm Quốc Bảo',1,'2000/01/18','0982913919','1','taikhoan1027@gmail.com'),
('Phạm Thị Ngọc Hiền',0,'2000/01/19','0903122556','2','taikhoan1031@gmail.com'),
('Phạm Hoàng Bách',1,'2000/01/20','0933737485','3','taikhoan1026@gmail.com'),
('Nguyễn Thái Duy',1,'2000/01/21','0908361951','4','taikhoan1028@gmail.com'),
('Lê Lại Nhật Anh',1,'2000/01/22','0986306331','5','taikhoan1023@gmail.com'),
('Trần Hoàng An',0,'2000/01/23','0933140284','6','taikhoan1021@gmail.com'),
('Trần Đức Anh',1,'2000/01/24','0989393275','7','taikhoan1024@gmail.com'),
('Trương Thị Hương Giang',0,'2000/01/25','0909714623','8','taikhoan1029@gmail.com'),
('Thân Trần Quỳnh Anh',0,'2000/01/26','0918289858','9','taikhoan1025@gmail.com'),
('Nguyễn Phạm Mỹ Huyền',0,'2000/01/27','0933484618','10','taikhoan1034@gmail.com'),
('Lâm Thị Hồng',0,'2000/01/28','0979115345','11','taikhoan1022@gmail.com'),
('Nguyễn Thị Nhi',0,'2000/01/29','0989989789','12','Nhicute@gmail.com'),
('Đỗ Văn An',1,'2000/01/30','0337337337','13','Na@gmail.com'),
('Nguyễn Văn Sơn',1,'2000/04/01','0345678678','14','VanSon@gmail.com'),
('Trần Anh Khoa',1,'2000/04/02','0982882201','15','taikhoan1036@gmail.com'),
('Phạm Lê Khôi',1,'2000/04/03','0908356130','16','taikhoan1037@gmail.com'),
('Đinh Công Khánh',1,'2000/04/04','0383874672','17','taikhoan1035@gmail.com'),
('Nguyễn Thêm Thử',0,'2000/04/05','0999999999','1','the@gmail.com'),
('Đoàn Thị Trà My',0,'2000/04/06','0903119131','2','taikhoan1040@gmail.com'),
('Nguyễn Trung Kiên',1,'2000/04/07','0988805526','3','taikhoan1038@gmail.com'),
('Nguyễn Ngọc Xuân Mai',0,'2000/04/08','0918740540','4','taikhoan1039@gmail.com'),
('Đặng Huỳnh Uyên Nhi',0,'2000/04/09','0915066800','5','taikhoan1046@gmail.com'),
('Đỗ Đạt',1,'2000/04/10','0919655801','6','taikhoan1045@gmail.com'),
('Phạm Thị Thanh Nguyên',0,'2000/04/11','0908248238','7','taikhoan1043@gmail.com'),
('Nguyễn Minh Quí',1,'2000/04/12','0918806566','8','taikhoan1051@gmail.com'),
('Nguyễn Trần Tấn',1,'2000/04/13','0919413401','9','taikhoan1049@gmail.com'),
('Đào Thiện Nhân',1,'2000/04/14','0362684866','10','taikhoan1044@gmail.com'),
('Nguyễn Vũ Thảo',0,'2000/04/15','0932024158','11','taikhoan1052@gmail.com'),
('Đặng Hoàng Phương Trâm',0,'2000/04/16','3556611641','12','taikhoan1054@gmail.com'),
('Phạm Thị Ngọc Thu',0,'2000/04/17','0918201102','13','taikhoan1053@gmail.com'),
('Nguyễn Thị Nga',0,'2000/04/18','0849848881','14','taikhoan1041@gmail.com'),
('Nghê Tài Phát',1,'2000/04/19','0903112536','15','taikhoan1047@gmail.com'),
('Nguyễn Minh Phúc',0,'2000/04/20','0905332401','16','taikhoan1050@gmail.com'),
('Phạm Huy Phúc',1,'2000/04/21','0909151486','17','taikhoan1048@gmail.com'),
('Hoàng Thị Kim Ngọc',0,'2000/04/22','0986338854','1','taikhoan1042@gmail.com'),
('Trần Hồ Mỹ Trinh',0,'2000/04/23','0937970960','2','taikhoan1056@gmail.com'),
('Trần Nguyễn Thanh Trúc',0,'2000/04/24','0913801389','3','taikhoan1057@gmail.com'),
('Nguyễn Hoàng Gia Tuấn',1,'2000/04/25','0909834079','4','taikhoan1058@gmail.com'),
('Nguyễn Ngọc Đoan Trang',0,'2000/04/26','0943852531','5','taikhoan1055@gmail.com'),
('Trần Nguyễn Hạ Uyên',0,'2000/06/01','0985070678','6','taikhoan1061@gmail.com'),
('Nguyễn Đặng Nhã Uyên',0,'2000/06/02','0989695944','7','taikhoan1060@gmail.com'),
('Lê Minh Tuấn',1,'2000/06/03','0326665770','8','taikhoan1059@gmail.com'),
('Nguyễn Thị Thảo Vy',0,'2000/06/04','0941117987','9','taikhoan1065@gmail.com'),
('Phạm Khả Vân',0,'2000/06/05','0908299448','10','taikhoan1062@gmail.com'),
('Trần Ngọc Tường Vy',0,'2000/06/06','0907636150','11','taikhoan1064@gmail.com'),
('Nguyễn Đăng Vinh',1,'2000/06/07','0859034062','12','taikhoan1063@gmail.com'),
('Nguyễn Thị Hồng',0,'2000/06/08','0878989999','13','+H104:H137ThiTam@gmail.com');

SELECT * FROM STUDENTS AS S INNER JOIN CLASSED AS C ON S.CLASSID = C.cID
where id like '%2000%' or name like '%2000%' or birthday like '%2000%' or phone like '%2000%' or grade like '%2000%' or email like '%2000%'
order by grade asc
limit 0,65;


