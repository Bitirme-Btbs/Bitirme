USE [master]
GO
/****** Object:  Database [Bitirme]    Script Date: 24.05.2022 01:13:56 ******/
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
/****** Object:  Table [dbo].[BirimMaliyet]    Script Date: 24.05.2022 01:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BirimMaliyet](
	[BM_Id] [int] IDENTITY(1,1) NOT NULL,
	[Urun_ID] [int] NULL,
	[Dimmg] [decimal](18, 2) NULL,
	[Dig] [decimal](18, 2) NULL,
	[BirimDagitimOlcu] [int] NULL,
 CONSTRAINT [PK_BirimMaliyet] PRIMARY KEY CLUSTERED 
(
	[BM_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DagıtımOlcu]    Script Date: 24.05.2022 01:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DagıtımOlcu](
	[DagıtımOlcu_Id] [int] IDENTITY(1,1) NOT NULL,
	[DagıtımOlcu_Ad] [varchar](max) NULL,
 CONSTRAINT [PK_DagıtımOlcu] PRIMARY KEY CLUSTERED 
(
	[DagıtımOlcu_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DagitimOlcuFaaliyetiliski]    Script Date: 24.05.2022 01:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DagitimOlcuFaaliyetiliski](
	[Df_Id] [int] IDENTITY(1,1) NOT NULL,
	[DagitimOlcuId] [int] NULL,
	[FaaliyetId] [int] NULL,
 CONSTRAINT [PK_DagitimOlcuFaaliyetiliski] PRIMARY KEY CLUSTERED 
(
	[Df_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faaliyet]    Script Date: 24.05.2022 01:13:56 ******/
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
/****** Object:  Table [dbo].[Gider]    Script Date: 24.05.2022 01:13:56 ******/
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
/****** Object:  Table [dbo].[KaynakMaliyetEtken]    Script Date: 24.05.2022 01:13:56 ******/
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
/****** Object:  Table [dbo].[Maliyet]    Script Date: 24.05.2022 01:13:56 ******/
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
/****** Object:  Table [dbo].[MaliyetEndirektUretim]    Script Date: 24.05.2022 01:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaliyetEndirektUretim](
	[EUM_Id] [int] IDENTITY(1,1) NOT NULL,
	[Urun_Id] [int] NULL,
	[Toplam] [decimal](18, 2) NULL,
 CONSTRAINT [PK_MaliyetEndirektUretim] PRIMARY KEY CLUSTERED 
(
	[EUM_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaliyetUrun]    Script Date: 24.05.2022 01:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaliyetUrun](
	[MaliyetUrunId] [int] IDENTITY(1,1) NOT NULL,
	[UrunId] [int] NULL,
	[DagitimOlcuId] [int] NULL,
	[UrunDagitimAdet] [decimal](18, 3) NULL,
 CONSTRAINT [PK_MaliyetUrun] PRIMARY KEY CLUSTERED 
(
	[MaliyetUrunId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblBirimMaliyetTutar]    Script Date: 24.05.2022 01:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblBirimMaliyetTutar](
	[BMT_ID] [int] IDENTITY(1,1) NOT NULL,
	[Urunler] [nvarchar](max) NULL,
	[EndirekUM] [decimal](18, 2) NULL,
	[Dimmg] [decimal](18, 2) NULL,
	[Dig] [decimal](18, 2) NULL,
	[ToplamMaliyet] [decimal](18, 2) NULL,
	[BirimMaliyet] [decimal](18, 2) NULL,
 CONSTRAINT [PK_TblBirimMaliyetTutar] PRIMARY KEY CLUSTERED 
(
	[BMT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblToplamMaliyet]    Script Date: 24.05.2022 01:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblToplamMaliyet](
	[TMaliyet_ID] [int] IDENTITY(1,1) NOT NULL,
	[UrunAdi] [nvarchar](max) NULL,
	[EndirektToplami] [decimal](18, 2) NULL,
	[Dimmg] [decimal](18, 2) NULL,
	[Dig] [decimal](18, 2) NULL,
	[ToplamMaliyeti] [decimal](18, 2) NULL,
 CONSTRAINT [PK_TblToplamMaliyet] PRIMARY KEY CLUSTERED 
(
	[TMaliyet_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TutarUrunFaaliyet]    Script Date: 24.05.2022 01:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TutarUrunFaaliyet](
	[TUF_ID] [int] IDENTITY(1,1) NOT NULL,
	[Urun] [nvarchar](max) NULL,
	[Faaliyet] [nvarchar](max) NULL,
	[TutarTUF] [decimal](18, 5) NULL,
 CONSTRAINT [PK_TutarUrunFaaliyet] PRIMARY KEY CLUSTERED 
(
	[TUF_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urun]    Script Date: 24.05.2022 01:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urun](
	[UrunId] [int] IDENTITY(1,1) NOT NULL,
	[UrunAd] [varchar](max) NULL,
 CONSTRAINT [PK_Urun] PRIMARY KEY CLUSTERED 
(
	[UrunId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[OranUrunDagitim]    Script Date: 24.05.2022 01:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[OranUrunDagitim]
AS
SELECT        mu.MaliyetUrunId, mu.UrunDagitimAdet / t.total AS oran, mu.DagitimOlcuId, mu.UrunId, dbo.Urun.UrunAd
FROM            dbo.MaliyetUrun AS mu INNER JOIN
                             (SELECT        SUM(UrunDagitimAdet) AS total, DagitimOlcuId
                               FROM            dbo.MaliyetUrun
                               GROUP BY DagitimOlcuId) AS t ON mu.DagitimOlcuId = t.DagitimOlcuId INNER JOIN
                         dbo.Urun ON mu.UrunId = dbo.Urun.UrunId
GO
/****** Object:  View [dbo].[Oran]    Script Date: 24.05.2022 01:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Oran]
AS
SELECT        m.MaliyetId, CAST(m.Adet AS decimal(18, 2)) / t.ToplamAdet AS Oran
FROM            dbo.Maliyet AS m INNER JOIN
                             (SELECT        SUM(Adet) AS ToplamAdet, GiderId
                               FROM            dbo.Maliyet
                               GROUP BY GiderId) AS t ON m.GiderId = t.GiderId INNER JOIN
                         dbo.Maliyet AS Maliyet_1 ON m.MaliyetId = Maliyet_1.MaliyetId
GO
/****** Object:  View [dbo].[GenelTutar]    Script Date: 24.05.2022 01:13:56 ******/
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
/****** Object:  View [dbo].[ToplamFaaliyetTutar]    Script Date: 24.05.2022 01:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ToplamFaaliyetTutar]
AS
SELECT        g.FaaliyetId, t.toplam, g.FaaliyetAd
FROM            dbo.Faaliyet AS g INNER JOIN
                             (SELECT        SUM(Geneltutar) AS toplam, FaaliyetId
                               FROM            dbo.GenelTutar
                               GROUP BY FaaliyetId) AS t ON g.FaaliyetId = t.FaaliyetId
GO
/****** Object:  View [dbo].[UrunFaaliyetTutar]    Script Date: 24.05.2022 01:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UrunFaaliyetTutar]
AS
SELECT        dbo.OranUrunDagitim.UrunAd, dbo.ToplamFaaliyetTutar.FaaliyetAd,dbo.ToplamFaaliyetTutar.FaaliyetId, dbo.ToplamFaaliyetTutar.toplam * dbo.OranUrunDagitim.oran AS tutar, ROW_NUMBER() OVER (ORDER BY dbo.OranUrunDagitim.UrunAd) AS Number
FROM            dbo.DagitimOlcuFaaliyetiliski INNER JOIN
                         dbo.ToplamFaaliyetTutar ON dbo.DagitimOlcuFaaliyetiliski.FaaliyetId = dbo.ToplamFaaliyetTutar.FaaliyetId INNER JOIN
                         dbo.OranUrunDagitim ON dbo.DagitimOlcuFaaliyetiliski.DagitimOlcuId = dbo.OranUrunDagitim.DagitimOlcuId
GO
/****** Object:  View [dbo].[EndirektUretimMaliyeti]    Script Date: 24.05.2022 01:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[EndirektUretimMaliyeti]
AS
SELECT        dbo.Urun.UrunId, SUM(dbo.UrunFaaliyetTutar.tutar) AS Toplam
FROM            dbo.UrunFaaliyetTutar INNER JOIN
                         dbo.Urun ON dbo.UrunFaaliyetTutar.UrunAd = dbo.Urun.UrunAd
GROUP BY dbo.Urun.UrunId
GO
/****** Object:  View [dbo].[ToplamMaliyet]    Script Date: 24.05.2022 01:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ToplamMaliyet]
AS
SELECT        dbo.Urun.UrunId, dbo.Urun.UrunAd, dbo.MaliyetEndirektUretim.Toplam AS EndirektToplam, dbo.BirimMaliyet.Dimmg, dbo.BirimMaliyet.Dig, 
                         dbo.MaliyetEndirektUretim.Toplam + dbo.BirimMaliyet.Dimmg + dbo.BirimMaliyet.Dig AS ToplamMaliyet, dbo.BirimMaliyet.BirimDagitimOlcu, dbo.BirimMaliyet.Urun_ID
FROM            dbo.BirimMaliyet INNER JOIN
                         dbo.MaliyetEndirektUretim ON dbo.MaliyetEndirektUretim.Urun_Id = dbo.BirimMaliyet.Urun_ID INNER JOIN
                         dbo.Urun ON dbo.Urun.UrunId = dbo.BirimMaliyet.Urun_ID
GO
/****** Object:  View [dbo].[BirimMaliyetTutar]    Script Date: 24.05.2022 01:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BirimMaliyetTutar]
AS
SELECT        dbo.ToplamMaliyet.UrunId, dbo.ToplamMaliyet.UrunAd, dbo.ToplamMaliyet.EndirektToplam, dbo.ToplamMaliyet.Dimmg, dbo.ToplamMaliyet.Dig, dbo.ToplamMaliyet.ToplamMaliyet, dbo.ToplamMaliyet.BirimDagitimOlcu, 
                         dbo.MaliyetUrun.MaliyetUrunId, dbo.MaliyetUrun.UrunId AS Expr1, dbo.MaliyetUrun.DagitimOlcuId, dbo.MaliyetUrun.UrunDagitimAdet, 
                         dbo.ToplamMaliyet.ToplamMaliyet / dbo.MaliyetUrun.UrunDagitimAdet AS BirimMaliyet
FROM            dbo.ToplamMaliyet INNER JOIN
                         dbo.MaliyetUrun ON dbo.ToplamMaliyet.UrunId = dbo.MaliyetUrun.UrunId AND dbo.ToplamMaliyet.BirimDagitimOlcu = dbo.MaliyetUrun.DagitimOlcuId
GO
ALTER TABLE [dbo].[BirimMaliyet]  WITH CHECK ADD  CONSTRAINT [FK_BirimMaliyet_DagıtımOlcu] FOREIGN KEY([BirimDagitimOlcu])
REFERENCES [dbo].[DagıtımOlcu] ([DagıtımOlcu_Id])
GO
ALTER TABLE [dbo].[BirimMaliyet] CHECK CONSTRAINT [FK_BirimMaliyet_DagıtımOlcu]
GO
ALTER TABLE [dbo].[BirimMaliyet]  WITH CHECK ADD  CONSTRAINT [FK_BirimMaliyet_Urun] FOREIGN KEY([Urun_ID])
REFERENCES [dbo].[Urun] ([UrunId])
GO
ALTER TABLE [dbo].[BirimMaliyet] CHECK CONSTRAINT [FK_BirimMaliyet_Urun]
GO
ALTER TABLE [dbo].[DagitimOlcuFaaliyetiliski]  WITH CHECK ADD  CONSTRAINT [FK_DagitimOlcuFaaliyetiliski_DagıtımOlcu] FOREIGN KEY([DagitimOlcuId])
REFERENCES [dbo].[DagıtımOlcu] ([DagıtımOlcu_Id])
GO
ALTER TABLE [dbo].[DagitimOlcuFaaliyetiliski] CHECK CONSTRAINT [FK_DagitimOlcuFaaliyetiliski_DagıtımOlcu]
GO
ALTER TABLE [dbo].[DagitimOlcuFaaliyetiliski]  WITH CHECK ADD  CONSTRAINT [FK_DagitimOlcuFaaliyetiliski_Faaliyet] FOREIGN KEY([FaaliyetId])
REFERENCES [dbo].[Faaliyet] ([FaaliyetId])
GO
ALTER TABLE [dbo].[DagitimOlcuFaaliyetiliski] CHECK CONSTRAINT [FK_DagitimOlcuFaaliyetiliski_Faaliyet]
GO
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
ALTER TABLE [dbo].[MaliyetUrun]  WITH CHECK ADD  CONSTRAINT [FK_MaliyetUrun_DagıtımOlcu] FOREIGN KEY([DagitimOlcuId])
REFERENCES [dbo].[DagıtımOlcu] ([DagıtımOlcu_Id])
GO
ALTER TABLE [dbo].[MaliyetUrun] CHECK CONSTRAINT [FK_MaliyetUrun_DagıtımOlcu]
GO
ALTER TABLE [dbo].[MaliyetUrun]  WITH CHECK ADD  CONSTRAINT [FK_MaliyetUrun_Urun] FOREIGN KEY([UrunId])
REFERENCES [dbo].[Urun] ([UrunId])
GO
ALTER TABLE [dbo].[MaliyetUrun] CHECK CONSTRAINT [FK_MaliyetUrun_Urun]
GO
/****** Object:  StoredProcedure [dbo].[BirimMaliyetSP]    Script Date: 24.05.2022 01:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[BirimMaliyetSP]
as
SET FMTONLY OFF
TRUNCATE TABLE TblBirimMaliyetTutar
Insert into TblBirimMaliyetTutar(Urunler,EndirekUM,Dimmg,Dig,ToplamMaliyet,BirimMaliyet)
Select UrunAd,EndirektToplam,Dimmg,Dig,ToplamMaliyet,BirimMaliyet from BirimMaliyetTutar
select * from TblBirimMaliyetTutar
GO
/****** Object:  StoredProcedure [dbo].[Endirekt]    Script Date: 24.05.2022 01:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Endirekt]
As
SET FMTONLY OFF
TRUNCATE TABLE MaliyetEndirektUretim
Insert into MaliyetEndirektUretim(Urun_Id,Toplam)
select UrunId,Toplam from EndirektUretimMaliyeti

Select * from MaliyetEndirektUretim
GO
/****** Object:  StoredProcedure [dbo].[ProductPrice]    Script Date: 24.05.2022 01:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[ProductPrice]
As
SET FMTONLY OFF
TRUNCATE TABLE TutarUrunFaaliyet
Insert Into TutarUrunFaaliyet(Urun,Faaliyet,TutarTUF)
Select UrunAd,FaaliyetAd,tutar from UrunFaaliyetTutar
Select * from TutarUrunFaaliyet
GO
/****** Object:  StoredProcedure [dbo].[sp_ProductRefresh]    Script Date: 24.05.2022 01:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_ProductRefresh]
As
SET FMTONLY OFF
DELETE FROM TutarUrunFaaliyet
Insert Into TutarUrunFaaliyet(Urun,Faaliyet,TutarTUF)
Select UrunAd,FaaliyetAd,tutar from UrunFaaliyetTutar
Select * from TutarUrunFaaliyet
GO
/****** Object:  StoredProcedure [dbo].[SP_Tutar]    Script Date: 24.05.2022 01:13:56 ******/
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
/****** Object:  StoredProcedure [dbo].[SPBirimMaliyetTutar]    Script Date: 24.05.2022 01:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SPBirimMaliyetTutar]
as
SET FMTONLY OFF
TRUNCATE TABLE TblBirimMaliyetTutar
Insert into TblBirimMaliyetTutar(Urunler,EndirekUM,Dimmg,Dig,ToplamMaliyet,BirimMaliyet)
Select UrunAd,EndirektToplam,Dimmg,Dig,ToplamMaliyet,BirimMaliyet from BirimMaliyetTutar
select * from TblBirimMaliyetTutar
GO
/****** Object:  StoredProcedure [dbo].[SPToplamMaliyet]    Script Date: 24.05.2022 01:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SPToplamMaliyet]
as
SET FMTONLY OFF
TRUNCATE TABLE TblToplamMaliyet
insert into TblToplamMaliyet(UrunAdi,EndirektToplami,Dimmg,Dig,ToplamMaliyeti)
Select UrunAd,EndirektToplam,Dimmg,Dig,ToplamMaliyet from ToplamMaliyet

Select * from TblToplamMaliyet
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[10] 2[4] 3) )"
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
         Begin Table = "MaliyetUrun"
            Begin Extent = 
               Top = 6
               Left = 260
               Bottom = 136
               Right = 442
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ToplamMaliyet"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 222
            End
            DisplayFlags = 280
            TopColumn = 2
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BirimMaliyetTutar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BirimMaliyetTutar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[2] 2[33] 3) )"
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
         Begin Table = "UrunFaaliyetTutar"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Urun"
            Begin Extent = 
               Top = 6
               Left = 262
               Bottom = 102
               Right = 448
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
      Begin ColumnWidths = 12
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'EndirektUretimMaliyeti'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'EndirektUretimMaliyeti'
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
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[25] 4[10] 2[31] 3) )"
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
         Begin Table = "mu"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t"
            Begin Extent = 
               Top = 6
               Left = 258
               Bottom = 102
               Right = 428
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Urun"
            Begin Extent = 
               Top = 6
               Left = 466
               Bottom = 102
               Right = 636
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OranUrunDagitim'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OranUrunDagitim'
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
         Begin Table = "g"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ToplamFaaliyetTutar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ToplamFaaliyetTutar'
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
         Begin Table = "BirimMaliyet"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "MaliyetEndirektUretim"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Urun"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 102
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ToplamMaliyet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ToplamMaliyet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[23] 4[4] 2[42] 3) )"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UrunFaaliyetTutar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UrunFaaliyetTutar'
GO
USE [master]
GO
ALTER DATABASE [Bitirme] SET  READ_WRITE 
GO
