use xuatnhaphang;
create table PhieuXuat(
SoPX int auto_increment primary key,
NgayXuat date);

create table VatTu(
MaVTU int primary key,
TenVTU varchar(50));

create table ChiTietPhieuXuat(
SoPX int,
MaVTU int,
DGXuat int,
SLXuat int,
primary key(SoPX, MaVTU),
foreign key (SoPX) references PhieuXuat(SoPX),
foreign key (MaVTU) references VatTu(MaVTU));

create table PhieuNhap(
SoPN int auto_increment primary key,
NgayNhap date);

create table ChiTietPhieuNhap(
SoPN int,
MaVTU int,
DGXuat int,
SLNhap int,
primary key(SoPN, MaVTU),
foreign key (SoPN) references PhieuNhap(SoPN),
foreign key (MaVTU) references VatTu(MaVTU));

create table DonDH(
SoDH int auto_increment primary key,
NgayDH date);

create table ChiTietDH(
SoDH int,
MaVTU int,
primary key (SoDH, MaVTU),
foreign key (SoDH) references DonDH(SoDH),
foreign key (MaVTU) references VatTu(MaVTU));

create table NhaCC (
MaNCC int primary key,
TenNCC varchar(35),
DiaChi varchar(50),
SDT int,
SoDH int,
foreign key (SoDH) references DonDH(SoDH));