USE [master]
GO
/****** Object:  Database [db_diemso]    Script Date: 11/28/2023 9:23:54 PM ******/
CREATE DATABASE [db_diemso]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_diemso', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\db_diemso.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_diemso_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\db_diemso_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [db_diemso] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_diemso].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_diemso] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_diemso] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_diemso] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_diemso] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_diemso] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_diemso] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [db_diemso] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_diemso] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_diemso] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_diemso] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_diemso] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_diemso] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_diemso] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_diemso] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_diemso] SET  ENABLE_BROKER 
GO
ALTER DATABASE [db_diemso] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_diemso] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_diemso] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_diemso] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_diemso] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_diemso] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_diemso] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_diemso] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_diemso] SET  MULTI_USER 
GO
ALTER DATABASE [db_diemso] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_diemso] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_diemso] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_diemso] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_diemso] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_diemso] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [db_diemso] SET QUERY_STORE = OFF
GO
USE [db_diemso]
GO
/****** Object:  Table [dbo].[diem]    Script Date: 11/28/2023 9:23:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diem](
	[MaHocSinh] [int] NOT NULL,
	[Ky] [int] NOT NULL,
	[Toan] [decimal](4, 1) NOT NULL,
	[Li] [decimal](4, 1) NOT NULL,
	[Hoa] [decimal](4, 1) NOT NULL,
	[Sinh] [decimal](4, 1) NOT NULL,
	[Van] [decimal](4, 1) NOT NULL,
	[Su] [decimal](4, 1) NOT NULL,
	[Dia] [decimal](4, 1) NOT NULL,
	[Ngoai_Ngu] [decimal](4, 1) NOT NULL,
	[GDCD] [decimal](4, 1) NOT NULL,
	[Cong_Nghe] [decimal](4, 1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHocSinh] ASC,
	[Ky] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hocsinh]    Script Date: 11/28/2023 9:23:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hocsinh](
	[MaHocSinh] [int] NOT NULL,
	[TenHocSinh] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHocSinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KetQuaDanhGia]    Script Date: 11/28/2023 9:23:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KetQuaDanhGia](
	[MaHocSinh] [int] NOT NULL,
	[Ky] [int] NOT NULL,
	[HocLuc] [nvarchar](255) NULL,
	[HanhKiem] [nvarchar](255) NULL,
	[DiemTongKet] [decimal](4, 1) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHocSinh] ASC,
	[Ky] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323069, 1, CAST(7.8 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(9.5 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(8.3 AS Decimal(4, 1)), CAST(9.6 AS Decimal(4, 1)), CAST(8.4 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(9.6 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323069, 2, CAST(6.3 AS Decimal(4, 1)), CAST(6.4 AS Decimal(4, 1)), CAST(7.9 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)), CAST(7.5 AS Decimal(4, 1)), CAST(7.2 AS Decimal(4, 1)), CAST(5.8 AS Decimal(4, 1)), CAST(8.4 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323069, 3, CAST(8.7 AS Decimal(4, 1)), CAST(9.3 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)), CAST(7.3 AS Decimal(4, 1)), CAST(9.4 AS Decimal(4, 1)), CAST(6.2 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323069, 4, CAST(7.2 AS Decimal(4, 1)), CAST(7.7 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)), CAST(9.2 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(10.0 AS Decimal(4, 1)), CAST(8.2 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323069, 5, CAST(8.0 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)), CAST(6.6 AS Decimal(4, 1)), CAST(7.3 AS Decimal(4, 1)), CAST(8.4 AS Decimal(4, 1)), CAST(6.1 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)), CAST(9.6 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323070, 1, CAST(5.8 AS Decimal(4, 1)), CAST(7.7 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(7.2 AS Decimal(4, 1)), CAST(6.8 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)), CAST(7.9 AS Decimal(4, 1)), CAST(5.6 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(6.7 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323070, 2, CAST(4.8 AS Decimal(4, 1)), CAST(5.3 AS Decimal(4, 1)), CAST(7.2 AS Decimal(4, 1)), CAST(6.6 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(5.5 AS Decimal(4, 1)), CAST(6.8 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)), CAST(9.2 AS Decimal(4, 1)), CAST(6.7 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323070, 3, CAST(6.0 AS Decimal(4, 1)), CAST(6.9 AS Decimal(4, 1)), CAST(5.2 AS Decimal(4, 1)), CAST(7.0 AS Decimal(4, 1)), CAST(4.5 AS Decimal(4, 1)), CAST(6.5 AS Decimal(4, 1)), CAST(6.8 AS Decimal(4, 1)), CAST(5.4 AS Decimal(4, 1)), CAST(6.6 AS Decimal(4, 1)), CAST(7.7 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323070, 4, CAST(8.5 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(8.7 AS Decimal(4, 1)), CAST(8.2 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(9.5 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)), CAST(9.5 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323070, 5, CAST(8.8 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)), CAST(9.8 AS Decimal(4, 1)), CAST(9.7 AS Decimal(4, 1)), CAST(8.3 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)), CAST(9.6 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(9.6 AS Decimal(4, 1)), CAST(9.6 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323071, 1, CAST(5.9 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(5.8 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)), CAST(6.7 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)), CAST(8.4 AS Decimal(4, 1)), CAST(6.2 AS Decimal(4, 1)), CAST(9.6 AS Decimal(4, 1)), CAST(7.2 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323071, 2, CAST(4.5 AS Decimal(4, 1)), CAST(4.6 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(7.5 AS Decimal(4, 1)), CAST(6.7 AS Decimal(4, 1)), CAST(5.7 AS Decimal(4, 1)), CAST(4.8 AS Decimal(4, 1)), CAST(6.7 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(5.9 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323071, 3, CAST(7.7 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(7.9 AS Decimal(4, 1)), CAST(6.8 AS Decimal(4, 1)), CAST(7.9 AS Decimal(4, 1)), CAST(7.3 AS Decimal(4, 1)), CAST(6.8 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(7.9 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323071, 4, CAST(7.5 AS Decimal(4, 1)), CAST(6.9 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(6.5 AS Decimal(4, 1)), CAST(8.4 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(9.3 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323071, 5, CAST(8.4 AS Decimal(4, 1)), CAST(9.4 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(9.3 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(10.0 AS Decimal(4, 1)), CAST(9.4 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323072, 1, CAST(3.6 AS Decimal(4, 1)), CAST(5.1 AS Decimal(4, 1)), CAST(4.5 AS Decimal(4, 1)), CAST(5.1 AS Decimal(4, 1)), CAST(5.9 AS Decimal(4, 1)), CAST(7.0 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(5.5 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)), CAST(6.4 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323072, 2, CAST(6.8 AS Decimal(4, 1)), CAST(6.2 AS Decimal(4, 1)), CAST(8.2 AS Decimal(4, 1)), CAST(8.2 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(6.0 AS Decimal(4, 1)), CAST(6.6 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(9.9 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323072, 3, CAST(9.0 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(8.2 AS Decimal(4, 1)), CAST(8.4 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)), CAST(8.4 AS Decimal(4, 1)), CAST(9.4 AS Decimal(4, 1)), CAST(8.2 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)), CAST(9.5 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323072, 4, CAST(9.5 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(9.4 AS Decimal(4, 1)), CAST(9.3 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)), CAST(9.8 AS Decimal(4, 1)), CAST(9.5 AS Decimal(4, 1)), CAST(9.6 AS Decimal(4, 1)), CAST(8.7 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323072, 5, CAST(6.7 AS Decimal(4, 1)), CAST(8.2 AS Decimal(4, 1)), CAST(8.4 AS Decimal(4, 1)), CAST(9.2 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(9.2 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(7.3 AS Decimal(4, 1)), CAST(9.5 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323073, 1, CAST(6.5 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(6.8 AS Decimal(4, 1)), CAST(6.9 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(6.6 AS Decimal(4, 1)), CAST(9.6 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323073, 2, CAST(6.4 AS Decimal(4, 1)), CAST(5.9 AS Decimal(4, 1)), CAST(7.9 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(6.5 AS Decimal(4, 1)), CAST(6.0 AS Decimal(4, 1)), CAST(6.4 AS Decimal(4, 1)), CAST(7.9 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323073, 3, CAST(3.9 AS Decimal(4, 1)), CAST(6.3 AS Decimal(4, 1)), CAST(3.2 AS Decimal(4, 1)), CAST(5.3 AS Decimal(4, 1)), CAST(4.6 AS Decimal(4, 1)), CAST(5.6 AS Decimal(4, 1)), CAST(6.4 AS Decimal(4, 1)), CAST(4.2 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(6.7 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323073, 4, CAST(7.3 AS Decimal(4, 1)), CAST(6.6 AS Decimal(4, 1)), CAST(6.3 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)), CAST(6.7 AS Decimal(4, 1)), CAST(8.0 AS Decimal(4, 1)), CAST(8.4 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323073, 5, CAST(8.6 AS Decimal(4, 1)), CAST(9.2 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(7.3 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)), CAST(8.0 AS Decimal(4, 1)), CAST(9.3 AS Decimal(4, 1)), CAST(9.6 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323075, 1, CAST(5.0 AS Decimal(4, 1)), CAST(6.5 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(6.9 AS Decimal(4, 1)), CAST(5.1 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(5.9 AS Decimal(4, 1)), CAST(5.5 AS Decimal(4, 1)), CAST(6.4 AS Decimal(4, 1)), CAST(7.2 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323075, 2, CAST(7.3 AS Decimal(4, 1)), CAST(5.3 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)), CAST(8.4 AS Decimal(4, 1)), CAST(8.3 AS Decimal(4, 1)), CAST(6.5 AS Decimal(4, 1)), CAST(6.9 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(9.5 AS Decimal(4, 1)), CAST(7.9 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323075, 3, CAST(4.1 AS Decimal(4, 1)), CAST(5.9 AS Decimal(4, 1)), CAST(4.9 AS Decimal(4, 1)), CAST(5.1 AS Decimal(4, 1)), CAST(4.7 AS Decimal(4, 1)), CAST(5.6 AS Decimal(4, 1)), CAST(5.6 AS Decimal(4, 1)), CAST(3.0 AS Decimal(4, 1)), CAST(6.8 AS Decimal(4, 1)), CAST(6.4 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323075, 4, CAST(6.2 AS Decimal(4, 1)), CAST(5.0 AS Decimal(4, 1)), CAST(5.6 AS Decimal(4, 1)), CAST(6.8 AS Decimal(4, 1)), CAST(5.0 AS Decimal(4, 1)), CAST(7.2 AS Decimal(4, 1)), CAST(6.7 AS Decimal(4, 1)), CAST(5.1 AS Decimal(4, 1)), CAST(8.3 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323075, 5, CAST(8.1 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(7.5 AS Decimal(4, 1)), CAST(7.5 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)), CAST(7.9 AS Decimal(4, 1)), CAST(9.6 AS Decimal(4, 1)), CAST(9.6 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323076, 1, CAST(4.9 AS Decimal(4, 1)), CAST(5.1 AS Decimal(4, 1)), CAST(7.3 AS Decimal(4, 1)), CAST(5.1 AS Decimal(4, 1)), CAST(6.3 AS Decimal(4, 1)), CAST(6.1 AS Decimal(4, 1)), CAST(4.9 AS Decimal(4, 1)), CAST(6.2 AS Decimal(4, 1)), CAST(9.6 AS Decimal(4, 1)), CAST(6.9 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323076, 2, CAST(3.6 AS Decimal(4, 1)), CAST(3.6 AS Decimal(4, 1)), CAST(6.3 AS Decimal(4, 1)), CAST(5.3 AS Decimal(4, 1)), CAST(5.8 AS Decimal(4, 1)), CAST(5.8 AS Decimal(4, 1)), CAST(5.9 AS Decimal(4, 1)), CAST(5.6 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(4.7 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323076, 3, CAST(4.7 AS Decimal(4, 1)), CAST(6.0 AS Decimal(4, 1)), CAST(3.6 AS Decimal(4, 1)), CAST(4.6 AS Decimal(4, 1)), CAST(3.8 AS Decimal(4, 1)), CAST(4.4 AS Decimal(4, 1)), CAST(5.1 AS Decimal(4, 1)), CAST(4.1 AS Decimal(4, 1)), CAST(7.3 AS Decimal(4, 1)), CAST(5.3 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323076, 4, CAST(4.9 AS Decimal(4, 1)), CAST(5.5 AS Decimal(4, 1)), CAST(5.1 AS Decimal(4, 1)), CAST(6.8 AS Decimal(4, 1)), CAST(5.1 AS Decimal(4, 1)), CAST(7.3 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(6.6 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(6.8 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323076, 5, CAST(5.3 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(6.4 AS Decimal(4, 1)), CAST(8.0 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(8.4 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)), CAST(6.7 AS Decimal(4, 1)), CAST(9.8 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323077, 1, CAST(6.4 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(8.7 AS Decimal(4, 1)), CAST(7.7 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(7.0 AS Decimal(4, 1)), CAST(6.6 AS Decimal(4, 1)), CAST(7.9 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323077, 2, CAST(6.2 AS Decimal(4, 1)), CAST(5.9 AS Decimal(4, 1)), CAST(8.0 AS Decimal(4, 1)), CAST(8.3 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)), CAST(7.5 AS Decimal(4, 1)), CAST(6.8 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323077, 3, CAST(4.6 AS Decimal(4, 1)), CAST(7.0 AS Decimal(4, 1)), CAST(5.0 AS Decimal(4, 1)), CAST(5.8 AS Decimal(4, 1)), CAST(5.8 AS Decimal(4, 1)), CAST(5.6 AS Decimal(4, 1)), CAST(5.7 AS Decimal(4, 1)), CAST(4.4 AS Decimal(4, 1)), CAST(7.7 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323077, 4, CAST(8.2 AS Decimal(4, 1)), CAST(8.0 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(8.4 AS Decimal(4, 1)), CAST(7.3 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)), CAST(7.7 AS Decimal(4, 1)), CAST(9.6 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323077, 5, CAST(5.5 AS Decimal(4, 1)), CAST(7.7 AS Decimal(4, 1)), CAST(6.2 AS Decimal(4, 1)), CAST(6.1 AS Decimal(4, 1)), CAST(6.9 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(6.9 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(6.6 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323078, 1, CAST(8.4 AS Decimal(4, 1)), CAST(6.3 AS Decimal(4, 1)), CAST(8.3 AS Decimal(4, 1)), CAST(8.3 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(9.6 AS Decimal(4, 1)), CAST(8.7 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323078, 2, CAST(5.5 AS Decimal(4, 1)), CAST(6.1 AS Decimal(4, 1)), CAST(7.9 AS Decimal(4, 1)), CAST(8.3 AS Decimal(4, 1)), CAST(7.2 AS Decimal(4, 1)), CAST(6.9 AS Decimal(4, 1)), CAST(5.6 AS Decimal(4, 1)), CAST(7.7 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)), CAST(5.8 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323078, 3, CAST(5.8 AS Decimal(4, 1)), CAST(5.4 AS Decimal(4, 1)), CAST(4.8 AS Decimal(4, 1)), CAST(6.1 AS Decimal(4, 1)), CAST(5.7 AS Decimal(4, 1)), CAST(5.2 AS Decimal(4, 1)), CAST(6.1 AS Decimal(4, 1)), CAST(4.5 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(6.1 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323078, 4, CAST(7.1 AS Decimal(4, 1)), CAST(7.5 AS Decimal(4, 1)), CAST(7.0 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(5.7 AS Decimal(4, 1)), CAST(8.2 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(8.4 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(7.7 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323078, 5, CAST(7.4 AS Decimal(4, 1)), CAST(8.0 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(6.7 AS Decimal(4, 1)), CAST(6.8 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)), CAST(5.2 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323079, 1, CAST(6.5 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(6.7 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(5.4 AS Decimal(4, 1)), CAST(5.9 AS Decimal(4, 1)), CAST(7.2 AS Decimal(4, 1)), CAST(5.5 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(7.0 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323079, 2, CAST(5.9 AS Decimal(4, 1)), CAST(5.5 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(6.9 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(6.2 AS Decimal(4, 1)), CAST(6.5 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(6.0 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323079, 3, CAST(7.1 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(8.2 AS Decimal(4, 1)), CAST(7.9 AS Decimal(4, 1)), CAST(6.6 AS Decimal(4, 1)), CAST(6.4 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(5.3 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323079, 4, CAST(5.4 AS Decimal(4, 1)), CAST(6.4 AS Decimal(4, 1)), CAST(6.4 AS Decimal(4, 1)), CAST(6.9 AS Decimal(4, 1)), CAST(6.7 AS Decimal(4, 1)), CAST(6.8 AS Decimal(4, 1)), CAST(7.9 AS Decimal(4, 1)), CAST(5.9 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323079, 5, CAST(8.7 AS Decimal(4, 1)), CAST(8.7 AS Decimal(4, 1)), CAST(9.6 AS Decimal(4, 1)), CAST(8.4 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(8.2 AS Decimal(4, 1)), CAST(9.6 AS Decimal(4, 1)), CAST(7.7 AS Decimal(4, 1)), CAST(10.0 AS Decimal(4, 1)), CAST(9.9 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323080, 1, CAST(3.3 AS Decimal(4, 1)), CAST(5.0 AS Decimal(4, 1)), CAST(6.7 AS Decimal(4, 1)), CAST(3.6 AS Decimal(4, 1)), CAST(5.0 AS Decimal(4, 1)), CAST(6.4 AS Decimal(4, 1)), CAST(3.7 AS Decimal(4, 1)), CAST(5.2 AS Decimal(4, 1)), CAST(6.2 AS Decimal(4, 1)), CAST(6.3 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323080, 2, CAST(2.7 AS Decimal(4, 1)), CAST(3.6 AS Decimal(4, 1)), CAST(6.2 AS Decimal(4, 1)), CAST(6.8 AS Decimal(4, 1)), CAST(5.6 AS Decimal(4, 1)), CAST(4.6 AS Decimal(4, 1)), CAST(4.1 AS Decimal(4, 1)), CAST(4.8 AS Decimal(4, 1)), CAST(7.5 AS Decimal(4, 1)), CAST(3.8 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323080, 3, CAST(7.2 AS Decimal(4, 1)), CAST(7.0 AS Decimal(4, 1)), CAST(7.2 AS Decimal(4, 1)), CAST(6.1 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(5.2 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(6.1 AS Decimal(4, 1)), CAST(9.3 AS Decimal(4, 1)), CAST(8.4 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323080, 4, CAST(6.8 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(6.8 AS Decimal(4, 1)), CAST(8.0 AS Decimal(4, 1)), CAST(6.7 AS Decimal(4, 1)), CAST(6.8 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)), CAST(8.0 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323080, 5, CAST(5.8 AS Decimal(4, 1)), CAST(7.7 AS Decimal(4, 1)), CAST(6.5 AS Decimal(4, 1)), CAST(8.0 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(8.3 AS Decimal(4, 1)), CAST(6.3 AS Decimal(4, 1)), CAST(9.3 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323081, 1, CAST(8.2 AS Decimal(4, 1)), CAST(9.6 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(9.5 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323081, 2, CAST(9.5 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(9.8 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)), CAST(9.4 AS Decimal(4, 1)), CAST(9.9 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323081, 3, CAST(7.8 AS Decimal(4, 1)), CAST(7.9 AS Decimal(4, 1)), CAST(7.3 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(9.7 AS Decimal(4, 1)), CAST(9.8 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323081, 4, CAST(6.3 AS Decimal(4, 1)), CAST(6.8 AS Decimal(4, 1)), CAST(6.3 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)), CAST(7.3 AS Decimal(4, 1)), CAST(7.9 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(9.2 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323081, 5, CAST(8.1 AS Decimal(4, 1)), CAST(8.7 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)), CAST(8.0 AS Decimal(4, 1)), CAST(8.7 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(10.0 AS Decimal(4, 1)), CAST(9.9 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323082, 1, CAST(3.5 AS Decimal(4, 1)), CAST(7.5 AS Decimal(4, 1)), CAST(5.6 AS Decimal(4, 1)), CAST(4.3 AS Decimal(4, 1)), CAST(5.4 AS Decimal(4, 1)), CAST(6.3 AS Decimal(4, 1)), CAST(4.6 AS Decimal(4, 1)), CAST(4.6 AS Decimal(4, 1)), CAST(6.9 AS Decimal(4, 1)), CAST(7.0 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323082, 2, CAST(4.1 AS Decimal(4, 1)), CAST(6.2 AS Decimal(4, 1)), CAST(6.8 AS Decimal(4, 1)), CAST(7.7 AS Decimal(4, 1)), CAST(6.4 AS Decimal(4, 1)), CAST(6.3 AS Decimal(4, 1)), CAST(4.7 AS Decimal(4, 1)), CAST(5.9 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)), CAST(7.2 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323082, 3, CAST(5.3 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(5.3 AS Decimal(4, 1)), CAST(5.0 AS Decimal(4, 1)), CAST(5.7 AS Decimal(4, 1)), CAST(5.7 AS Decimal(4, 1)), CAST(5.9 AS Decimal(4, 1)), CAST(3.9 AS Decimal(4, 1)), CAST(8.4 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323082, 4, CAST(9.1 AS Decimal(4, 1)), CAST(9.8 AS Decimal(4, 1)), CAST(9.5 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)), CAST(8.0 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)), CAST(9.9 AS Decimal(4, 1)), CAST(9.3 AS Decimal(4, 1)), CAST(9.8 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323082, 5, CAST(8.9 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(9.3 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)), CAST(9.3 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(9.7 AS Decimal(4, 1)), CAST(9.4 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323083, 1, CAST(8.9 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(7.5 AS Decimal(4, 1)), CAST(7.0 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(9.8 AS Decimal(4, 1)), CAST(7.5 AS Decimal(4, 1)), CAST(9.6 AS Decimal(4, 1)), CAST(9.4 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323083, 2, CAST(5.3 AS Decimal(4, 1)), CAST(5.7 AS Decimal(4, 1)), CAST(8.3 AS Decimal(4, 1)), CAST(8.4 AS Decimal(4, 1)), CAST(8.3 AS Decimal(4, 1)), CAST(6.5 AS Decimal(4, 1)), CAST(5.6 AS Decimal(4, 1)), CAST(7.9 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)), CAST(7.2 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323083, 3, CAST(4.6 AS Decimal(4, 1)), CAST(6.3 AS Decimal(4, 1)), CAST(4.3 AS Decimal(4, 1)), CAST(5.2 AS Decimal(4, 1)), CAST(3.8 AS Decimal(4, 1)), CAST(5.1 AS Decimal(4, 1)), CAST(6.1 AS Decimal(4, 1)), CAST(4.5 AS Decimal(4, 1)), CAST(6.1 AS Decimal(4, 1)), CAST(5.2 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323083, 4, CAST(6.0 AS Decimal(4, 1)), CAST(6.5 AS Decimal(4, 1)), CAST(7.0 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)), CAST(5.7 AS Decimal(4, 1)), CAST(6.8 AS Decimal(4, 1)), CAST(8.2 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323083, 5, CAST(5.2 AS Decimal(4, 1)), CAST(8.2 AS Decimal(4, 1)), CAST(6.3 AS Decimal(4, 1)), CAST(6.6 AS Decimal(4, 1)), CAST(7.7 AS Decimal(4, 1)), CAST(8.0 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(5.8 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323084, 1, CAST(5.4 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(9.4 AS Decimal(4, 1)), CAST(5.9 AS Decimal(4, 1)), CAST(9.9 AS Decimal(4, 1)), CAST(7.3 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323084, 2, CAST(7.9 AS Decimal(4, 1)), CAST(7.7 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(8.2 AS Decimal(4, 1)), CAST(7.7 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)), CAST(9.8 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323084, 3, CAST(4.5 AS Decimal(4, 1)), CAST(5.6 AS Decimal(4, 1)), CAST(4.9 AS Decimal(4, 1)), CAST(5.6 AS Decimal(4, 1)), CAST(6.3 AS Decimal(4, 1)), CAST(6.6 AS Decimal(4, 1)), CAST(7.0 AS Decimal(4, 1)), CAST(6.6 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(6.1 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323084, 4, CAST(7.9 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(8.3 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)), CAST(8.7 AS Decimal(4, 1)), CAST(8.2 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323084, 5, CAST(6.8 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(7.3 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)), CAST(7.7 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323085, 1, CAST(4.1 AS Decimal(4, 1)), CAST(5.6 AS Decimal(4, 1)), CAST(6.9 AS Decimal(4, 1)), CAST(3.9 AS Decimal(4, 1)), CAST(6.0 AS Decimal(4, 1)), CAST(4.8 AS Decimal(4, 1)), CAST(4.5 AS Decimal(4, 1)), CAST(5.2 AS Decimal(4, 1)), CAST(9.4 AS Decimal(4, 1)), CAST(6.5 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323085, 2, CAST(5.9 AS Decimal(4, 1)), CAST(6.2 AS Decimal(4, 1)), CAST(7.7 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(7.9 AS Decimal(4, 1)), CAST(6.2 AS Decimal(4, 1)), CAST(6.3 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)), CAST(9.3 AS Decimal(4, 1)), CAST(7.7 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323085, 3, CAST(5.2 AS Decimal(4, 1)), CAST(5.9 AS Decimal(4, 1)), CAST(5.4 AS Decimal(4, 1)), CAST(6.1 AS Decimal(4, 1)), CAST(5.3 AS Decimal(4, 1)), CAST(4.6 AS Decimal(4, 1)), CAST(6.5 AS Decimal(4, 1)), CAST(4.9 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(6.6 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323085, 4, CAST(7.6 AS Decimal(4, 1)), CAST(7.7 AS Decimal(4, 1)), CAST(7.5 AS Decimal(4, 1)), CAST(8.7 AS Decimal(4, 1)), CAST(6.8 AS Decimal(4, 1)), CAST(7.9 AS Decimal(4, 1)), CAST(8.4 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)), CAST(7.7 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323085, 5, CAST(7.7 AS Decimal(4, 1)), CAST(8.7 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)), CAST(9.5 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323086, 1, CAST(5.8 AS Decimal(4, 1)), CAST(6.5 AS Decimal(4, 1)), CAST(6.4 AS Decimal(4, 1)), CAST(6.5 AS Decimal(4, 1)), CAST(6.4 AS Decimal(4, 1)), CAST(7.9 AS Decimal(4, 1)), CAST(7.7 AS Decimal(4, 1)), CAST(5.7 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)), CAST(7.3 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323086, 2, CAST(6.3 AS Decimal(4, 1)), CAST(6.7 AS Decimal(4, 1)), CAST(8.2 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(6.6 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(8.7 AS Decimal(4, 1)), CAST(8.4 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323086, 3, CAST(5.9 AS Decimal(4, 1)), CAST(7.7 AS Decimal(4, 1)), CAST(5.8 AS Decimal(4, 1)), CAST(6.8 AS Decimal(4, 1)), CAST(6.5 AS Decimal(4, 1)), CAST(7.9 AS Decimal(4, 1)), CAST(8.2 AS Decimal(4, 1)), CAST(5.5 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323086, 4, CAST(8.4 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)), CAST(8.4 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(9.2 AS Decimal(4, 1)), CAST(8.0 AS Decimal(4, 1)), CAST(9.5 AS Decimal(4, 1)), CAST(8.0 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323086, 5, CAST(7.2 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)), CAST(8.0 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)), CAST(7.5 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)), CAST(9.4 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323088, 1, CAST(5.7 AS Decimal(4, 1)), CAST(7.9 AS Decimal(4, 1)), CAST(7.5 AS Decimal(4, 1)), CAST(8.3 AS Decimal(4, 1)), CAST(8.2 AS Decimal(4, 1)), CAST(8.2 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)), CAST(6.2 AS Decimal(4, 1)), CAST(9.8 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323088, 2, CAST(8.6 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(9.5 AS Decimal(4, 1)), CAST(9.7 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(8.3 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(9.4 AS Decimal(4, 1)), CAST(9.9 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323088, 3, CAST(5.8 AS Decimal(4, 1)), CAST(6.6 AS Decimal(4, 1)), CAST(4.2 AS Decimal(4, 1)), CAST(4.6 AS Decimal(4, 1)), CAST(5.3 AS Decimal(4, 1)), CAST(5.7 AS Decimal(4, 1)), CAST(5.4 AS Decimal(4, 1)), CAST(4.4 AS Decimal(4, 1)), CAST(6.9 AS Decimal(4, 1)), CAST(6.0 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323088, 4, CAST(8.1 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(8.3 AS Decimal(4, 1)), CAST(7.9 AS Decimal(4, 1)), CAST(9.4 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323088, 5, CAST(7.9 AS Decimal(4, 1)), CAST(9.5 AS Decimal(4, 1)), CAST(9.3 AS Decimal(4, 1)), CAST(8.4 AS Decimal(4, 1)), CAST(7.9 AS Decimal(4, 1)), CAST(8.4 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(9.9 AS Decimal(4, 1)), CAST(9.9 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323090, 1, CAST(4.7 AS Decimal(4, 1)), CAST(7.0 AS Decimal(4, 1)), CAST(6.3 AS Decimal(4, 1)), CAST(6.9 AS Decimal(4, 1)), CAST(7.3 AS Decimal(4, 1)), CAST(5.9 AS Decimal(4, 1)), CAST(7.0 AS Decimal(4, 1)), CAST(5.2 AS Decimal(4, 1)), CAST(9.4 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323090, 2, CAST(6.1 AS Decimal(4, 1)), CAST(5.3 AS Decimal(4, 1)), CAST(6.8 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(6.2 AS Decimal(4, 1)), CAST(5.8 AS Decimal(4, 1)), CAST(5.8 AS Decimal(4, 1)), CAST(6.7 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323090, 3, CAST(4.6 AS Decimal(4, 1)), CAST(6.9 AS Decimal(4, 1)), CAST(4.5 AS Decimal(4, 1)), CAST(6.2 AS Decimal(4, 1)), CAST(6.3 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(6.6 AS Decimal(4, 1)), CAST(5.4 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(7.9 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323090, 4, CAST(8.3 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(8.4 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(7.2 AS Decimal(4, 1)), CAST(8.3 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)), CAST(8.7 AS Decimal(4, 1)), CAST(9.8 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323090, 5, CAST(8.9 AS Decimal(4, 1)), CAST(9.2 AS Decimal(4, 1)), CAST(9.8 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)), CAST(8.0 AS Decimal(4, 1)), CAST(9.6 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(9.6 AS Decimal(4, 1)), CAST(10.0 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323092, 1, CAST(5.0 AS Decimal(4, 1)), CAST(6.6 AS Decimal(4, 1)), CAST(6.2 AS Decimal(4, 1)), CAST(5.6 AS Decimal(4, 1)), CAST(6.2 AS Decimal(4, 1)), CAST(6.4 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(5.6 AS Decimal(4, 1)), CAST(8.2 AS Decimal(4, 1)), CAST(6.4 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323092, 2, CAST(5.2 AS Decimal(4, 1)), CAST(5.9 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(6.8 AS Decimal(4, 1)), CAST(6.1 AS Decimal(4, 1)), CAST(4.7 AS Decimal(4, 1)), CAST(5.5 AS Decimal(4, 1)), CAST(6.6 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323092, 3, CAST(7.4 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(7.5 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(7.7 AS Decimal(4, 1)), CAST(8.0 AS Decimal(4, 1)), CAST(5.6 AS Decimal(4, 1)), CAST(9.6 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323092, 4, CAST(5.9 AS Decimal(4, 1)), CAST(6.2 AS Decimal(4, 1)), CAST(7.5 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(5.6 AS Decimal(4, 1)), CAST(7.5 AS Decimal(4, 1)), CAST(8.2 AS Decimal(4, 1)), CAST(7.0 AS Decimal(4, 1)), CAST(9.3 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323092, 5, CAST(7.0 AS Decimal(4, 1)), CAST(8.4 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(7.2 AS Decimal(4, 1)), CAST(7.9 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(7.0 AS Decimal(4, 1)), CAST(9.5 AS Decimal(4, 1)), CAST(9.8 AS Decimal(4, 1)))
GO
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323093, 1, CAST(3.5 AS Decimal(4, 1)), CAST(6.4 AS Decimal(4, 1)), CAST(5.3 AS Decimal(4, 1)), CAST(6.1 AS Decimal(4, 1)), CAST(6.2 AS Decimal(4, 1)), CAST(6.1 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(5.1 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(6.8 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323093, 2, CAST(6.6 AS Decimal(4, 1)), CAST(6.1 AS Decimal(4, 1)), CAST(7.5 AS Decimal(4, 1)), CAST(6.8 AS Decimal(4, 1)), CAST(8.2 AS Decimal(4, 1)), CAST(6.4 AS Decimal(4, 1)), CAST(7.0 AS Decimal(4, 1)), CAST(7.5 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323093, 3, CAST(5.1 AS Decimal(4, 1)), CAST(6.1 AS Decimal(4, 1)), CAST(3.8 AS Decimal(4, 1)), CAST(5.4 AS Decimal(4, 1)), CAST(4.3 AS Decimal(4, 1)), CAST(5.1 AS Decimal(4, 1)), CAST(4.5 AS Decimal(4, 1)), CAST(3.6 AS Decimal(4, 1)), CAST(5.7 AS Decimal(4, 1)), CAST(6.4 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323093, 4, CAST(9.7 AS Decimal(4, 1)), CAST(9.2 AS Decimal(4, 1)), CAST(9.4 AS Decimal(4, 1)), CAST(9.2 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)), CAST(9.7 AS Decimal(4, 1)), CAST(9.5 AS Decimal(4, 1)), CAST(9.7 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323093, 5, CAST(8.7 AS Decimal(4, 1)), CAST(9.4 AS Decimal(4, 1)), CAST(8.7 AS Decimal(4, 1)), CAST(9.5 AS Decimal(4, 1)), CAST(8.0 AS Decimal(4, 1)), CAST(9.4 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(9.8 AS Decimal(4, 1)), CAST(9.7 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323094, 1, CAST(5.8 AS Decimal(4, 1)), CAST(7.5 AS Decimal(4, 1)), CAST(6.9 AS Decimal(4, 1)), CAST(7.3 AS Decimal(4, 1)), CAST(7.7 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(5.9 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(8.2 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323094, 2, CAST(5.4 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)), CAST(7.5 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(7.3 AS Decimal(4, 1)), CAST(6.6 AS Decimal(4, 1)), CAST(8.4 AS Decimal(4, 1)), CAST(8.7 AS Decimal(4, 1)), CAST(8.0 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323094, 3, CAST(6.4 AS Decimal(4, 1)), CAST(8.4 AS Decimal(4, 1)), CAST(5.4 AS Decimal(4, 1)), CAST(6.8 AS Decimal(4, 1)), CAST(5.6 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(7.0 AS Decimal(4, 1)), CAST(5.8 AS Decimal(4, 1)), CAST(7.2 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323094, 4, CAST(9.4 AS Decimal(4, 1)), CAST(9.3 AS Decimal(4, 1)), CAST(9.2 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(9.2 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(9.7 AS Decimal(4, 1)), CAST(9.3 AS Decimal(4, 1)), CAST(10.0 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323094, 5, CAST(9.1 AS Decimal(4, 1)), CAST(9.2 AS Decimal(4, 1)), CAST(9.7 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)), CAST(8.3 AS Decimal(4, 1)), CAST(8.4 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(8.2 AS Decimal(4, 1)), CAST(9.4 AS Decimal(4, 1)), CAST(9.4 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323095, 1, CAST(3.2 AS Decimal(4, 1)), CAST(5.1 AS Decimal(4, 1)), CAST(4.1 AS Decimal(4, 1)), CAST(4.6 AS Decimal(4, 1)), CAST(6.0 AS Decimal(4, 1)), CAST(5.2 AS Decimal(4, 1)), CAST(4.9 AS Decimal(4, 1)), CAST(5.7 AS Decimal(4, 1)), CAST(6.3 AS Decimal(4, 1)), CAST(6.5 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323095, 2, CAST(9.0 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(9.4 AS Decimal(4, 1)), CAST(9.7 AS Decimal(4, 1)), CAST(9.2 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323095, 3, CAST(5.7 AS Decimal(4, 1)), CAST(7.5 AS Decimal(4, 1)), CAST(4.5 AS Decimal(4, 1)), CAST(6.7 AS Decimal(4, 1)), CAST(5.8 AS Decimal(4, 1)), CAST(6.2 AS Decimal(4, 1)), CAST(6.9 AS Decimal(4, 1)), CAST(4.8 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(6.6 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323095, 4, CAST(7.3 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(8.4 AS Decimal(4, 1)), CAST(7.7 AS Decimal(4, 1)), CAST(8.3 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(9.5 AS Decimal(4, 1)), CAST(9.5 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323095, 5, CAST(7.3 AS Decimal(4, 1)), CAST(9.2 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(6.9 AS Decimal(4, 1)), CAST(7.9 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)), CAST(8.0 AS Decimal(4, 1)), CAST(9.7 AS Decimal(4, 1)), CAST(9.6 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323097, 1, CAST(4.8 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(5.9 AS Decimal(4, 1)), CAST(6.4 AS Decimal(4, 1)), CAST(6.2 AS Decimal(4, 1)), CAST(6.2 AS Decimal(4, 1)), CAST(6.8 AS Decimal(4, 1)), CAST(5.4 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323097, 2, CAST(6.4 AS Decimal(4, 1)), CAST(6.4 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)), CAST(7.7 AS Decimal(4, 1)), CAST(6.4 AS Decimal(4, 1)), CAST(5.6 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(9.3 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323097, 3, CAST(4.4 AS Decimal(4, 1)), CAST(7.2 AS Decimal(4, 1)), CAST(4.5 AS Decimal(4, 1)), CAST(5.5 AS Decimal(4, 1)), CAST(5.4 AS Decimal(4, 1)), CAST(6.2 AS Decimal(4, 1)), CAST(4.9 AS Decimal(4, 1)), CAST(4.7 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(6.4 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323097, 4, CAST(7.4 AS Decimal(4, 1)), CAST(7.7 AS Decimal(4, 1)), CAST(6.9 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)), CAST(9.4 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323097, 5, CAST(8.9 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)), CAST(9.5 AS Decimal(4, 1)), CAST(9.3 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)), CAST(8.7 AS Decimal(4, 1)), CAST(9.3 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323098, 1, CAST(7.7 AS Decimal(4, 1)), CAST(8.7 AS Decimal(4, 1)), CAST(8.2 AS Decimal(4, 1)), CAST(7.9 AS Decimal(4, 1)), CAST(8.3 AS Decimal(4, 1)), CAST(8.4 AS Decimal(4, 1)), CAST(9.4 AS Decimal(4, 1)), CAST(6.8 AS Decimal(4, 1)), CAST(8.7 AS Decimal(4, 1)), CAST(8.7 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323098, 2, CAST(8.2 AS Decimal(4, 1)), CAST(6.5 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)), CAST(8.7 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(5.1 AS Decimal(4, 1)), CAST(6.0 AS Decimal(4, 1)), CAST(7.3 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)), CAST(8.4 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323098, 3, CAST(4.6 AS Decimal(4, 1)), CAST(7.3 AS Decimal(4, 1)), CAST(5.1 AS Decimal(4, 1)), CAST(7.9 AS Decimal(4, 1)), CAST(6.6 AS Decimal(4, 1)), CAST(7.5 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(4.3 AS Decimal(4, 1)), CAST(8.3 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323098, 4, CAST(6.8 AS Decimal(4, 1)), CAST(7.0 AS Decimal(4, 1)), CAST(6.2 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(5.4 AS Decimal(4, 1)), CAST(6.0 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323098, 5, CAST(6.7 AS Decimal(4, 1)), CAST(8.7 AS Decimal(4, 1)), CAST(6.6 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(7.3 AS Decimal(4, 1)), CAST(8.4 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323100, 1, CAST(5.0 AS Decimal(4, 1)), CAST(6.1 AS Decimal(4, 1)), CAST(3.8 AS Decimal(4, 1)), CAST(5.4 AS Decimal(4, 1)), CAST(6.1 AS Decimal(4, 1)), CAST(5.5 AS Decimal(4, 1)), CAST(7.3 AS Decimal(4, 1)), CAST(5.6 AS Decimal(4, 1)), CAST(6.9 AS Decimal(4, 1)), CAST(6.1 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323100, 2, CAST(6.5 AS Decimal(4, 1)), CAST(5.6 AS Decimal(4, 1)), CAST(8.3 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(6.6 AS Decimal(4, 1)), CAST(5.0 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(9.2 AS Decimal(4, 1)), CAST(7.5 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323100, 3, CAST(5.8 AS Decimal(4, 1)), CAST(7.7 AS Decimal(4, 1)), CAST(5.7 AS Decimal(4, 1)), CAST(5.6 AS Decimal(4, 1)), CAST(5.4 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(5.8 AS Decimal(4, 1)), CAST(8.2 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323100, 4, CAST(6.5 AS Decimal(4, 1)), CAST(6.3 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(7.5 AS Decimal(4, 1)), CAST(6.0 AS Decimal(4, 1)), CAST(5.5 AS Decimal(4, 1)), CAST(8.0 AS Decimal(4, 1)), CAST(6.2 AS Decimal(4, 1)), CAST(9.4 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323100, 5, CAST(8.6 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)), CAST(9.4 AS Decimal(4, 1)), CAST(9.6 AS Decimal(4, 1)), CAST(8.3 AS Decimal(4, 1)), CAST(9.2 AS Decimal(4, 1)), CAST(9.8 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)), CAST(9.8 AS Decimal(4, 1)), CAST(9.7 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323103, 1, CAST(8.6 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)), CAST(8.0 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)), CAST(9.6 AS Decimal(4, 1)), CAST(9.2 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323103, 2, CAST(7.1 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(8.3 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(8.4 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)), CAST(7.2 AS Decimal(4, 1)), CAST(8.7 AS Decimal(4, 1)), CAST(9.5 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323103, 3, CAST(8.1 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(7.0 AS Decimal(4, 1)), CAST(8.7 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(7.7 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(9.4 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323103, 4, CAST(6.3 AS Decimal(4, 1)), CAST(7.5 AS Decimal(4, 1)), CAST(8.2 AS Decimal(4, 1)), CAST(7.9 AS Decimal(4, 1)), CAST(7.9 AS Decimal(4, 1)), CAST(7.9 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(8.3 AS Decimal(4, 1)), CAST(9.7 AS Decimal(4, 1)), CAST(8.0 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323103, 5, CAST(6.3 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(5.5 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)), CAST(7.0 AS Decimal(4, 1)), CAST(8.4 AS Decimal(4, 1)), CAST(9.5 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323104, 1, CAST(7.1 AS Decimal(4, 1)), CAST(7.3 AS Decimal(4, 1)), CAST(8.7 AS Decimal(4, 1)), CAST(7.9 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(7.8 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323104, 2, CAST(6.8 AS Decimal(4, 1)), CAST(3.7 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(7.0 AS Decimal(4, 1)), CAST(6.1 AS Decimal(4, 1)), CAST(5.0 AS Decimal(4, 1)), CAST(7.2 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)), CAST(6.4 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323104, 3, CAST(6.3 AS Decimal(4, 1)), CAST(7.7 AS Decimal(4, 1)), CAST(5.6 AS Decimal(4, 1)), CAST(6.3 AS Decimal(4, 1)), CAST(5.5 AS Decimal(4, 1)), CAST(7.0 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(5.0 AS Decimal(4, 1)), CAST(6.6 AS Decimal(4, 1)), CAST(7.7 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323104, 4, CAST(6.5 AS Decimal(4, 1)), CAST(6.0 AS Decimal(4, 1)), CAST(7.4 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(6.1 AS Decimal(4, 1)), CAST(7.0 AS Decimal(4, 1)), CAST(8.0 AS Decimal(4, 1)), CAST(6.7 AS Decimal(4, 1)), CAST(8.7 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323104, 5, CAST(8.0 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(9.3 AS Decimal(4, 1)), CAST(8.3 AS Decimal(4, 1)), CAST(9.1 AS Decimal(4, 1)), CAST(8.7 AS Decimal(4, 1)), CAST(7.3 AS Decimal(4, 1)), CAST(9.6 AS Decimal(4, 1)), CAST(9.6 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323105, 1, CAST(6.4 AS Decimal(4, 1)), CAST(7.2 AS Decimal(4, 1)), CAST(7.3 AS Decimal(4, 1)), CAST(6.7 AS Decimal(4, 1)), CAST(7.2 AS Decimal(4, 1)), CAST(5.0 AS Decimal(4, 1)), CAST(7.9 AS Decimal(4, 1)), CAST(6.3 AS Decimal(4, 1)), CAST(8.3 AS Decimal(4, 1)), CAST(6.8 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323105, 2, CAST(8.7 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)), CAST(9.6 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(7.5 AS Decimal(4, 1)), CAST(8.3 AS Decimal(4, 1)), CAST(9.6 AS Decimal(4, 1)), CAST(9.4 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323105, 3, CAST(8.5 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(6.9 AS Decimal(4, 1)), CAST(8.3 AS Decimal(4, 1)), CAST(7.3 AS Decimal(4, 1)), CAST(6.4 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(5.9 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(9.2 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323105, 4, CAST(8.5 AS Decimal(4, 1)), CAST(9.3 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)), CAST(8.7 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(9.7 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(9.3 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1703323105, 5, CAST(8.8 AS Decimal(4, 1)), CAST(9.5 AS Decimal(4, 1)), CAST(9.2 AS Decimal(4, 1)), CAST(9.6 AS Decimal(4, 1)), CAST(8.5 AS Decimal(4, 1)), CAST(9.7 AS Decimal(4, 1)), CAST(9.5 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)), CAST(9.7 AS Decimal(4, 1)), CAST(8.9 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1803706490, 1, CAST(4.5 AS Decimal(4, 1)), CAST(5.8 AS Decimal(4, 1)), CAST(4.7 AS Decimal(4, 1)), CAST(6.2 AS Decimal(4, 1)), CAST(6.7 AS Decimal(4, 1)), CAST(6.5 AS Decimal(4, 1)), CAST(6.5 AS Decimal(4, 1)), CAST(5.5 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(6.7 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1803706490, 2, CAST(5.0 AS Decimal(4, 1)), CAST(6.2 AS Decimal(4, 1)), CAST(7.2 AS Decimal(4, 1)), CAST(7.7 AS Decimal(4, 1)), CAST(6.1 AS Decimal(4, 1)), CAST(5.2 AS Decimal(4, 1)), CAST(6.1 AS Decimal(4, 1)), CAST(7.1 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(6.8 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1803706490, 3, CAST(5.2 AS Decimal(4, 1)), CAST(7.6 AS Decimal(4, 1)), CAST(5.6 AS Decimal(4, 1)), CAST(6.4 AS Decimal(4, 1)), CAST(5.7 AS Decimal(4, 1)), CAST(6.1 AS Decimal(4, 1)), CAST(8.1 AS Decimal(4, 1)), CAST(4.9 AS Decimal(4, 1)), CAST(6.9 AS Decimal(4, 1)), CAST(7.0 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1803706490, 4, CAST(9.3 AS Decimal(4, 1)), CAST(9.2 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)), CAST(9.0 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)), CAST(8.7 AS Decimal(4, 1)), CAST(9.3 AS Decimal(4, 1)), CAST(9.3 AS Decimal(4, 1)), CAST(9.9 AS Decimal(4, 1)), CAST(8.6 AS Decimal(4, 1)))
INSERT [dbo].[diem] ([MaHocSinh], [Ky], [Toan], [Li], [Hoa], [Sinh], [Van], [Su], [Dia], [Ngoai_Ngu], [GDCD], [Cong_Nghe]) VALUES (1803706490, 5, CAST(9.5 AS Decimal(4, 1)), CAST(9.2 AS Decimal(4, 1)), CAST(9.3 AS Decimal(4, 1)), CAST(9.8 AS Decimal(4, 1)), CAST(8.8 AS Decimal(4, 1)), CAST(9.9 AS Decimal(4, 1)), CAST(9.6 AS Decimal(4, 1)), CAST(9.2 AS Decimal(4, 1)), CAST(9.8 AS Decimal(4, 1)), CAST(9.6 AS Decimal(4, 1)))
GO
INSERT [dbo].[hocsinh] ([MaHocSinh], [TenHocSinh]) VALUES (1703323069, N'Đinh Thị Cẩm')
INSERT [dbo].[hocsinh] ([MaHocSinh], [TenHocSinh]) VALUES (1703323070, N'Nguyễn Hùng Cường')
INSERT [dbo].[hocsinh] ([MaHocSinh], [TenHocSinh]) VALUES (1703323071, N'Trần Lữ Nhân Doanh')
INSERT [dbo].[hocsinh] ([MaHocSinh], [TenHocSinh]) VALUES (1703323072, N'Nguyễn Tường Duy')
INSERT [dbo].[hocsinh] ([MaHocSinh], [TenHocSinh]) VALUES (1703323073, N'Phạm Đức Duy')
INSERT [dbo].[hocsinh] ([MaHocSinh], [TenHocSinh]) VALUES (1703323075, N'Lê Ngọc Thanh Đông')
INSERT [dbo].[hocsinh] ([MaHocSinh], [TenHocSinh]) VALUES (1703323076, N'Trần Thu Hà')
INSERT [dbo].[hocsinh] ([MaHocSinh], [TenHocSinh]) VALUES (1703323077, N'Nguyễn Thị Kim Hằng')
INSERT [dbo].[hocsinh] ([MaHocSinh], [TenHocSinh]) VALUES (1703323078, N'Huỳnh Thị Ngọc Hân')
INSERT [dbo].[hocsinh] ([MaHocSinh], [TenHocSinh]) VALUES (1703323079, N'Nguyễn Thái Huân')
INSERT [dbo].[hocsinh] ([MaHocSinh], [TenHocSinh]) VALUES (1703323080, N'Phạm Hoàng Kha')
INSERT [dbo].[hocsinh] ([MaHocSinh], [TenHocSinh]) VALUES (1703323081, N'Nguyễn Phúc Khang')
INSERT [dbo].[hocsinh] ([MaHocSinh], [TenHocSinh]) VALUES (1703323082, N'Thái Công Khanh')
INSERT [dbo].[hocsinh] ([MaHocSinh], [TenHocSinh]) VALUES (1703323083, N'Trương Kim Loan')
INSERT [dbo].[hocsinh] ([MaHocSinh], [TenHocSinh]) VALUES (1703323084, N'Nguyễn Thị Như Lụa')
INSERT [dbo].[hocsinh] ([MaHocSinh], [TenHocSinh]) VALUES (1703323085, N'Nguyễn Thị Trúc Ly')
INSERT [dbo].[hocsinh] ([MaHocSinh], [TenHocSinh]) VALUES (1703323086, N'Võ Ngọc Duy Mẫn')
INSERT [dbo].[hocsinh] ([MaHocSinh], [TenHocSinh]) VALUES (1703323088, N'Nguyễn Thị Trà My')
INSERT [dbo].[hocsinh] ([MaHocSinh], [TenHocSinh]) VALUES (1703323090, N'Huỳnh Thị Yến Nhi')
INSERT [dbo].[hocsinh] ([MaHocSinh], [TenHocSinh]) VALUES (1703323092, N'Trần Thị Ngọc Nữ')
INSERT [dbo].[hocsinh] ([MaHocSinh], [TenHocSinh]) VALUES (1703323093, N'Đoàn Văn Asin')
INSERT [dbo].[hocsinh] ([MaHocSinh], [TenHocSinh]) VALUES (1703323094, N'Nguyễn Thanh Tài')
INSERT [dbo].[hocsinh] ([MaHocSinh], [TenHocSinh]) VALUES (1703323095, N'Trần Văn Hữu Thành')
INSERT [dbo].[hocsinh] ([MaHocSinh], [TenHocSinh]) VALUES (1703323097, N'Lý Kim Thơ')
INSERT [dbo].[hocsinh] ([MaHocSinh], [TenHocSinh]) VALUES (1703323098, N'Bạch Cao Cẩm Tiên')
INSERT [dbo].[hocsinh] ([MaHocSinh], [TenHocSinh]) VALUES (1703323100, N'Đỗ Thị Kiều Trang')
INSERT [dbo].[hocsinh] ([MaHocSinh], [TenHocSinh]) VALUES (1703323103, N'Võ Thị Kiều Trinh')
INSERT [dbo].[hocsinh] ([MaHocSinh], [TenHocSinh]) VALUES (1703323104, N'Võ Minh Tú')
INSERT [dbo].[hocsinh] ([MaHocSinh], [TenHocSinh]) VALUES (1703323105, N'Trần Lê Hoàng Yến')
INSERT [dbo].[hocsinh] ([MaHocSinh], [TenHocSinh]) VALUES (1803706490, N'Lê Lộc Phát')
GO
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323069, 1, N'Giỏi', N'Tốt', CAST(8.5 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323069, 2, N'Khá', N'Tốt', CAST(7.6 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323069, 3, N'Khá', N'Tốt', CAST(8.5 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323069, 4, N'Giỏi', N'Tốt', CAST(8.3 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323069, 5, N'Khá', N'Tốt', CAST(7.9 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323070, 1, N'Khá', N'Tốt', CAST(7.1 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323070, 2, N'Trung bình', N'Tốt', CAST(6.7 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323070, 3, N'Trung bình', N'Tốt', CAST(6.3 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323070, 4, N'Giỏi', N'Tốt', CAST(8.8 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323070, 5, N'Giỏi', N'Tốt', CAST(9.2 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323071, 1, N'Khá', N'Tốt', CAST(7.3 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323071, 2, N'Trung bình', N'Tốt', CAST(6.2 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323071, 3, N'Khá', N'Tốt', CAST(7.8 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323071, 4, N'Khá', N'Tốt', CAST(7.7 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323071, 5, N'Giỏi', N'Tốt', CAST(8.9 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323072, 1, N'Trung bình', N'Khá', CAST(5.8 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323072, 2, N'Khá', N'Tốt', CAST(7.7 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323072, 3, N'Giỏi', N'Tốt', CAST(8.7 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323072, 4, N'Giỏi', N'Tốt', CAST(9.2 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323072, 5, N'Khá', N'Tốt', CAST(8.4 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323073, 1, N'Khá', N'Tốt', CAST(7.6 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323073, 2, N'Khá', N'Tốt', CAST(7.1 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323073, 3, N'Yếu', N'Tốt', CAST(5.4 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323073, 4, N'Khá', N'Tốt', CAST(7.7 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323073, 5, N'Giỏi', N'Tốt', CAST(8.7 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323075, 1, N'Trung bình', N'Khá', CAST(6.3 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323075, 2, N'Khá', N'Tốt', CAST(7.8 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323075, 3, N'Yếu', N'Khá', CAST(5.2 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323075, 4, N'Trung bình', N'Tốt', CAST(6.3 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323075, 5, N'Giỏi', N'Tốt', CAST(8.5 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323076, 1, N'Trung bình', N'Tốt', CAST(6.2 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323076, 2, N'Trung bình', N'Tốt', CAST(5.6 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323076, 3, N'Yếu', N'Trung bình', CAST(4.9 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323076, 4, N'Trung bình', N'Tốt', CAST(6.4 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323076, 5, N'Khá', N'Tốt', CAST(7.6 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323077, 1, N'Khá', N'Tốt', CAST(7.5 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323077, 2, N'Khá', N'Khá', CAST(7.5 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323077, 3, N'Trung bình', N'Tốt', CAST(5.9 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323077, 4, N'Giỏi', N'Tốt', CAST(8.1 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323077, 5, N'Khá', N'Tốt', CAST(6.9 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323078, 1, N'Khá', N'Tốt', CAST(8.2 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323078, 2, N'Khá', N'Tốt', CAST(7.0 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323078, 3, N'Trung bình', N'Tốt', CAST(5.8 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323078, 4, N'Khá', N'Tốt', CAST(7.8 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323078, 5, N'Khá', N'Tốt', CAST(7.5 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323079, 1, N'Khá', N'Tốt', CAST(6.6 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323079, 2, N'Khá', N'Tốt', CAST(6.8 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323079, 3, N'Khá', N'Tốt', CAST(7.4 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323079, 4, N'Khá', N'Tốt', CAST(6.9 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323079, 5, N'Giỏi', N'Tốt', CAST(8.8 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323080, 1, N'Yếu', N'Trung bình', CAST(5.1 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323080, 2, N'Yếu', N'Tốt', CAST(5.0 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323080, 3, N'Khá', N'Tốt', CAST(7.2 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323080, 4, N'Khá', N'Tốt', CAST(7.5 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323080, 5, N'Khá', N'Tốt', CAST(7.7 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323081, 1, N'Giỏi', N'Tốt', CAST(8.9 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323081, 2, N'Giỏi', N'Tốt', CAST(9.2 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323081, 3, N'Khá', N'Tốt', CAST(8.4 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323081, 4, N'Khá', N'Tốt', CAST(7.5 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323081, 5, N'Giỏi', N'Tốt', CAST(8.7 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323082, 1, N'Trung bình', N'Tốt', CAST(5.6 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323082, 2, N'Trung bình', N'Tốt', CAST(6.3 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323082, 3, N'Trung bình', N'Khá', CAST(6.0 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323082, 4, N'Giỏi', N'Tốt', CAST(9.2 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323082, 5, N'Giỏi', N'Tốt', CAST(9.0 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323083, 1, N'Giỏi', N'Tốt', CAST(8.6 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323083, 2, N'Khá', N'Tốt', CAST(7.2 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323083, 3, N'Yếu', N'Khá', CAST(5.1 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323083, 4, N'Khá', N'Tốt', CAST(7.2 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323083, 5, N'Khá', N'Tốt', CAST(7.3 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323084, 1, N'Khá', N'Tốt', CAST(7.8 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323084, 2, N'Giỏi', N'Tốt', CAST(8.6 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323084, 3, N'Trung bình', N'Khá', CAST(6.0 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323084, 4, N'Giỏi', N'Tốt', CAST(8.1 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323084, 5, N'Khá', N'Tốt', CAST(7.9 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323085, 1, N'Trung bình', N'Trung bình', CAST(5.7 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323085, 2, N'Khá', N'Tốt', CAST(7.4 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323085, 3, N'Trung bình', N'Tốt', CAST(5.8 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323085, 4, N'Khá', N'Tốt', CAST(7.9 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323085, 5, N'Khá', N'Tốt', CAST(8.6 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323086, 1, N'Trung bình', N'Tốt', CAST(6.9 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323086, 2, N'Khá', N'Tốt', CAST(7.6 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323086, 3, N'Khá', N'Tốt', CAST(7.0 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323086, 4, N'Giỏi', N'Tốt', CAST(8.4 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323086, 5, N'Khá', N'Tốt', CAST(8.4 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323088, 1, N'Khá', N'Khá', CAST(7.9 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323088, 2, N'Giỏi', N'Tốt', CAST(8.9 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323088, 3, N'Trung bình', N'Khá', CAST(5.5 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323088, 4, N'Giỏi', N'Tốt', CAST(8.2 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323088, 5, N'Khá', N'Tốt', CAST(8.9 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323090, 1, N'Trung bình', N'Khá', CAST(6.7 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323090, 2, N'Khá', N'Tốt', CAST(6.7 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323090, 3, N'Trung bình', N'Khá', CAST(6.3 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323090, 4, N'Giỏi', N'Tốt', CAST(8.4 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323090, 5, N'Giỏi', N'Tốt', CAST(9.2 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323092, 1, N'Trung bình', N'Tốt', CAST(6.4 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323092, 2, N'Trung bình', N'Tốt', CAST(6.4 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323092, 3, N'Khá', N'Tốt', CAST(7.8 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323092, 4, N'Khá', N'Tốt', CAST(7.2 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323092, 5, N'Khá', N'Tốt', CAST(8.2 AS Decimal(4, 1)))
GO
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323093, 1, N'Trung bình', N'Tốt', CAST(6.1 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323093, 2, N'Khá', N'Tốt', CAST(7.3 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323093, 3, N'Trung bình', N'Khá', CAST(5.0 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323093, 4, N'Giỏi', N'Tốt', CAST(9.3 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323093, 5, N'Giỏi', N'Tốt', CAST(9.1 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323094, 1, N'Khá', N'Tốt', CAST(7.4 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323094, 2, N'Khá', N'Khá', CAST(7.5 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323094, 3, N'Trung bình', N'Tốt', CAST(6.8 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323094, 4, N'Giỏi', N'Tốt', CAST(9.2 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323094, 5, N'Giỏi', N'Tốt', CAST(9.0 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323095, 1, N'Yếu', N'Tốt', CAST(5.2 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323095, 2, N'Giỏi', N'Tốt', CAST(8.9 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323095, 3, N'Trung bình', N'Tốt', CAST(6.2 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323095, 4, N'Giỏi', N'Tốt', CAST(8.5 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323095, 5, N'Khá', N'Tốt', CAST(8.4 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323097, 1, N'Trung bình', N'Khá', CAST(6.4 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323097, 2, N'Khá', N'Tốt', CAST(7.4 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323097, 3, N'Trung bình', N'Khá', CAST(5.6 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323097, 4, N'Giỏi', N'Tốt', CAST(8.1 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323097, 5, N'Giỏi', N'Tốt', CAST(8.9 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323098, 1, N'Giỏi', N'Tốt', CAST(8.3 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323098, 2, N'Khá', N'Tốt', CAST(7.4 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323098, 3, N'Trung bình', N'Tốt', CAST(6.9 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323098, 4, N'Khá', N'Tốt', CAST(7.0 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323098, 5, N'Khá', N'Tốt', CAST(7.9 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323100, 1, N'Trung bình', N'Tốt', CAST(5.8 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323100, 2, N'Khá', N'Tốt', CAST(7.2 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323100, 3, N'Trung bình', N'Khá', CAST(6.7 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323100, 4, N'Khá', N'Tốt', CAST(7.0 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323100, 5, N'Giỏi', N'Tốt', CAST(9.2 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323103, 1, N'Giỏi', N'Tốt', CAST(8.5 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323103, 2, N'Giỏi', N'Tốt', CAST(8.2 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323103, 3, N'Giỏi', N'Tốt', CAST(8.1 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323103, 4, N'Khá', N'Tốt', CAST(8.1 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323103, 5, N'Khá', N'Tốt', CAST(7.7 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323104, 1, N'Khá', N'Tốt', CAST(7.9 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323104, 2, N'Trung bình', N'Tốt', CAST(6.7 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323104, 3, N'Trung bình', N'Khá', CAST(6.5 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323104, 4, N'Khá', N'Tốt', CAST(7.2 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323104, 5, N'Giỏi', N'Tốt', CAST(8.8 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323105, 1, N'Khá', N'Tốt', CAST(6.9 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323105, 2, N'Giỏi', N'Tốt', CAST(8.6 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323105, 3, N'Khá', N'Tốt', CAST(7.8 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323105, 4, N'Giỏi', N'Tốt', CAST(8.8 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1703323105, 5, N'Giỏi', N'Tốt', CAST(9.2 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1803706490, 1, N'Trung bình', N'Tốt', CAST(6.2 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1803706490, 2, N'Khá', N'Tốt', CAST(6.6 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1803706490, 3, N'Trung bình', N'Tốt', CAST(6.4 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1803706490, 4, N'Giỏi', N'Tốt', CAST(9.1 AS Decimal(4, 1)))
INSERT [dbo].[KetQuaDanhGia] ([MaHocSinh], [Ky], [HocLuc], [HanhKiem], [DiemTongKet]) VALUES (1803706490, 5, N'Giỏi', N'Tốt', CAST(9.5 AS Decimal(4, 1)))
GO
ALTER TABLE [dbo].[diem]  WITH CHECK ADD  CONSTRAINT [fk_mahs_hs] FOREIGN KEY([MaHocSinh])
REFERENCES [dbo].[hocsinh] ([MaHocSinh])
GO
ALTER TABLE [dbo].[diem] CHECK CONSTRAINT [fk_mahs_hs]
GO
ALTER TABLE [dbo].[KetQuaDanhGia]  WITH CHECK ADD  CONSTRAINT [fk_mahs_kq] FOREIGN KEY([MaHocSinh])
REFERENCES [dbo].[hocsinh] ([MaHocSinh])
GO
ALTER TABLE [dbo].[KetQuaDanhGia] CHECK CONSTRAINT [fk_mahs_kq]
GO
USE [master]
GO
ALTER DATABASE [db_diemso] SET  READ_WRITE 
GO
