create database db_diemso
use db_diemso
go
create table hocsinh
(
	MaHocSinh int not null primary key,
	TenHocSinh nvarchar(255)
)

CREATE TABLE KetQuaDanhGia (
    MaHocSinh INT,
    Ky INT,
    HocLuc NVARCHAR(255),
    HanhKiem NVARCHAR(255),
    PRIMARY KEY (MaHocSinh, Ky),
);
alter table KetQuaDanhGia
add constraint fk_mahs_kq FOREIGN KEY (MaHocSinh) REFERENCES HocSinh(MaHocSinh)

CREATE TABLE diem (
    MaHocSinh INT,
    Ky INT,
    Toan DECIMAL(4, 1) NOT NULL,
    Li DECIMAL(4, 1) NOT NULL,
    Hoa DECIMAL(4, 1) NOT NULL,
    Sinh DECIMAL(4, 1) NOT NULL,
    Van DECIMAL(4, 1) NOT NULL,
    Su DECIMAL(4, 1) NOT NULL,
    Dia DECIMAL(4, 1) NOT NULL,
    Ngu_Ngu DECIMAL(4, 1) NOT NULL,
    GDCD DECIMAL(4, 1) NOT NULL,
    Cong_Nghe DECIMAL(4, 1) NOT NULL
	primary key(mahocsinh,ky)
);

alter table diem
add constraint fk_mahs_hs foreign key (mahocsinh) references Hocsinh(mahocsinh)

select * from diem order by Ky asc
drop table diem
Select * from ketquadanhgia


delete from hocsinh
Select hoa from diem where ky=1
SELECT distinct(TenHocSinh)  FROM hocsinh 
Select * from diem

Select toan,ky from diem where ky='1' or  ky='2' group by toan,ky order by ky asc