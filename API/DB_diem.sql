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
alter table Ketquadanhgia
add DiemTongKet Decimal(4,1)
--alter table Ketquadanhgia
--drop column diem_tk 


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
    Ngoai_Ngu DECIMAL(4, 1) NOT NULL,
    GDCD DECIMAL(4, 1) NOT NULL,
    Cong_Nghe DECIMAL(4, 1) NOT NULL
	primary key(mahocsinh,ky)
);

alter table diem
add constraint fk_mahs_hs foreign key (mahocsinh) references Hocsinh(mahocsinh)

select * from diem order by Ky asc
drop table Ketquadanhgia
Select * from ketquadanhgia

delete from hocsinh
Select * from diem where ky=5
SELECT distinct(TenHocSinh)  FROM hocsinh 
Select toan  from diem where ky='1' join in 

Select toan,mahocsinh from diem where ky =1  order by mahocsinh

SELECT
    MaHocSinh,
    AVG(CASE WHEN Ky = 1 THEN Toan ELSE 0 END) AS DiemTrungBinhToanKy1,
    AVG(CASE WHEN Ky = 2 THEN Toan ELSE 0 END) AS DiemTrungBinhToanKy2
FROM diem
GROUP BY MaHocSinh;


SELECT
    MaHocSinh,
    ((SUM(CASE WHEN Ky = 1 THEN Toan ELSE 0 END) + (SUM(CASE WHEN Ky = 2 THEN Toan ELSE 0 END) * 2)) / 3) AS Score_Avg
FROM diem
GROUP BY MaHocSinh

Select * from Ketquadanhgia group by Mahocsinh,Ky order by ky asc 
select top 3 * from diem where ky=5 and Mahocsinh='1703323069'

SELECT TOP 3 
    MaHocSinh,
    Ky,
    Toan,
    Li,
    Hoa
FROM diem
WHERE  Ky = 5
ORDER BY (Toan + Li + Hoa) DESC;

Select  top 5 value,column_name from (
	Select toan as value,column_name='Toan' from diem where mahocsinh='1703323103' and ky =5
	Union 
	Select li as value ,column_name='Li'from diem where mahocsinh='1703323103' and ky =5
	Union 
	Select hoa as value ,column_name='Hoa'from diem where mahocsinh='1703323103' and ky =5
	Union 
	Select sinh value ,column_name='Sinh' from diem where mahocsinh='1703323103' and ky =5
	Union 
	Select van as value ,column_name='Van' from diem where mahocsinh='1703323103' and ky =5
	Union 
	Select su  as value ,column_name='Su' from diem where mahocsinh='1703323103' and ky =5
	Union 
	Select dia as value ,column_name='Dia' from diem where mahocsinh='1703323103' and ky =5
	Union 
	Select ngoai_ngu as value ,column_name='Ngoai_Ngu' from diem where mahocsinh='1703323103' and ky =5) as t
order by value desc 
 

SELECT TOP 3
    MaHocSinh,
    Ky,
    TenMonHoc,
    Diem
FROM diem
WHERE MaHocSinh = '1703323069' AND Ky = 5
ORDER BY Diem DESC;




