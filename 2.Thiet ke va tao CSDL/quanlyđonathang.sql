use quanlydondathang;
CREATE TABLE  `ĐV Khách` (
  `Mã ĐV` INT NOT NULL,
  `Tên ĐV` VARCHAR(45) NULL,
  `Điện thoại` INT NULL,
  `Địa chỉ` VARCHAR(45) NULL,
  PRIMARY KEY (`Mã ĐV`));

CREATE TABLE `Người đặt` (
  `Mã số NĐ` INT NOT NULL,
  `Họ tên NĐ` VARCHAR(45) NULL,
  `Mã ĐV` INT NULL,
  PRIMARY KEY (`Mã số NĐ`),
  CONSTRAINT `Mã ĐV`
	FOREIGN KEY (`Mã ĐV`)
    REFERENCES `ĐV Khách` (`Mã ĐV`));

CREATE TABLE `Hàng` (
  `Mã hàng` INT NOT NULL,
  `Tên hàng` VARCHAR(45) NULL,
  `ĐV tính` VARCHAR(20) NULL,
  `Mô tả hàng` VARCHAR(45) NULL,
  PRIMARY KEY (`Mã hàng`));

CREATE TABLE `Chi tiết đặt` (
  `Số ĐH` INT NOT NULL,
  `Ngày đặt` DATE NULL,
  `Số lượng` INT NULL,
  `Mã số NĐ` INT NULL,
  `Mã hàng` INT NULL,
  PRIMARY KEY (`Số ĐH`),
  CONSTRAINT `Mã số NĐ`
    FOREIGN KEY (`Mã số NĐ`)
    REFERENCES `Người đặt` (`Mã số NĐ`),
  CONSTRAINT `Mã hàng`
    FOREIGN KEY (`Mã hàng`)
    REFERENCES `Hàng` (`Mã hàng`));

CREATE TABLE `Người nhận` (
  `Mã số NN` INT NOT NULL,
  `Họ tên NN` VARCHAR(45) NULL,
  `Mã ĐV` INT NULL,
  PRIMARY KEY (`Mã số NN`),
    FOREIGN KEY (`Mã ĐV`)
    REFERENCES `ĐV Khách` (`Mã ĐV`));

CREATE TABLE `Nơi giao` (
  `Mã số DDG` INT NOT NULL,
  `Tên nơi giao` VARCHAR(45) NULL,
  PRIMARY KEY (`Mã số DDG`))
ENGINE = InnoDB;

CREATE TABLE `Người giao` (
  `Mã số NG` INT NOT NULL,
  `Họ tên NG` VARCHAR(45) NULL,
  PRIMARY KEY (`Mã số NG`))
ENGINE = InnoDB;

CREATE TABLE `Chi tiet Giao` (
  `Số PG` INT NOT NULL,
  `Ngày giao` DATE NULL,
  `Đơn giá` INT NULL,
  `Số lượng` INT NULL,
  `Mã hàng` INT NULL,
  `Mã số NN` INT NULL,
  `Mã số NG` INT NULL,
  `Mã số DDG` INT NULL,
  PRIMARY KEY (`Số PG`),
    FOREIGN KEY (`Mã số NN`)
    REFERENCES `Người nhận` (`Mã số NN`),
    FOREIGN KEY (`Mã số DDG`)
    REFERENCES `Nơi giao` (`Mã số DDG`),
    FOREIGN KEY (`Mã số NG`)
    REFERENCES `Người giao` (`Mã số NG`),
    FOREIGN KEY (`Mã hàng`)
    REFERENCES `Hàng` (`Mã hàng`));

