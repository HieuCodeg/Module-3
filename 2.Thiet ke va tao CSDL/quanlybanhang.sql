CREATE DATABASE QuanLyBanHang;
USE QuanLyBanHang;
CREATE TABLE Customer(
	cID int PRIMARY KEY,
    cName VARCHAR(25),
    cAge tinyINT
);
CREATE TABLE Oder(
	oID int PRIMARY KEY,
    cID int,
    oDate Datetime,
    oTotalPrice INT,
    FOREIGN KEY (cID) REFERENCES Customer(cID)
);
CREATE TABLE Product(
	pID int PRIMARY KEY,
	pName VARCHAR(25),
    pPrice INT
);
CREATE TABLE OderDetail(
	oID int,
    pID int,
    odQTY int,
    PRIMARY KEY (oID, pID),
    FOREIGN KEY (oID) REFERENCES Oder(oID),
    FOREIGN KEY (pID) REFERENCES Product(pID)
);