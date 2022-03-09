USE [master]
GO
/****** Object:  Database [Bitirmeprojesidb]    Script Date: 7.03.2022 14:49:38 ******/
CREATE DATABASE [Bitirmeprojesidb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bitirmeprojesidb', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Bitirmeprojesidb.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Bitirmeprojesidb_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Bitirmeprojesidb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Bitirmeprojesidb] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bitirmeprojesidb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bitirmeprojesidb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bitirmeprojesidb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bitirmeprojesidb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bitirmeprojesidb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bitirmeprojesidb] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bitirmeprojesidb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bitirmeprojesidb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bitirmeprojesidb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bitirmeprojesidb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bitirmeprojesidb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bitirmeprojesidb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bitirmeprojesidb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bitirmeprojesidb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bitirmeprojesidb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bitirmeprojesidb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bitirmeprojesidb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bitirmeprojesidb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bitirmeprojesidb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bitirmeprojesidb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bitirmeprojesidb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bitirmeprojesidb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bitirmeprojesidb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bitirmeprojesidb] SET RECOVERY FULL 
GO
ALTER DATABASE [Bitirmeprojesidb] SET  MULTI_USER 
GO
ALTER DATABASE [Bitirmeprojesidb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bitirmeprojesidb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bitirmeprojesidb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bitirmeprojesidb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [Bitirmeprojesidb]
GO
/****** Object:  Table [dbo].[FaaliyetKaynakMaliyet]    Script Date: 7.03.2022 14:49:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FaaliyetKaynakMaliyet](
	[FKMid] [int] IDENTITY(1,1) NOT NULL,
	[Faaliyetid] [int] NULL,
	[KMEid] [int] NULL,
	[Adet] [int] NULL,
 CONSTRAINT [PK_FaaliyetKaynakMaliyet] PRIMARY KEY CLUSTERED 
(
	[FKMid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faaliyetler]    Script Date: 7.03.2022 14:49:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faaliyetler](
	[Faaliyetid] [int] IDENTITY(1,1) NOT NULL,
	[FaaliyetAdı] [varchar](50) NULL,
 CONSTRAINT [PK_Faaliyetler] PRIMARY KEY CLUSTERED 
(
	[Faaliyetid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FaaliyetMaliyet]    Script Date: 7.03.2022 14:49:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FaaliyetMaliyet](
	[Giderid] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Giderler]    Script Date: 7.03.2022 14:49:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Giderler](
	[Giderid] [int] IDENTITY(1,1) NOT NULL,
	[HesapKodu] [varchar](50) NULL,
	[HesapAdı] [nvarchar](50) NULL,
	[Tutar] [nvarchar](50) NULL,
 CONSTRAINT [PK_Giderler] PRIMARY KEY CLUSTERED 
(
	[Giderid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KaynakMaliyetEtkenleri]    Script Date: 7.03.2022 14:49:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KaynakMaliyetEtkenleri](
	[KMEid] [int] IDENTITY(1,1) NOT NULL,
	[KMEAdi] [varchar](50) NULL,
 CONSTRAINT [PK_KaynakMaliyetEtkenleri] PRIMARY KEY CLUSTERED 
(
	[KMEid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaaliyetFaaliyetIliskilendirme]    Script Date: 7.03.2022 14:49:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaaliyetFaaliyetIliskilendirme](
	[MFIid] [int] IDENTITY(1,1) NOT NULL,
	[GiderId] [int] NULL,
	[KMEid] [int] NULL,
	[Faaliyetid] [int] NULL,
	[Onay] [bit] NULL,
 CONSTRAINT [PK_MaaliyetFaaliyetIliskilendirme] PRIMARY KEY CLUSTERED 
(
	[MFIid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[sp_iliski]    Script Date: 7.03.2022 14:49:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[sp_iliski]
AS
SELECT        *
FROM            (SELECT     dbo.Giderler.Hesapkodu + ' ' + dbo.Giderler.HesapAdı AS hesapadı, dbo.KaynakMaliyetEtkenleri.KMEAdi, cast(dbo.MaaliyetFaaliyetIliskilendirme.Onay AS int) onay, dbo.Faaliyetler.FaaliyetAdı
                          FROM            dbo.MaaliyetFaaliyetIliskilendirme INNER JOIN
                                                    dbo.KaynakMaliyetEtkenleri ON dbo.KaynakMaliyetEtkenleri.KMEid = dbo.MaaliyetFaaliyetIliskilendirme.KMEid INNER JOIN
                                                    dbo.Giderler ON dbo.MaaliyetFaaliyetIliskilendirme.GiderId = dbo.Giderler.Giderid INNER JOIN
                                                    dbo.Faaliyetler ON dbo.Faaliyetler.Faaliyetid = dbo.MaaliyetFaaliyetIliskilendirme.Faaliyetid) maaliyet_faaliyet PIVOT (sum(onay) FOR FaaliyetAdı IN ([Ambalajlama], [Apreleme], [Depolama], [Desen Çizim], 
                         [Dokuma], [İlk Madde Depolama], [Kalite Kontrol], [Kesim ve Overlok], [Sevkiyat])) pivotee
GO
/****** Object:  View [dbo].[sp_mfi]    Script Date: 7.03.2022 14:49:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[sp_mfi]
AS
SELECT        dbo.sp_iliski.*, dbo.tbl.id
FROM            dbo.sp_iliski CROSS JOIN
                         dbo.tbl
GO
/****** Object:  View [dbo].[OranView]    Script Date: 7.03.2022 14:49:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[OranView]
AS
SELECT        CAST(ROUND(o.Adet * 1.0 / i.kmc, 2, 1) AS decimal(18, 2)) AS oran, o.Faaliyetid, o.KMEid, o.FKMid
FROM            dbo.FaaliyetKaynakMaliyet AS o INNER JOIN
                             (SELECT        SUM(Adet) AS kmc, KMEid
                               FROM            dbo.FaaliyetKaynakMaliyet
                               GROUP BY KMEid) AS i ON o.KMEid = i.KMEid
GO
/****** Object:  View [dbo].[sp]    Script Date: 7.03.2022 14:49:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[sp]
AS
SELECT        *
FROM            (SELECT        Giderid,dbo.Giderler.Hesapkodu + ' ' + dbo.Giderler.HesapAdı AS hesapadı, dbo.KaynakMaliyetEtkenleri.KMEAdi, cast(dbo.MaaliyetFaaliyetIliskilendirme.Onay AS int) onay, dbo.Faaliyetler.FaaliyetAdı
                          FROM            dbo.MaaliyetFaaliyetIliskilendirme INNER JOIN
                                                    dbo.KaynakMaliyetEtkenleri ON dbo.KaynakMaliyetEtkenleri.KMEid = dbo.MaaliyetFaaliyetIliskilendirme.KMEid INNER JOIN
                                                    dbo.Giderler ON dbo.MaaliyetFaaliyetIliskilendirme.GiderId = dbo.Giderler.Giderid INNER JOIN
                                                    dbo.Faaliyetler ON dbo.Faaliyetler.Faaliyetid = dbo.MaaliyetFaaliyetIliskilendirme.Faaliyetid) maaliyet_faaliyet PIVOT (sum(onay) FOR FaaliyetAdı IN ([Ambalajlama], [Apreleme], [Depolama], [Desen Çizim], 
                         [Dokuma], [İlk Madde Depolama], [Kalite Kontrol], [Kesim ve Overlok], [Sevkiyat])) pivotee
GO
/****** Object:  View [dbo].[Tabloiliski]    Script Date: 7.03.2022 14:49:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Tabloiliski]
as
Select * From MaaliyetFaaliyetIliskilendirme
PIVOT
(
count(Onay)
For Faaliyetid In ([1],[2],[3],[4],[5],[6],[7],[8],[9]))
AS pvt
GO
SET IDENTITY_INSERT [dbo].[FaaliyetKaynakMaliyet] ON 

INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (1, 1, 1, 4)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (2, 2, 1, 5)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (3, 3, 1, 6)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (4, 4, 1, 8)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (5, 5, 1, 7)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (6, 6, 1, 12)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (7, 7, 1, 10)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (8, 8, 1, 4)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (9, 9, 1, 6)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (1002, 1, 2, 4850)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (1003, 2, 2, 150)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (1004, 3, 2, 1200)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (1005, 4, 2, 250)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (1006, 5, 2, 750)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (1007, 6, 2, 1000)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (1008, 7, 2, 300)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (1009, 8, 2, 6000)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (1010, 9, 2, 500)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (1013, 1, 3, 1)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (1014, 2, 3, 1)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (1015, 3, 3, 1)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (1016, 4, 3, 1)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (1017, 5, 3, 1)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (1018, 6, 3, 1)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (1019, 7, 3, 1)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (1020, 8, 3, 1)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (1021, 9, 3, 1)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (1022, 1, 6, 3)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (1023, 2, 6, 0)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (1024, 3, 6, 0)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (1025, 4, 6, 0)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (1026, 5, 6, 0)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (1027, 6, 6, 0)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (1028, 7, 6, 0)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (1029, 8, 6, 2)
INSERT [dbo].[FaaliyetKaynakMaliyet] ([FKMid], [Faaliyetid], [KMEid], [Adet]) VALUES (1030, 9, 6, 4)
SET IDENTITY_INSERT [dbo].[FaaliyetKaynakMaliyet] OFF
SET IDENTITY_INSERT [dbo].[Faaliyetler] ON 

INSERT [dbo].[Faaliyetler] ([Faaliyetid], [FaaliyetAdı]) VALUES (1, N'İlk Madde Depolama')
INSERT [dbo].[Faaliyetler] ([Faaliyetid], [FaaliyetAdı]) VALUES (2, N'Desen Çizim')
INSERT [dbo].[Faaliyetler] ([Faaliyetid], [FaaliyetAdı]) VALUES (3, N'Dokuma')
INSERT [dbo].[Faaliyetler] ([Faaliyetid], [FaaliyetAdı]) VALUES (4, N'Kalite Kontrol')
INSERT [dbo].[Faaliyetler] ([Faaliyetid], [FaaliyetAdı]) VALUES (5, N'Apreleme')
INSERT [dbo].[Faaliyetler] ([Faaliyetid], [FaaliyetAdı]) VALUES (6, N'Kesim ve Overlok')
INSERT [dbo].[Faaliyetler] ([Faaliyetid], [FaaliyetAdı]) VALUES (7, N'Ambalajlama')
INSERT [dbo].[Faaliyetler] ([Faaliyetid], [FaaliyetAdı]) VALUES (8, N'Depolama')
INSERT [dbo].[Faaliyetler] ([Faaliyetid], [FaaliyetAdı]) VALUES (9, N'Sevkiyat')
SET IDENTITY_INSERT [dbo].[Faaliyetler] OFF
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (1)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (2)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (3)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (4)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (6)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (10)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (13)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (15)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (16)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (19)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (20)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (21)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (22)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (23)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (24)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (25)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (26)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (28)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (29)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (30)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (2031)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (1)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (2)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (3)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (4)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (6)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (10)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (13)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (15)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (16)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (19)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (20)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (21)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (22)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (23)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (24)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (25)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (26)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (28)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (29)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (30)
INSERT [dbo].[FaaliyetMaliyet] ([Giderid]) VALUES (2031)
SET IDENTITY_INSERT [dbo].[Giderler] ON 

INSERT [dbo].[Giderler] ([Giderid], [HesapKodu], [HesapAdı], [Tutar]) VALUES (1, N'730.01.001', N'işçi ücret giderleri', N'6.001.120,16')
INSERT [dbo].[Giderler] ([Giderid], [HesapKodu], [HesapAdı], [Tutar]) VALUES (2, N'730.01.002', N'sgk primi iş veren payı', N'1.198.534,47')
INSERT [dbo].[Giderler] ([Giderid], [HesapKodu], [HesapAdı], [Tutar]) VALUES (3, N'730.01.003', N'işsizlik primi işveren payı', N'118.799,59')
INSERT [dbo].[Giderler] ([Giderid], [HesapKodu], [HesapAdı], [Tutar]) VALUES (4, N'730.01.004', N'kıdem ve ihbar tazminatı giderleri', N'82.552,21')
INSERT [dbo].[Giderler] ([Giderid], [HesapKodu], [HesapAdı], [Tutar]) VALUES (5, N'730.01.001', N'İplik Makina Yed.Parça Bak.ve Ona. Gid.', N'430.377,53')
INSERT [dbo].[Giderler] ([Giderid], [HesapKodu], [HesapAdı], [Tutar]) VALUES (6, N'730.01.002', N'İplik Nakliye ve Sigorta Giderleri', N'525.639,97')
INSERT [dbo].[Giderler] ([Giderid], [HesapKodu], [HesapAdı], [Tutar]) VALUES (7, N'730.01.003', N'İplik Büküm İşçiliği', N'563.507,66')
INSERT [dbo].[Giderler] ([Giderid], [HesapKodu], [HesapAdı], [Tutar]) VALUES (8, N'730.01.004', N'İplik Ambalajlama Giderleri', N'293.820,52')
INSERT [dbo].[Giderler] ([Giderid], [HesapKodu], [HesapAdı], [Tutar]) VALUES (9, N'730.01.005', N'İplik Tesisi Amortisman Giderleri', N'2.092.579,09')
INSERT [dbo].[Giderler] ([Giderid], [HesapKodu], [HesapAdı], [Tutar]) VALUES (10, N'730.01.006', N'Finansal Kiralama Giderleri', N'339.766,34')
INSERT [dbo].[Giderler] ([Giderid], [HesapKodu], [HesapAdı], [Tutar]) VALUES (11, N'730.01.007', N'İplik Boyama İşçiliği', N'6.676,96')
INSERT [dbo].[Giderler] ([Giderid], [HesapKodu], [HesapAdı], [Tutar]) VALUES (12, N'730.02.001', N'Halı Makina Yed.Parça Bak.ve Onarım Gid.', N'831.198,02')
INSERT [dbo].[Giderler] ([Giderid], [HesapKodu], [HesapAdı], [Tutar]) VALUES (13, N'730.02.002', N'Ambalajlama Giderleri', N'730.467,95')
INSERT [dbo].[Giderler] ([Giderid], [HesapKodu], [HesapAdı], [Tutar]) VALUES (14, N'730.02.003', N'Halı Tesisi Amortisman Giderleri', N'5.922.139,86')
INSERT [dbo].[Giderler] ([Giderid], [HesapKodu], [HesapAdı], [Tutar]) VALUES (15, N'730.02.004', N'Dokuma Tezgahı Sigorta Giderleri', N'50.919,17')
INSERT [dbo].[Giderler] ([Giderid], [HesapKodu], [HesapAdı], [Tutar]) VALUES (16, N'730.03.001', N'Apre Makina Yed.Parça Bak.ve Onarım Gid.', N'11.373,14')
INSERT [dbo].[Giderler] ([Giderid], [HesapKodu], [HesapAdı], [Tutar]) VALUES (17, N'730.03.002', N'Halı Oyma İşçiliği', N'30.372,83')
INSERT [dbo].[Giderler] ([Giderid], [HesapKodu], [HesapAdı], [Tutar]) VALUES (18, N'730.03.003', N'Muhtelif Giderler', N'519.531,37')
INSERT [dbo].[Giderler] ([Giderid], [HesapKodu], [HesapAdı], [Tutar]) VALUES (19, N'730.03.004', N'Apre Bölümü Amortisman Giderleri', N'248.059,98')
INSERT [dbo].[Giderler] ([Giderid], [HesapKodu], [HesapAdı], [Tutar]) VALUES (20, N'730.04.002', N'Muhtelif Giderler', N'988.002,29')
INSERT [dbo].[Giderler] ([Giderid], [HesapKodu], [HesapAdı], [Tutar]) VALUES (21, N'730.04.003', N'Ulaşım Giderleri', N'711.780,68')
INSERT [dbo].[Giderler] ([Giderid], [HesapKodu], [HesapAdı], [Tutar]) VALUES (22, N'730.04.004', N'Yemek Giderleri', N'383.762,08')
INSERT [dbo].[Giderler] ([Giderid], [HesapKodu], [HesapAdı], [Tutar]) VALUES (23, N'730.04.005', N'SuGiderleri', N'61.544,65')
INSERT [dbo].[Giderler] ([Giderid], [HesapKodu], [HesapAdı], [Tutar]) VALUES (24, N'730.04.006', N'Doğalgaz Gideri', N'791.779,70')
INSERT [dbo].[Giderler] ([Giderid], [HesapKodu], [HesapAdı], [Tutar]) VALUES (25, N'730.04.007', N'Elektrik Giderleri', N'4.707.206,29')
INSERT [dbo].[Giderler] ([Giderid], [HesapKodu], [HesapAdı], [Tutar]) VALUES (26, N'730.04.008', N'Bina Amortismanları', N'169.497,43')
INSERT [dbo].[Giderler] ([Giderid], [HesapKodu], [HesapAdı], [Tutar]) VALUES (27, N'730.04.009', N'Araç Amortismanları', N'351.343,88')
INSERT [dbo].[Giderler] ([Giderid], [HesapKodu], [HesapAdı], [Tutar]) VALUES (28, N'730.04.010', N'İşçi Servis Giderleri', N'20.580,00')
INSERT [dbo].[Giderler] ([Giderid], [HesapKodu], [HesapAdı], [Tutar]) VALUES (29, N'730.04.011', N'İthalat Giderleri', N'2.185.878,44')
INSERT [dbo].[Giderler] ([Giderid], [HesapKodu], [HesapAdı], [Tutar]) VALUES (30, N'730.04.012', N'Sigorta Giderleri', N'108.491,19')
INSERT [dbo].[Giderler] ([Giderid], [HesapKodu], [HesapAdı], [Tutar]) VALUES (31, N'730.04.013', N'İplik Boyama Giderleri', N'22.906,32')
INSERT [dbo].[Giderler] ([Giderid], [HesapKodu], [HesapAdı], [Tutar]) VALUES (2031, N'730.05.001', N'İş makinesi Amortismanı', N'94852,8')
SET IDENTITY_INSERT [dbo].[Giderler] OFF
SET IDENTITY_INSERT [dbo].[KaynakMaliyetEtkenleri] ON 

INSERT [dbo].[KaynakMaliyetEtkenleri] ([KMEid], [KMEAdi]) VALUES (1, N'Personel Sayısı')
INSERT [dbo].[KaynakMaliyetEtkenleri] ([KMEid], [KMEAdi]) VALUES (2, N'Kullanılan Alan')
INSERT [dbo].[KaynakMaliyetEtkenleri] ([KMEid], [KMEAdi]) VALUES (3, N'Direkt')
INSERT [dbo].[KaynakMaliyetEtkenleri] ([KMEid], [KMEAdi]) VALUES (4, N'Belirlenen Oranlar')
INSERT [dbo].[KaynakMaliyetEtkenleri] ([KMEid], [KMEAdi]) VALUES (5, N'Belirlenen Tutar')
INSERT [dbo].[KaynakMaliyetEtkenleri] ([KMEid], [KMEAdi]) VALUES (6, N'İş Makinesi Sayısı')
SET IDENTITY_INSERT [dbo].[KaynakMaliyetEtkenleri] OFF
SET IDENTITY_INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ON 

INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1, 1, 1, 1, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (2, 1, 1, 2, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (3, 1, 1, 3, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (4, 1, 1, 4, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (5, 1, 1, 5, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (6, 1, 1, 6, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (7, 1, 1, 7, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (8, 1, 1, 8, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (9, 1, 1, 9, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (10, 2, 1, 1, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (11, 2, 1, 2, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1010, 2, 1, 3, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1013, 2, 1, 4, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1014, 2, 1, 5, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1015, 2, 1, 6, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1016, 2, 1, 7, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1017, 2, 1, 8, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1018, 2, 1, 9, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1021, 3, 1, 1, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1022, 3, 1, 2, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1023, 3, 1, 3, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1024, 3, 1, 4, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1025, 3, 1, 5, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1026, 3, 1, 6, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1027, 3, 1, 7, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1028, 3, 1, 8, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1029, 3, 1, 9, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1030, 4, 1, 1, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1031, 4, 1, 2, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1032, 4, 1, 3, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1033, 4, 1, 4, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1034, 4, 1, 5, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1035, 4, 1, 6, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1036, 4, 1, 7, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1037, 4, 1, 8, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1038, 4, 1, 9, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1039, 26, 2, 1, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1040, 26, 2, 2, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1041, 26, 2, 3, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1042, 26, 2, 4, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1043, 26, 2, 5, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1044, 26, 2, 6, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1045, 26, 2, 7, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1046, 26, 2, 8, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1047, 26, 2, 9, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1048, 19, 3, 1, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1049, 19, 3, 2, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1050, 19, 3, 3, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1051, 19, 3, 4, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1052, 19, 3, 5, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1053, 19, 3, 6, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1054, 19, 3, 7, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1055, 19, 3, 8, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1056, 19, 3, 9, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1057, 6, 3, 1, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1058, 6, 3, 2, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1059, 6, 3, 3, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1060, 6, 3, 4, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1061, 6, 3, 5, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1062, 6, 3, 6, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1063, 6, 3, 7, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1064, 6, 3, 8, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1065, 6, 3, 9, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1066, 10, 4, 1, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1067, 10, 4, 2, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1068, 10, 4, 3, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1069, 10, 4, 4, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1070, 10, 4, 5, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1071, 10, 4, 6, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1072, 10, 4, 7, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1073, 10, 4, 8, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1074, 10, 4, 9, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1075, 13, 3, 1, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1076, 13, 3, 2, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1077, 13, 3, 3, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1078, 13, 3, 4, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1079, 13, 3, 5, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1080, 13, 3, 6, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1081, 13, 3, 7, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1082, 13, 3, 8, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1083, 13, 3, 9, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1084, 15, 3, 1, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1085, 15, 3, 2, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1086, 15, 3, 3, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1087, 15, 3, 4, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1088, 15, 3, 5, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1089, 15, 3, 6, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1090, 15, 3, 7, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1091, 15, 3, 8, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1092, 15, 3, 9, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1093, 16, 3, 1, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1094, 16, 3, 2, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1095, 16, 3, 3, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1096, 16, 3, 4, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1097, 16, 3, 5, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1098, 16, 3, 6, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1099, 16, 3, 7, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1100, 16, 3, 8, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1101, 16, 3, 9, 0)
GO
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1102, 20, 4, 1, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1104, 20, 4, 2, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1105, 20, 4, 3, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1106, 20, 4, 4, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1107, 20, 4, 5, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1108, 20, 4, 6, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1109, 20, 4, 7, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1110, 20, 4, 8, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1111, 20, 4, 9, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1112, 21, 1, 1, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1113, 21, 1, 2, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1114, 21, 1, 3, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1115, 21, 1, 4, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1116, 21, 1, 5, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1117, 21, 1, 6, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1118, 21, 1, 7, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1119, 21, 1, 8, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1120, 21, 1, 9, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1121, 22, 1, 1, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1122, 22, 1, 2, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1123, 22, 1, 3, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1124, 22, 1, 4, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1125, 22, 1, 5, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1126, 22, 1, 6, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1127, 22, 1, 7, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1128, 22, 1, 8, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1129, 22, 1, 9, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1130, 23, 2, 1, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1131, 23, 2, 2, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1132, 23, 2, 3, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1133, 23, 2, 4, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1134, 23, 2, 5, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1135, 23, 2, 6, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1136, 23, 2, 7, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1137, 23, 2, 8, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1138, 23, 2, 9, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1139, 24, 2, 1, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1140, 24, 2, 2, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1141, 24, 2, 3, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1142, 24, 2, 4, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1143, 24, 2, 5, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1144, 24, 2, 6, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1145, 24, 2, 7, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1146, 24, 2, 8, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1147, 24, 2, 9, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1148, 25, 5, 1, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1149, 25, 5, 2, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1150, 25, 5, 3, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1151, 25, 5, 4, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1152, 25, 5, 5, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1153, 25, 5, 6, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1154, 25, 5, 7, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1155, 25, 5, 8, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1156, 25, 5, 9, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1157, 28, 1, 1, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1158, 28, 1, 2, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1159, 28, 1, 3, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1160, 28, 1, 4, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1161, 28, 1, 5, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1162, 28, 1, 6, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1163, 28, 1, 7, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1164, 28, 1, 8, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1165, 28, 1, 9, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1166, 29, 3, 1, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1167, 29, 3, 2, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1168, 29, 3, 3, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1169, 29, 3, 4, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1170, 29, 3, 5, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1171, 29, 3, 6, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1172, 29, 3, 7, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1173, 29, 3, 8, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1174, 29, 3, 9, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1175, 30, 3, 1, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1176, 30, 3, 2, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1177, 30, 3, 3, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1178, 30, 3, 4, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1179, 30, 3, 5, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1180, 30, 3, 6, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1181, 30, 3, 7, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1182, 30, 3, 8, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1183, 30, 3, 9, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1184, 2031, 6, 1, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1185, 2031, 6, 2, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1186, 2031, 6, 3, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1187, 2031, 6, 4, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1188, 2031, 6, 5, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1189, 2031, 6, 6, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1190, 2031, 6, 7, 0)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1191, 2031, 6, 8, 1)
INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] ([MFIid], [GiderId], [KMEid], [Faaliyetid], [Onay]) VALUES (1192, 2031, 6, 9, 1)
SET IDENTITY_INSERT [dbo].[MaaliyetFaaliyetIliskilendirme] OFF
ALTER TABLE [dbo].[FaaliyetKaynakMaliyet]  WITH CHECK ADD  CONSTRAINT [FK_FaaliyetKaynakMaliyet_Faaliyetler] FOREIGN KEY([Faaliyetid])
REFERENCES [dbo].[Faaliyetler] ([Faaliyetid])
GO
ALTER TABLE [dbo].[FaaliyetKaynakMaliyet] CHECK CONSTRAINT [FK_FaaliyetKaynakMaliyet_Faaliyetler]
GO
ALTER TABLE [dbo].[FaaliyetKaynakMaliyet]  WITH CHECK ADD  CONSTRAINT [FK_FaaliyetKaynakMaliyet_KaynakMaliyetEtkenleri] FOREIGN KEY([KMEid])
REFERENCES [dbo].[KaynakMaliyetEtkenleri] ([KMEid])
GO
ALTER TABLE [dbo].[FaaliyetKaynakMaliyet] CHECK CONSTRAINT [FK_FaaliyetKaynakMaliyet_KaynakMaliyetEtkenleri]
GO
ALTER TABLE [dbo].[MaaliyetFaaliyetIliskilendirme]  WITH CHECK ADD  CONSTRAINT [FK_MaaliyetFaaliyetIliskilendirme_Faaliyetler] FOREIGN KEY([Faaliyetid])
REFERENCES [dbo].[Faaliyetler] ([Faaliyetid])
GO
ALTER TABLE [dbo].[MaaliyetFaaliyetIliskilendirme] CHECK CONSTRAINT [FK_MaaliyetFaaliyetIliskilendirme_Faaliyetler]
GO
ALTER TABLE [dbo].[MaaliyetFaaliyetIliskilendirme]  WITH CHECK ADD  CONSTRAINT [FK_MaaliyetFaaliyetIliskilendirme_Giderler] FOREIGN KEY([GiderId])
REFERENCES [dbo].[Giderler] ([Giderid])
GO
ALTER TABLE [dbo].[MaaliyetFaaliyetIliskilendirme] CHECK CONSTRAINT [FK_MaaliyetFaaliyetIliskilendirme_Giderler]
GO
ALTER TABLE [dbo].[MaaliyetFaaliyetIliskilendirme]  WITH CHECK ADD  CONSTRAINT [FK_MaaliyetFaaliyetIliskilendirme_KaynakMaliyetEtkenleri] FOREIGN KEY([KMEid])
REFERENCES [dbo].[KaynakMaliyetEtkenleri] ([KMEid])
GO
ALTER TABLE [dbo].[MaaliyetFaaliyetIliskilendirme] CHECK CONSTRAINT [FK_MaaliyetFaaliyetIliskilendirme_KaynakMaliyetEtkenleri]
GO
/****** Object:  StoredProcedure [dbo].[Iliskilendirme]    Script Date: 7.03.2022 14:49:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- ============================================

CREATE PROCEDURE [dbo].[Iliskilendirme]
AS

DECLARE @cols AS NVARCHAR(MAX)
   DECLARE @query  AS NVARCHAR(MAX)
BEGIN
SET @cols = STUFF((SELECT distinct ',' + QUOTENAME(c.[FaaliyetAdı])
            FROM [Faaliyetler] c
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)')
        ,1,1,'')

set @query= ' SELECT         *
FROM  (SELECT Giderid,dbo.Giderler.Hesapkodu+ '' ''+ dbo.Giderler.HesapAdı as hesapadı,
 dbo.KaynakMaliyetEtkenleri.KMEAdi,
 cast(dbo.MaaliyetFaaliyetIliskilendirme.Onay AS int) onay,
 dbo.Faaliyetler.FaaliyetAdı
 FROM dbo.MaaliyetFaaliyetIliskilendirme
 INNER JOIN dbo.KaynakMaliyetEtkenleri ON dbo.KaynakMaliyetEtkenleri.KMEid = dbo.MaaliyetFaaliyetIliskilendirme.KMEid
 INNER JOIN dbo.Giderler ON dbo.MaaliyetFaaliyetIliskilendirme.GiderId = dbo.Giderler.Giderid
 INNER JOIN dbo.Faaliyetler ON dbo.Faaliyetler.Faaliyetid = dbo.MaaliyetFaaliyetIliskilendirme.Faaliyetid) maaliyet_faaliyet
 PIVOT (sum(onay) FOR FaaliyetAdı IN
 (' + @cols + ')) pivotee '

execute(@query)

END
GO
/****** Object:  StoredProcedure [dbo].[SP_FaaliyeKaynakMaliyet_Oran]    Script Date: 7.03.2022 14:49:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_FaaliyeKaynakMaliyet_Oran]
@oran Decimal(18,2),
@Faaliyetid int,
@KMEid int
AS
SELECT        CAST(ROUND(o.Adet * 1.0 / i.kmc, 2, 1) AS decimal(18, 2)) AS oran, o.Faaliyetid, o.KMEid
FROM            dbo.FaaliyetKaynakMaliyet AS o INNER JOIN
                             (SELECT        SUM(Adet) AS kmc, KMEid
                               FROM            dbo.FaaliyetKaynakMaliyet
                               GROUP BY KMEid) AS i ON o.KMEid = i.KMEid
GO
/****** Object:  StoredProcedure [dbo].[SP_Maaliyet_Faaliyet_Iliskilendirme]    Script Date: 7.03.2022 14:49:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Maaliyet_Faaliyet_Iliskilendirme]
AS
set fmtonly off
DECLARE @cols AS NVARCHAR(MAX)
   DECLARE @query  AS NVARCHAR(MAX)
BEGIN

SET @cols = STUFF((SELECT distinct ',' + QUOTENAME(c.[FaaliyetAdı])
            FROM [Faaliyetler] c
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)')
        ,1,1,'')

set @query= ' SELECT         *
FROM  (SELECT Giderid,dbo.Giderler.Hesapkodu+ '' ''+ dbo.Giderler.HesapAdı as hesapadı,
 dbo.KaynakMaliyetEtkenleri.KMEAdi,
 cast(dbo.MaaliyetFaaliyetIliskilendirme.Onay AS int) onay,
 dbo.Faaliyetler.FaaliyetAdı
 FROM dbo.MaaliyetFaaliyetIliskilendirme
 INNER JOIN dbo.KaynakMaliyetEtkenleri ON dbo.KaynakMaliyetEtkenleri.KMEid = dbo.MaaliyetFaaliyetIliskilendirme.KMEid
 INNER JOIN dbo.Giderler ON dbo.MaaliyetFaaliyetIliskilendirme.GiderId = dbo.Giderler.Giderid
 INNER JOIN dbo.Faaliyetler ON dbo.Faaliyetler.Faaliyetid = dbo.MaaliyetFaaliyetIliskilendirme.Faaliyetid) maaliyet_faaliyet
 PIVOT (sum(onay) FOR FaaliyetAdı IN
 (' + @cols + ')) pivotee '

execute(@query)

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Maaliyet_Faaliyet_Iliskilendirme2]    Script Date: 7.03.2022 14:49:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Maaliyet_Faaliyet_Iliskilendirme2]
AS

DECLARE @cols AS NVARCHAR(MAX)
   DECLARE @query  AS NVARCHAR(MAX)
BEGIN
set fmtonly off
SET @cols = STUFF((SELECT distinct ',' + QUOTENAME(c.[FaaliyetAdı])
            FROM [Faaliyetler] c
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)')
        ,1,1,'')

set @query= ' SELECT         *
FROM  (SELECT Giderid,dbo.Giderler.Hesapkodu+ '' ''+ dbo.Giderler.HesapAdı as hesapadı,
 dbo.KaynakMaliyetEtkenleri.KMEAdi,
 cast(dbo.MaaliyetFaaliyetIliskilendirme.Onay AS int) onay,
 dbo.Faaliyetler.FaaliyetAdı
 FROM dbo.MaaliyetFaaliyetIliskilendirme
 INNER JOIN dbo.KaynakMaliyetEtkenleri ON dbo.KaynakMaliyetEtkenleri.KMEid = dbo.MaaliyetFaaliyetIliskilendirme.KMEid
 INNER JOIN dbo.Giderler ON dbo.MaaliyetFaaliyetIliskilendirme.GiderId = dbo.Giderler.Giderid
 INNER JOIN dbo.Faaliyetler ON dbo.Faaliyetler.Faaliyetid = dbo.MaaliyetFaaliyetIliskilendirme.Faaliyetid) maaliyet_faaliyet
 PIVOT (sum(onay) FOR FaaliyetAdı IN
 (' + @cols + ')) pivotee '

execute(@query)

END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[29] 4[4] 2[17] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "o"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "i"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 175
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OranView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OranView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 13
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'sp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'sp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'sp_iliski'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'sp_iliski'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[2] 2[17] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "sp_iliski"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 444
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbl"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 85
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 13
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'sp_mfi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'sp_mfi'
GO
USE [master]
GO
ALTER DATABASE [Bitirmeprojesidb] SET  READ_WRITE 
GO
