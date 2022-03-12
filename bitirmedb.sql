USE [master]
GO
/****** Object:  Database [Bitirme]    Script Date: 12.03.2022 22:25:54 ******/
CREATE DATABASE [Bitirme]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bitirme', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Bitirme.mdf' , SIZE = 16384KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Bitirme_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Bitirme_log.ldf' , SIZE = 10240KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Bitirme] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bitirme].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bitirme] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bitirme] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bitirme] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bitirme] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bitirme] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bitirme] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bitirme] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bitirme] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bitirme] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bitirme] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bitirme] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bitirme] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bitirme] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bitirme] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bitirme] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bitirme] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bitirme] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bitirme] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bitirme] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bitirme] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bitirme] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bitirme] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bitirme] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Bitirme] SET  MULTI_USER 
GO
ALTER DATABASE [Bitirme] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bitirme] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bitirme] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bitirme] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Bitirme]
GO
/****** Object:  Table [dbo].[Faaliyet]    Script Date: 12.03.2022 22:25:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faaliyet](
	[FaaliyetId] [int] IDENTITY(1,1) NOT NULL,
	[FaaliyetAd] [nvarchar](90) NULL,
 CONSTRAINT [PK_Faaliyet] PRIMARY KEY CLUSTERED 
(
	[FaaliyetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gider]    Script Date: 12.03.2022 22:25:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gider](
	[GiderId] [int] IDENTITY(1,1) NOT NULL,
	[HesapKodu] [varchar](90) NULL,
	[HesapAd] [varchar](90) NULL,
	[Tutar] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Gider] PRIMARY KEY CLUSTERED 
(
	[GiderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KaynakMaliyetEtken]    Script Date: 12.03.2022 22:25:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KaynakMaliyetEtken](
	[KMEId] [int] IDENTITY(1,1) NOT NULL,
	[KMEAd] [varchar](90) NULL,
 CONSTRAINT [PK_KaynakMaliyetEtken] PRIMARY KEY CLUSTERED 
(
	[KMEId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Maliyet]    Script Date: 12.03.2022 22:25:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maliyet](
	[MaliyetId] [int] IDENTITY(1,1) NOT NULL,
	[GiderId] [int] NULL,
	[FaaliyetId] [int] NULL,
	[KMEId] [int] NULL,
	[Onay] [bit] NULL,
	[Adet] [int] NULL,
 CONSTRAINT [PK_Maliyet] PRIMARY KEY CLUSTERED 
(
	[MaliyetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Oran]    Script Date: 12.03.2022 22:25:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Oran]
AS
SELECT        m.MaliyetId, CAST(m.Adet AS decimal(18, 2)) / t.ToplamAdet AS Oran
FROM            dbo.Maliyet AS m INNER JOIN
                             (SELECT        SUM(Adet) AS ToplamAdet, KMEId
                               FROM            dbo.Maliyet
                               GROUP BY KMEId) AS t ON m.KMEId = t.KMEId INNER JOIN
                         dbo.Maliyet AS Maliyet_1 ON m.MaliyetId = Maliyet_1.MaliyetId
GO
/****** Object:  View [dbo].[GenelTutar]    Script Date: 12.03.2022 22:25:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GenelTutar]
AS
SELECT        dbo.Oran.MaliyetId, dbo.Oran.Oran, dbo.Maliyet.MaliyetId AS Expr1, dbo.Maliyet.GiderId, dbo.Faaliyet.FaaliyetAd, dbo.Maliyet.FaaliyetId, dbo.Maliyet.KMEId, dbo.KaynakMaliyetEtken.KMEAd, dbo.Maliyet.Onay, 
                         dbo.Maliyet.Adet, dbo.Gider.GiderId AS Expr2, dbo.Gider.HesapKodu, dbo.Gider.HesapAd, dbo.Gider.Tutar, dbo.Gider.Tutar * dbo.Oran.Oran AS Geneltutar
FROM            dbo.Oran INNER JOIN
                         dbo.Maliyet ON dbo.Oran.MaliyetId = dbo.Maliyet.MaliyetId INNER JOIN
                         dbo.Gider ON dbo.Maliyet.GiderId = dbo.Gider.GiderId INNER JOIN
                         dbo.Faaliyet ON dbo.Maliyet.FaaliyetId = dbo.Faaliyet.FaaliyetId INNER JOIN
                         dbo.KaynakMaliyetEtken ON dbo.Maliyet.KMEId = dbo.KaynakMaliyetEtken.KMEId
GO
SET IDENTITY_INSERT [dbo].[Faaliyet] ON 

INSERT [dbo].[Faaliyet] ([FaaliyetId], [FaaliyetAd]) VALUES (1, N'İlk Madde Depolama')
INSERT [dbo].[Faaliyet] ([FaaliyetId], [FaaliyetAd]) VALUES (2, N'Desen Çizim')
INSERT [dbo].[Faaliyet] ([FaaliyetId], [FaaliyetAd]) VALUES (3, N'Dokuma')
INSERT [dbo].[Faaliyet] ([FaaliyetId], [FaaliyetAd]) VALUES (4, N'Kalite Kontrol')
INSERT [dbo].[Faaliyet] ([FaaliyetId], [FaaliyetAd]) VALUES (5, N'Apreleme')
INSERT [dbo].[Faaliyet] ([FaaliyetId], [FaaliyetAd]) VALUES (6, N'Kesim ve Overlok')
INSERT [dbo].[Faaliyet] ([FaaliyetId], [FaaliyetAd]) VALUES (7, N'Ambalajlama')
INSERT [dbo].[Faaliyet] ([FaaliyetId], [FaaliyetAd]) VALUES (8, N'Depolama')
INSERT [dbo].[Faaliyet] ([FaaliyetId], [FaaliyetAd]) VALUES (9, N'Sevkiyat')
SET IDENTITY_INSERT [dbo].[Faaliyet] OFF
SET IDENTITY_INSERT [dbo].[Gider] ON 

INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (1, N'720.01.001', N'İşçi Ücret Giderleri', CAST(2404760.72 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (2, N'720.01.002', N'SGK Primi İşveren Payı', CAST(1198534.47 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (3, N'720.01.003', N'İşsizlik Primi İşveren Payı', CAST(118799.59 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (4, N'720.01.004', N'Kıdem Ve İhbar Tazminatı Giderleri', CAST(82552.21 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (5, N'730.01.001', N'İplik Makina Yed.Parça Bak.ve Ona. Gid.', CAST(430377.53 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (6, N'730.01.002', N'İplik Nakliye ve Sigorta Giderleri', CAST(525639.97 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (7, N'730.01.003', N'İplik Büküm İşçiliği', CAST(563507.66 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (8, N'730.01.004', N'İplik Ambalajlama Giderleri', CAST(293820.52 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (9, N'730.01.005', N'İplik Tesisi Amortisman Giderleri', CAST(2092579.09 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (10, N'730.01.006', N'Finansal Kiralama Giderleri', CAST(339766.34 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (11, N'730.01.007', N'İplik Boyama İşçiliği', CAST(6676.96 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (12, N'730.02.001', N'Halı Makina Yed.Parça Bak.ve Onarım Gid.', CAST(831198.02 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (13, N'730.02.002', N'Ambalajlama Giderleri', CAST(730467.95 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (14, N'730.02.003', N'Halı Tesisi Amortisman Giderleri', CAST(5922139.86 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (15, N'730.02.004', N'Dokuma Tezgahı Sigorta Giderleri', CAST(50919.17 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (16, N'730.03.001', N'Apre Makina Yed.Parça Bak.ve Onarım Gid.', CAST(11373.14 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (17, N'730.03.002', N'Halı Oyma İşçiliği', CAST(30372.83 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (18, N'730.03.003', N'Muhtelif Giderler', CAST(519531.37 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (19, N'730.03.004', N'Apre Bölümü Amortisman Giderleri', CAST(248059.98 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (20, N'730.04.002', N'Muhtelif Giderler', CAST(988002.29 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (21, N'730.04.003', N'Ulaşım Giderleri', CAST(711780.68 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (22, N'730.04.004', N'Yemek Giderleri', CAST(383762.08 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (23, N'730.04.005', N'Su Gideri', CAST(61544.65 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (24, N'730.04.006', N'Doğalgaz Gideri', CAST(791779.70 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (25, N'730.04.007', N'Elektrik Gideri', CAST(4707206.29 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (26, N'730.04.008', N'Bina Amortismanları', CAST(169497.43 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (27, N'730.04.009', N'Araç Amortismanları', CAST(351343.88 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (28, N'730.04.010', N'İşçi Servis Giderleri', CAST(20580.00 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (29, N'730.04.011', N'İthalat Giderleri', CAST(2185878.44 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (30, N'730.04.012', N'Sigorta Giderleri', CAST(108491.19 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (31, N'730.04.013', N'İplik Boyama Giderleri', CAST(22906.32 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Gider] OFF
SET IDENTITY_INSERT [dbo].[KaynakMaliyetEtken] ON 

INSERT [dbo].[KaynakMaliyetEtken] ([KMEId], [KMEAd]) VALUES (1, N'Personel Sayısı')
INSERT [dbo].[KaynakMaliyetEtken] ([KMEId], [KMEAd]) VALUES (2, N'Kullanılan Alan')
INSERT [dbo].[KaynakMaliyetEtken] ([KMEId], [KMEAd]) VALUES (3, N'Direkt')
INSERT [dbo].[KaynakMaliyetEtken] ([KMEId], [KMEAd]) VALUES (4, N'Belirlenen Oranlar')
INSERT [dbo].[KaynakMaliyetEtken] ([KMEId], [KMEAd]) VALUES (5, N'Belirlenen Tutar')
INSERT [dbo].[KaynakMaliyetEtken] ([KMEId], [KMEAd]) VALUES (6, N'İş Makinesi Sayısı')
SET IDENTITY_INSERT [dbo].[KaynakMaliyetEtken] OFF
SET IDENTITY_INSERT [dbo].[Maliyet] ON 

INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (3, 1, 1, 1, 1, 4)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (4, 1, 2, 1, 1, 5)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (5, 1, 3, 1, 1, 6)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (6, 1, 4, 1, 1, 8)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (7, 1, 5, 1, 1, 7)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (8, 1, 6, 1, 1, 12)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (9, 1, 7, 1, 1, 10)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (10, 1, 8, 1, 1, 4)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (11, 1, 9, 1, 1, 6)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (1003, 26, 1, 2, 1, 4850)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (1004, 26, 2, 2, 1, 150)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (1005, 26, 3, 2, 1, 1200)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (1006, 26, 4, 2, 1, 250)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (1007, 26, 5, 2, 1, 750)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (1008, 26, 6, 2, 1, 1000)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (1009, 26, 7, 2, 1, 300)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (1010, 26, 8, 2, 1, 6000)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (1011, 26, 9, 2, 1, 500)
SET IDENTITY_INSERT [dbo].[Maliyet] OFF
ALTER TABLE [dbo].[Maliyet]  WITH CHECK ADD  CONSTRAINT [FK_Maliyet_Faaliyet] FOREIGN KEY([FaaliyetId])
REFERENCES [dbo].[Faaliyet] ([FaaliyetId])
GO
ALTER TABLE [dbo].[Maliyet] CHECK CONSTRAINT [FK_Maliyet_Faaliyet]
GO
ALTER TABLE [dbo].[Maliyet]  WITH CHECK ADD  CONSTRAINT [FK_Maliyet_Gider] FOREIGN KEY([GiderId])
REFERENCES [dbo].[Gider] ([GiderId])
GO
ALTER TABLE [dbo].[Maliyet] CHECK CONSTRAINT [FK_Maliyet_Gider]
GO
ALTER TABLE [dbo].[Maliyet]  WITH CHECK ADD  CONSTRAINT [FK_Maliyet_KaynakMaliyetEtken] FOREIGN KEY([KMEId])
REFERENCES [dbo].[KaynakMaliyetEtken] ([KMEId])
GO
ALTER TABLE [dbo].[Maliyet] CHECK CONSTRAINT [FK_Maliyet_KaynakMaliyetEtken]
GO
/****** Object:  StoredProcedure [dbo].[SP_Tutar]    Script Date: 12.03.2022 22:25:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
Create PROCEDURE [dbo].[SP_Tutar]
AS
SET FMTONLY OFF
DECLARE @cols AS NVARCHAR(MAX)
   DECLARE @query  AS NVARCHAR(MAX)
BEGIN
SET @cols = STUFF((SELECT distinct ',' + QUOTENAME(c.[FaaliyetAd])
            FROM [Faaliyet] c
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)')
        ,1,1,'')

set @query= ' SELECT         *
FROM  (SELECT Expr2,dbo.Gider.HesapKodu+ '' ''+ dbo.Gider.HesapAd as hesapadı,
 dbo.KaynakMaliyetEtken.KMEAd, dbo.GenelTutar.geneltutar as onay,
 dbo.Faaliyet.FaaliyetAd
 FROM dbo.GenelTutar
 INNER JOIN dbo.KaynakMaliyetEtken ON dbo.KaynakMaliyetEtken.KMEId = dbo.GenelTutar.KMEId
 INNER JOIN dbo.Gider ON dbo.GenelTutar.GiderId = dbo.Gider.GiderId
 INNER JOIN dbo.Faaliyet ON dbo.Faaliyet.FaaliyetId = dbo.GenelTutar.FaaliyetId) maaliyet_faaliyet
 PIVOT (sum(onay) FOR FaaliyetAd IN
 (' + @cols + ')) pivotee '

execute(@query)

END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[22] 4[7] 2[38] 3) )"
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
         Begin Table = "Oran"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 102
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Maliyet"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Gider"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Faaliyet"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 102
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "KaynakMaliyetEtken"
            Begin Extent = 
               Top = 6
               Left = 870
               Bottom = 102
               Right = 1040
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
      Begin ColumnWidths = 15
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
         Width = 1500
         Wid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GenelTutar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'th = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GenelTutar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GenelTutar'
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
         Begin Table = "m"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 102
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Maliyet_1"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Oran'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Oran'
GO
USE [master]
GO
ALTER DATABASE [Bitirme] SET  READ_WRITE 
GO
