use baitapcosodulieu;
DROP TABLE IF EXISTS `KHACHHANG`;
create table `KHACHHANG`(
 MAKH  char(4) PRIMARY KEY,
 HOTEN varchar(40) DEFAULT NULL,
 DCHI  varchar(50) DEFAULT NULL,
 SODT  varchar(20) DEFAULT NULL,
 NGSINH date DEFAULT NULL,
 NGDK  date DEFAULT NULL,
 DOANHSO decimal(12,0) DEFAULT NULL
);
LOCK TABLES `KHACHHANG` WRITE;
/*!40000 ALTER TABLE `KHACHHANG` DISABLE KEYS */;
INSERT INTO `KHACHHANG` VALUES ('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TP HCM','08823451','1960-10-22 00:00:00','2006-04-13 00:00:00',13060000),('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, HCM','0908256478','1974-04-03 00:00:00','2006-07-30 00:00:00',280000),('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, HCM','0938776266','1980-06-12 00:00:00','2006-08-05 00:00:00',3860000),('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, HCM','0917325476','1965-03-09 00:00:00','2006-10-02 00:00:00',250000),('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TP HCM','08246108','1950-03-10 00:00:00','2006-10-28 00:00:00',21000),('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TP HCM','08631738','1981-12-31 00:00:00','2006-11-24 00:00:00',915000),('KH07','Nguyen Van Tam','32/3 Tran Binh Trong Q5, HCM','0916783565','1971-04-06 00:00:00','2006-12-01 00:00:00',12500),('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q5, HCM','0938435756','1971-01-10 00:00:00','2006-12-13 00:00:00',365000),('KH09','Le Ha Vinh','873 Le Hong Phong, Q5, HCM','08654763','1979-09-03 00:00:00','2007-01-14 00:00:00',70000),('KH10','Ha Duy Lap','34/34B Nguyen Trai Q1, HCM','08768904','1983-05-02 00:00:00','2007-01-16 00:00:00',67500);
/*!40000 ALTER TABLE `KHACHHANG` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `nhanvien`;
create table NHANVIEN(
 MANV  char(4) PRIMARY KEY,
 HOTEN varchar(40) DEFAULT NULL,
 SODT  varchar(20) DEFAULT NULL,
 NGVL  date DEFAULT NULL
);
LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
INSERT INTO `nhanvien` VALUES ('NV01','Nguyen Nhu Nhut','0927345678','2006-04-13 00:00:00'),('NV02','Le Thi Phi Yen','0987567390','2008-04-15 00:00:00'),('NV03','Nguyen Van B','0997047382','2006-04-27 00:00:00'),('NV04','Ngo Thanh Tuan','0913758498','2006-06-24 00:00:00'),('NV05','Nguyen Thi Truc Thanh','0918590387','2006-07-20 00:00:00');
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `sanpham`;
create table SANPHAM(
 MASP  char(4)PRIMARY KEY,
 TENSP varchar(40) DEFAULT NULL,
 DVT  varchar(20) DEFAULT NULL,
 NUOCSX varchar(40) DEFAULT NULL,
 GIA  decimal(12,0) DEFAULT NULL
);
LOCK TABLES `sanpham` WRITE;
/*!40000 ALTER TABLE `sanpham` DISABLE KEYS */;
INSERT INTO `sanpham` VALUES ('BB01','But bi','cay','Viet Nam',5000),('BB02','But bi','cay','Trung Quoc',7000),('BB03','But bi','hop','Thai Lan',100000),('BC01','ButChi','cay','Trung Quoc',3000),('BC02','ButChi','cay','Thai Lan',5000),('BC03','ButChi','cay','Viet Nam',3500),('BC04','ButChi','hop','Viet Nam',30000),('ST01','So tay 500 trang','quyen','Trung Quoc',40000),('ST02','So tay loai 1','quyen','Viet Nam',55000),('ST03','So tay loai 2','quyen','Viet Nam',51000),('ST04','So tay','quyen','Thai Lan',55000),('ST05','So tay mong','quyen','Thai Lan',20000),('ST06','Phan viet bang','hop','Viet Nam',5000),('ST07','Phan khong bui','hop','Viet Nam',7000),('ST08','Bong bang','cai','Viet Nam',1000),('ST09','But long','cay','Viet Nam',5000),('ST10','But long','cay','Viet Nam',7000),('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500),('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500),('TV03','Tap 100 giay tot','quyen','Viet Nam',3000),('TV04','Tap 200 giay tot','cay','Viet Nam',5500),('TV05','Tap 100 trang','chuc','Viet Nam',23000),('TV06','Tap 200 trang','chuc','Viet Nam',53000),('TV07','Tap 100 trang','chuc','Trung Quoc',34000);
/*!40000 ALTER TABLE `sanpham` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `hoadon`;
create table HOADON(
 SOHD  int PRIMARY KEY,
 NGHD  date DEFAULT NULL,
 MAKH  char(4) DEFAULT NULL,
 MANV  char(4) DEFAULT NULL,
 TRIGIA decimal(12,0) DEFAULT NULL,
 FOREIGN KEY (`MaKH`) REFERENCES KHACHHANG(MAKH),
 FOREIGN KEY (`MaNV`) REFERENCES NHANVIEN(MANV)
);
LOCK TABLES `hoadon` WRITE;
/*!40000 ALTER TABLE `hoadon` DISABLE KEYS */;
INSERT INTO `hoadon` VALUES (1001,'2006-07-23 00:00:00','KH01','NV01',320000),(1002,'2006-12-08 00:00:00','KH01','NV02',840000),(1003,'2006-08-23 00:00:00','KH02','NV01',100000),(1004,'2006-09-01 00:00:00','KH02','NV01',180000),(1005,'2006-10-20 00:00:00','KH01','NV02',3800000),(1006,'2006-10-16 00:00:00','KH01','NV03',2430000),(1007,'2006-10-28 00:00:00','KH03','NV03',510000),(1008,'2006-10-28 00:00:00','KH01','NV03',440000),(1009,'2006-10-28 00:00:00','KH03','NV04',20000),(1010,'2006-11-01 00:00:00','KH01','NV01',5200000),(1011,'2006-11-04 00:00:00','KH04','NV03',250000),(1012,'2006-11-30 00:00:00','KH05','NV03',21000),(1013,'2006-12-12 00:00:00','KH06','NV01',5000),(1014,'2006-12-31 00:00:00','KH03','NV02',3150000),(1015,'2007-01-01 00:00:00','KH06','NV01',910000),(1016,'2007-01-01 00:00:00','KH07','NV02',12500),(1017,'2007-01-02 00:00:00','KH08','NV03',35000),(1018,'2007-01-13 00:00:00','KH08','NV03',33000),(1019,'2007-01-13 00:00:00','KH01','NV03',30000),(1020,'2007-01-14 00:00:00','KH09','NV04',70000),(1021,'2007-01-16 00:00:00','KH10','NV03',67500),(1022,'2007-01-16 00:00:00',NULL,'NV03',7000);
/*!40000 ALTER TABLE `hoadon` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `CTHD`;
create table CTHD(
 SOHD  int ,
 MASP  char(4) ,
 SL  int,
 FOREIGN KEY (`SOHD`) REFERENCES HOADON(SOHD),
 FOREIGN KEY (`MASP`) REFERENCES SANPHAM(MASP) 
);
LOCK TABLES `cthd` WRITE;
/*!40000 ALTER TABLE `cthd` DISABLE KEYS */;
INSERT INTO `cthd` VALUES (1001,'TV02',10),(1001,'ST01',5),(1001,'BC01',5),(1001,'BC02',10),(1001,'ST08',10),(1002,'BC04',20),(1002,'BB01',20),(1002,'BB02',20),(1003,'BB03',10),(1004,'TV01',20),(1004,'TV02',10),(1004,'TV03',10),(1004,'TV04',10),(1005,'TV05',50),(1005,'TV06',50),(1006,'TV07',50),(1006,'ST01',30),(1006,'ST02',10),(1007,'ST03',10),(1008,'ST04',8),(1009,'ST05',10),(1010,'TV07',50),(1010,'ST07',50),(1010,'ST08',100),(1010,'ST04',50),(1010,'TV03',100),(1011,'ST06',50),(1012,'ST07',3),(1013,'ST08',5),(1014,'BC02',80),(1014,'BC02',100),(1014,'BC04',60),(1014,'BB01',50),(1015,'BB02',30),(1015,'BB03',7),(1016,'TV01',5),(1017,'TV02',1),(1017,'TV03',1),(1017,'TV04',5),(1018,'ST04',6),(1019,'ST05',1),(1019,'ST06',2),(1020,'ST07',10),(1021,'ST08',5),(1021,'TV01',7),(1021,'TV02',10),(1022,'ST07',1);
/*!40000 ALTER TABLE `cthd` ENABLE KEYS */;
UNLOCK TABLES;
------------------------------
 # III TRUY VAN
 # cau 2
  select MASP, TENSP from sanpham where DVT = 'cay';
# cau 3
 select MASP, TENSP from sanpham where MASP like 'B%01';
 # cau 4,1,5
 select MASP, TENSP, NUOCSX from sanpham where (NUOCSX in ('Trung Quoc', 'Thai Lan'))
 and (GIA between 2000 and 30000); 
#cau 6
select sohd, trigia from hoadon where NGHD between '2007-1-1' and '2007-1-2';
#cau 7
select sohd, trigia from hoadon where NGHD like '2007-01-%'
order by NGHD asc, trigia desc;
#cau 8
select K.MAKH, HOTEN from khachhang K inner join hoadon H
on K.MAKH = H.MAKH
where H.NGHD = '2007-01-01';
#cau 9
select p.MASP, TENSP from khachhang K inner join hoadon H on K.MAKH = H.MAKH
inner join cthd c on H.SOHD = c.SOHD
inner join sanpham p on c.MASP = p.MASP
where H.NGHD like '2006-10-%' and K.HOTEN = 'Nguyen Van A';
#cau 10
select SOHD, TRIGIA from hoadon h inner join nhanvien n
on h.MANV = n.MANV
where n.HOTEN = 'Nguyen Van B' and h.NGHD = '2006-10-28';
#cau 11,12
select SOHD from cthd where masp in ('BB01', 'BB02')
and (SL between 10 and 20);
#cau 13
select SOHD from cthd where masp = 'BB01'
and sohd in (select SOHD from cthd where masp ='BB02'
and (SL between 10 and 20));
#cau 14
select s.MASP, TENSP , NUOCSX from sanpham s where NUOCSX = 'Trung Quoc'
or s.MASP in (select s.MASP from sanpham s inner join cthd c on s.MASP = c.MASP
inner join hoadon h on c.SOHD = h.SOHD
where h.NGHD = '2007-01-01');
#cau 15
select s.MASP, s.TENSP from sanpham s left join cthd c
on s.MASP = c. MASP
where c.SOHD is null;
#cau 16
select s.MASP, s.TENSP from sanpham s 
where (s.MASP not in (select c.MASP from cthd c inner join hoadon h
where year(h.NGHD)= 2006));
#cau 17
select s.MASP, s.TENSP from sanpham s 
where (s.MASP not in (select c.MASP from cthd c inner join hoadon h
where year(h.NGHD)= 2006)) and (NUOCSX = 'Trung Quoc');
#cau 18
select count(SOHD) from hoadon where MAKH is null;
#cau 19
select max(trigia), min(trigia) from hoadon;
#cau 20
select avg(trigia) from hoadon
where NGHD like '2006%';
select round(avg(trigia),1) from hoadon
where year(NGHD) = 2006;
#cau 21
select sum(trigia) from hoadon 
where year(NGHD) = 2006;
#cau 22
select SOHD from hoadon
where trigia in (select max(trigia) from hoadon 
where year(NGHD) = 2006);
#cau 23
select k.HOTEN from khachhang k inner join hoadon h
on k.MAKH = h.MAKH
where trigia in (select max(trigia) from hoadon 
where year(NGHD) = 2006);
#cau 24
select k.makh, k.hoten, h.trigia from khachhang k inner join hoadon h
on k.makh = h.makh
order by h.trigia desc
limit 0,3;
#cau 25
select s.masp, s.tensp from sanpham s inner join 
	(select distinct Gia from sanpham order by gia desc limit 0,3) as temp
on s.gia = temp.gia;
#cau 26
select s.MASP, s.TENSP from sanpham s inner join 
	(select distinct Gia from sanpham order by gia limit 0,3) as x
    on s.GIA = x.GIA
where s.NUOCSX = 'Trung Quoc';
#cau 27
select s.MASP, s.TENSP from sanpham s inner join 
	(select distinct Gia from sanpham
			where NUOCSX = 'Trung Quoc' order by gia limit 0,3) as x
    on s.GIA = x.GIA
where s.NUOCSX = 'Trung Quoc';
#cau 28
select makh, hoten, doanhso from khachhang 
order by doanhso desc
limit 0,3;
#cau 29
select sum(gia) from sanpham
where nuocsx ='trung quoc';
#cau 30
select count(nuocsx) as SOSP, nuocsx from sanpham
group by nuocsx;
#cau 31
select max(gia) as MAX, min(gia) as min, nuocsx from sanpham
group by nuocsx;
#cau 32
select sum(trigia) as DoanhThu, nghd from hoadon
group by nghd;
#cau 33
select count(s.masp) as soluong,s.tensp from sanpham s inner join cthd c
on s.masp = c.masp
inner join hoadon h
on c.soHD = h.sohd
where h.nghd = '2006-10-28'
group by s.tensp;
#cau 34
select sum(trigia) as doanhthu, nghd from hoadon
where year(nghd) = 2006
group by month(nghd);
#cau 35
select makh, hoten from khachhang 
where makh in (select makh from hoadon
group by makh
order by count(makh) desc
)
limit 0,1;

select makh, hoten from khachhang 
where makh in (select makh from hoadon
group by makh
having count(makh)>= all(select count(makh) from hoadon
group by makh));
#cau 36
select s.masp, s.tensp, sum(c.sl) as soluong from sanpham s 
inner join cthd c on s.masp = c.masp
inner join hoadon h on c.sohd = h.sohd
where year(h.nghd) = 2006
group by s.masp
having soluong <= all(select sum(c.sl) from cthd c
inner join hoadon h on c.sohd = h.sohd
where year(h.nghd) = 2006
group by c.masp);

#cau 37
select sum(c.sl) as doanhso,month(h.nghd) thang from cthd c, hoadon h
where c.sohd = h.sohd and year(h.nghd) = 2006
group by month(h.nghd)
order by sum(c.sl) asc
limit 0,1;

#cau 38
SELECT NUOCSX,MASP, TENSP, gia
FROM  SANPHAM A
WHERE GIA=(SELECT MAX(GIA)
   FROM  SANPHAM B
   WHERE A.NUOCSX=B.NUOCSX)
GROUP BY NUOCSX;
#cau 39
select k.makh, k.doanhso,temp.solanmua  from khachhang k inner join 
(select makh, count(sohd) as solanmua from hoadon
group by makh)as temp
on k.makh = temp.makh
where temp.solanmua >= all(select count(sohd) as solanmua from hoadon
group by makh)
order by doanhso desc
limit 0,10;
#cau 40
select nuocsx from sanpham
group by nuocsx
having count(distinct gia) >=3;
--------------------------------------------
# II. THAO TAC DU LIEU
UPDATE `baitapcosodulieu`.`sanpham` SET `GIA` = round((gia * 1.05))
where nuocsx = 'Thai Lan';

UPDATE `baitapcosodulieu`.`sanpham` SET `GIA` = round((gia * 0.95))
where nuocsx = 'Trung Quoc' and gia <= 10000;

UPDATE `baitapcosodulieu`.`khachhang` SET `LOAIKH` = 'Vip' 
WHERE (ngdk < '2007-01-01' and doanhso >= 10000000) or (ngdk >= '2007-01-01' and doanhso >= 2000000);
-----------------------------------------------
# I. DINH NGHIA DU LIEU

alter table sanpham add GHICHU varchar(20);
alter table khachhang add LOAIKH tinyint;
alter table sanpham modify column GHICHU varchar(100); 
alter table sanpham drop column ghichu;
alter table khachhang modify column LOAIKH varchar(50);
alter table sanpham add constraint check_dvt check(
	DVT = 'cay' 
    or DVT = 'cai'
    or DVT = 'hop'
    or DVT = 'quyen'
    or DVT = 'chuc');
alter table sanpham add constraint check_gia check( GIA > 500);
alter table khachhang add constraint check_ngayGN check( NGDK > NGSINH);
 -- cau 11
--  CREATE TRIGGER UPDATE_KH_C11
-- ON KHACHHANG
-- FOR UPDATE
-- AS
--  DECLARE @NGDK SMALLDATETIME, 
--    @NGHD SMALLDATETIME

--  SELECT @NGDK=NGDK
--  FROM  INSERTED
--  
--  IF(@NGDK>ANY(SELECT NGHD
--     FROM  HOADON A, INSERTED I
--     WHERE A.MAKH=I.MAKH))
--   BEGIN
--    ROLLBACK TRAN
--    PRINT 'ERROR!NGDK PHAI NHO HON NGHD'
--   END
--  ELSE
--   PRINT' SUCCESSFUL'
 -------
 delimiter //
 create trigger update_khachhang
 before update
 on baitapcosodulieu.khachhang 
 for each row 

 begin
    if (new.ngdk < (select nghd from hoadon where new.makh = hoadon.makh)) then
		set new.ngdk = old.ngdk;
	end if;
 end //
 
 
-- CREATE TRIGGER HD_C11
-- ON HOADON
-- FOR INSERT,UPDATE
-- AS
--  DECLARE @NGDK SMALLDATETIME, 
--    @NGHD SMALLDATETIME

--  SELECT @NGDK=NGDK,@NGHD=NGHD
--  FROM  INSERTED I, KHACHHANG A
--  WHERE I.MAKH=A.MAKH

--  IF @NGHD<@NGDK
--   BEGIN
--    ROLLBACK TRAN
--    PRINT 'ERROR!NGHD PHAI LON HON NGDK'
--   END
--  ELSE
--   PRINT' SUCCESSFUL'




