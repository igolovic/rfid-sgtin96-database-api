USE [MyCompany]
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteAllData]    Script Date: 20.5.2021. 22:25:25 ******/
DROP PROCEDURE [dbo].[usp_DeleteAllData]
GO
ALTER TABLE [dbo].[ProductItem] DROP CONSTRAINT [FK_ProductItem_Product]
GO
ALTER TABLE [dbo].[ProductItem] DROP CONSTRAINT [FK_ProductItem_InventoryDateLocation]
GO
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_Company]
GO
ALTER TABLE [dbo].[InventoryDateLocation] DROP CONSTRAINT [FK_InventoryDateLocation_InventoryLocation]
GO
ALTER TABLE [dbo].[InventoryDateLocation] DROP CONSTRAINT [FK_InventoryDateLocation_Inventory]
GO
/****** Object:  Index [UQ__ProductI__6B86F9ABA142D6C8]    Script Date: 20.5.2021. 22:25:25 ******/
ALTER TABLE [dbo].[ProductItem] DROP CONSTRAINT [UQ__ProductI__6B86F9ABA142D6C8]
GO
/****** Object:  Index [UQ__Product__12045DE22D81EEB1]    Script Date: 20.5.2021. 22:25:25 ******/
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [UQ__Product__12045DE22D81EEB1]
GO
/****** Object:  Index [UQ__Inventor__EC750B4FCED41B54]    Script Date: 20.5.2021. 22:25:25 ******/
ALTER TABLE [dbo].[InventoryLocation] DROP CONSTRAINT [UQ__Inventor__EC750B4FCED41B54]
GO
/****** Object:  Index [UQ__Inventor__C4422681C1203420]    Script Date: 20.5.2021. 22:25:25 ******/
ALTER TABLE [dbo].[InventoryDateLocation] DROP CONSTRAINT [UQ__Inventor__C4422681C1203420]
GO
/****** Object:  Index [UQ__Inventor__F5FDE6B23654FF0C]    Script Date: 20.5.2021. 22:25:25 ******/
ALTER TABLE [dbo].[Inventory] DROP CONSTRAINT [UQ__Inventor__F5FDE6B23654FF0C]
GO
/****** Object:  Index [UQ__Company__C2281033CA6534FB]    Script Date: 20.5.2021. 22:25:25 ******/
ALTER TABLE [dbo].[Company] DROP CONSTRAINT [UQ__Company__C2281033CA6534FB]
GO
/****** Object:  Table [dbo].[InventoryLocation]    Script Date: 20.5.2021. 22:25:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InventoryLocation]') AND type in (N'U'))
DROP TABLE [dbo].[InventoryLocation]
GO
/****** Object:  View [dbo].[v_CountOfInventoriedItemsGroupedBySpecificCompany]    Script Date: 20.5.2021. 22:25:25 ******/
DROP VIEW [dbo].[v_CountOfInventoriedItemsGroupedBySpecificCompany]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 20.5.2021. 22:25:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Company]') AND type in (N'U'))
DROP TABLE [dbo].[Company]
GO
/****** Object:  View [dbo].[v_CountOfInventoriedItemsGroupedBySpecificProductPerDay]    Script Date: 20.5.2021. 22:25:25 ******/
DROP VIEW [dbo].[v_CountOfInventoriedItemsGroupedBySpecificProductPerDay]
GO
/****** Object:  View [dbo].[v_CountOfInventoriedItemsGroupedBySpecificProductForSpecificInventory]    Script Date: 20.5.2021. 22:25:25 ******/
DROP VIEW [dbo].[v_CountOfInventoriedItemsGroupedBySpecificProductForSpecificInventory]
GO
/****** Object:  Table [dbo].[InventoryDateLocation]    Script Date: 20.5.2021. 22:25:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InventoryDateLocation]') AND type in (N'U'))
DROP TABLE [dbo].[InventoryDateLocation]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 20.5.2021. 22:25:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
DROP TABLE [dbo].[Product]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 20.5.2021. 22:25:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Inventory]') AND type in (N'U'))
DROP TABLE [dbo].[Inventory]
GO
/****** Object:  Table [dbo].[ProductItem]    Script Date: 20.5.2021. 22:25:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductItem]') AND type in (N'U'))
DROP TABLE [dbo].[ProductItem]
GO
USE [master]
GO
/****** Object:  Database [MyCompany]    Script Date: 20.5.2021. 22:25:25 ******/
DROP DATABASE [MyCompany]
GO
/****** Object:  Database [MyCompany]    Script Date: 20.5.2021. 22:25:25 ******/
CREATE DATABASE [MyCompany]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyCompany', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.IVANINSTANCE\MSSQL\DATA\MyCompany.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyCompany_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.IVANINSTANCE\MSSQL\DATA\MyCompany_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MyCompany] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyCompany].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyCompany] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyCompany] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyCompany] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyCompany] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyCompany] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyCompany] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyCompany] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyCompany] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyCompany] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyCompany] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyCompany] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyCompany] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyCompany] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyCompany] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyCompany] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyCompany] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyCompany] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyCompany] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyCompany] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyCompany] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyCompany] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyCompany] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyCompany] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyCompany] SET  MULTI_USER 
GO
ALTER DATABASE [MyCompany] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyCompany] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyCompany] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyCompany] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyCompany] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyCompany] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MyCompany] SET QUERY_STORE = OFF
GO
USE [MyCompany]
GO
/****** Object:  Table [dbo].[ProductItem]    Script Date: 20.5.2021. 22:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Product_Id] [int] NOT NULL,
	[InventoryDateLocation_Id] [int] NOT NULL,
	[SerialNumber] [bigint] NOT NULL,
 CONSTRAINT [PK__ProductI__3214EC075FB518F7] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 20.5.2021. 22:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InventoryId] [varchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 20.5.2021. 22:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Company_Id] [int] NOT NULL,
	[ItemReference] [bigint] NOT NULL,
	[ProductName] [varchar](512) NOT NULL,
 CONSTRAINT [PK__Product__3214EC075B25DB96] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryDateLocation]    Script Date: 20.5.2021. 22:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryDateLocation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Inventory_Id] [int] NOT NULL,
	[InventoryDate] [datetime2](7) NOT NULL,
	[InventoryLocation_Id] [int] NOT NULL,
 CONSTRAINT [PK__Inventor__3214EC073C46EE2F] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_CountOfInventoriedItemsGroupedBySpecificProductForSpecificInventory]    Script Date: 20.5.2021. 22:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_CountOfInventoriedItemsGroupedBySpecificProductForSpecificInventory]
AS
SELECT	i.InventoryId
		, COUNT(*) AS CountOfProductItems
		, [p].ProductName
FROM	[dbo].[ProductItem] AS [pi]
INNER JOIN
		[dbo].[Product] AS p
ON		p.Id = [pi].Product_Id
INNER JOIN
		[dbo].[InventoryDateLocation] AS idl
ON		idl.Id = [pi].InventoryDateLocation_Id
INNER JOIN
		[dbo].[Inventory] AS i
ON		i.Id = idl.Inventory_Id
GROUP BY
		i.Id, i.InventoryId, [p].Id, [p].ProductName
--ORDER BY i.InventoryId, CountOfProductItems DESC
GO
/****** Object:  View [dbo].[v_CountOfInventoriedItemsGroupedBySpecificProductPerDay]    Script Date: 20.5.2021. 22:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_CountOfInventoriedItemsGroupedBySpecificProductPerDay]
AS
SELECT	idl.InventoryDate
		, COUNT(*) AS CountOfProductItems
		, [p].ProductName
FROM	[dbo].[ProductItem] AS [pi]
INNER JOIN
		[dbo].[Product] AS p
ON		p.Id = [pi].Product_Id
INNER JOIN
		[dbo].[InventoryDateLocation] AS idl
ON		idl.Id = [pi].InventoryDateLocation_Id
GROUP BY
		idl.InventoryDate, [p].Id, [p].ProductName
--ORDER BY idl.InventoryDate, CountOfProductItems DESC
GO
/****** Object:  Table [dbo].[Company]    Script Date: 20.5.2021. 22:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyPrefix] [bigint] NOT NULL,
	[CompanyName] [varchar](512) NOT NULL,
 CONSTRAINT [PK__Company__3214EC07BB738488] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_CountOfInventoriedItemsGroupedBySpecificCompany]    Script Date: 20.5.2021. 22:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_CountOfInventoriedItemsGroupedBySpecificCompany]
AS
SELECT	c.CompanyName
		, COUNT(*) AS CountOfProductItems
FROM	[dbo].[ProductItem] AS [pi]
INNER JOIN
		[dbo].[Product] AS p
ON		p.Id = [pi].Product_Id
INNER JOIN
		[dbo].[Company] AS c
ON		c.Id = p.Company_Id
GROUP BY
		c.Id, c.CompanyName
--ORDER BY CountOfProductItems DESC, c.CompanyName
GO
/****** Object:  Table [dbo].[InventoryLocation]    Script Date: 20.5.2021. 22:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryLocation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InventoryLocationName] [varchar](512) NOT NULL,
 CONSTRAINT [PK__Inventor__3214EC071055B90B] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Company] ON 
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (204, 3319361, N'Sanford LLC')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (205, 6314853123, N'Gleichner, Rodriguez and Wilkinson')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (206, 39266333, N'Mertz, O''Conner and Heaney')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (207, 213645, N'McGlynn Inc')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (208, 178504, N'Thompson LLC')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (209, 964495, N'Halvorson and Sons')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (210, 585675, N'Torphy-Becker')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (211, 9488123, N'Kunze, Wilkinson and Sawayn')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (212, 86906, N'Blanda-Hagenes')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (213, 2973701, N'Bednar-Mitchell')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (214, 7942595, N'Hilpert Group')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (215, 587451, N'Lindgren, Witting and Wiegand')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (216, 40777411, N'Larson, Reilly and Cruickshank')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (217, 227113, N'Walsh-Schamberger')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (218, 3733204, N'Orn-Langosh')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (219, 885734, N'Deckow LLC')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (220, 2871566, N'Lueilwitz, Schumm and Walsh')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (221, 584202, N'Bailey LLC')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (222, 5032891234, N'Sawayn-Gibson')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (223, 1999335, N'Gibson-Cormier')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (224, 83250532, N'Fisher Inc')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (225, 516232, N'Leffler-Torphy')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (226, 43907, N'Nolan-Walter')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (227, 4584903, N'Heller, Koepp and Powlowski')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (228, 983682, N'Dickens and Sons')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (229, 686748, N'Steuber-Stracke')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (230, 678362, N'Lynch, Yundt and Howe')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (231, 591271, N'Lakin, Prosacco and Terry')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (232, 69124, N'Mondelez International')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (233, 107222, N'Armstrong-Schinner')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (234, 140037, N'Torp-Reynolds')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (235, 750917, N'Becker, Schaefer and Greenholt')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (236, 317580317580, N'Medhurst-Romaguera')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (237, 390007, N'Carter-Reynolds')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (238, 528209, N'Morissette LLC')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (239, 2180435, N'Gottlieb, Stroman and Grimes')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (240, 823332, N'Durgan, Hahn and Runolfsdottir')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (241, 511751, N'Spencer, Block and Marks')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (242, 543540, N'Kozey Group')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (243, 826025, N'Little Group')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (244, 110720, N'O''Hara LLC')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (245, 33314622, N'Weissnat and Sons')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (246, 764493764493, N'Okuneva, Schneider and Collins')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (247, 428651, N'Cole LLC')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (248, 950316, N'Keeling, Nikolaus and Larkin')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (249, 870953, N'Dach-Herzog')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (250, 8393604321, N'Wolf Inc')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (251, 719065, N'Legros-Cruickshank')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (252, 758601, N'Schmeler-Lind')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (253, 368305, N'Macejkovic-Murazik')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (254, 791586, N'Raynor LLC')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (255, 28600054, N'Mosciski, Maggio and DuBuque')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (256, 608240, N'Von, Gusikowski and Farrell')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (257, 60643, N'Beer, Batz and Koch')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (258, 127083, N'Watsica-Labadie')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (259, 178540, N'Tromp-Pacocha')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (260, 51578, N'Kuvalis, Doyle and Flatley')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (261, 21276, N'Feil Inc')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (262, 745230, N'Nitzsche-Gerlach')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (263, 107956107956, N'Rodriguez, Beier and Ratke')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (264, 7002011, N'Orn, Ortiz and Keebler')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (265, 4619611, N'Rolfson, Collins and Runolfsson')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (266, 108653, N'Rath, Ferry and Moen')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (267, 814875, N'Cummerata-Schaden')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (268, 378922, N'Rowe-Gibson')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (269, 4499823, N'Daugherty, Hettinger and Koelpin')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (270, 1210999912, N'Heidenreich-Kessler')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (271, 900706, N'Weimann-Casper')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (272, 7408273, N'Stark-McCullough')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (273, 828415, N'Weber-Reichel')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (274, 451802, N'Koelpin, Kozey and Grimes')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (275, 169691, N'Smitham Group')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (276, 563974, N'Gusikowski-Leuschke')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (277, 77605, N'Shanahan, Bernier and Funk')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (278, 349605, N'Harvey-Weber')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (279, 342472, N'Macejkovic, Towne and Spencer')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (280, 770270770270, N'Halvorson, Schinner and Smitham')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (281, 327884, N'Welch and Sons')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (282, 812302, N'Spinka, Hauck and Bogan')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (283, 905710, N'Jakubowski-Veum')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (284, 997970, N'Stark-Ward')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (285, 917969, N'Aufderhar Group')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (286, 96652, N'Wisoky-Roob')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (287, 51151534, N'Schmidt-Quigley')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (288, 5023208822, N'Smitham, Swaniawski and Upton')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (289, 446617, N'Koelpin Inc')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (290, 13332, N'Little, King and Zboncak')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (291, 600851600851, N'O''Conner-Turner')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (292, 196645, N'Lynch-Fay')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (293, 4984121, N'O''Reilly Inc')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (294, 676413, N'Hayes-Schumm')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (295, 485771, N'Morar-Schulist')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (296, 793681, N'Carroll-Hammes')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (297, 3209622, N'Windler-Stark')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (298, 823413, N'Johnson-Donnelly')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (299, 623828, N'Wolf and Sons')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (300, 655062, N'Zboncak Inc')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (301, 472731472731, N'Dicki Group')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (302, 443750, N'Cole, Kemmer and Turner')
GO
INSERT [dbo].[Company] ([Id], [CompanyPrefix], [CompanyName]) VALUES (303, 2777462999, N'Gottlieb-Denesik')
GO
SET IDENTITY_INSERT [dbo].[Company] OFF
GO
SET IDENTITY_INSERT [dbo].[Inventory] ON 
GO
INSERT [dbo].[Inventory] ([Id], [InventoryId]) VALUES (4, N'11jv1jv21hjg21')
GO
INSERT [dbo].[Inventory] ([Id], [InventoryId]) VALUES (5, N'xx')
GO
INSERT [dbo].[Inventory] ([Id], [InventoryId]) VALUES (6, N'xx11')
GO
INSERT [dbo].[Inventory] ([Id], [InventoryId]) VALUES (7, N'xxxxxx2')
GO
SET IDENTITY_INSERT [dbo].[Inventory] OFF
GO
SET IDENTITY_INSERT [dbo].[InventoryDateLocation] ON 
GO
INSERT [dbo].[InventoryDateLocation] ([Id], [Inventory_Id], [InventoryDate], [InventoryLocation_Id]) VALUES (3, 4, CAST(N'2021-05-18T00:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[InventoryDateLocation] ([Id], [Inventory_Id], [InventoryDate], [InventoryLocation_Id]) VALUES (8, 4, CAST(N'2021-05-18T00:00:00.0000000' AS DateTime2), 4)
GO
INSERT [dbo].[InventoryDateLocation] ([Id], [Inventory_Id], [InventoryDate], [InventoryLocation_Id]) VALUES (1, 4, CAST(N'2021-05-19T00:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[InventoryDateLocation] ([Id], [Inventory_Id], [InventoryDate], [InventoryLocation_Id]) VALUES (2, 4, CAST(N'2021-05-19T00:00:00.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[InventoryDateLocation] ([Id], [Inventory_Id], [InventoryDate], [InventoryLocation_Id]) VALUES (9, 4, CAST(N'2021-05-19T00:00:00.0000000' AS DateTime2), 5)
GO
INSERT [dbo].[InventoryDateLocation] ([Id], [Inventory_Id], [InventoryDate], [InventoryLocation_Id]) VALUES (6, 5, CAST(N'2021-05-13T00:00:00.0000000' AS DateTime2), 3)
GO
INSERT [dbo].[InventoryDateLocation] ([Id], [Inventory_Id], [InventoryDate], [InventoryLocation_Id]) VALUES (4, 5, CAST(N'2021-05-18T00:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[InventoryDateLocation] ([Id], [Inventory_Id], [InventoryDate], [InventoryLocation_Id]) VALUES (5, 5, CAST(N'2021-05-18T00:00:00.0000000' AS DateTime2), 3)
GO
INSERT [dbo].[InventoryDateLocation] ([Id], [Inventory_Id], [InventoryDate], [InventoryLocation_Id]) VALUES (7, 6, CAST(N'2021-03-13T00:00:00.0000000' AS DateTime2), 3)
GO
INSERT [dbo].[InventoryDateLocation] ([Id], [Inventory_Id], [InventoryDate], [InventoryLocation_Id]) VALUES (10, 7, CAST(N'2021-05-19T00:00:00.0000000' AS DateTime2), 5)
GO
SET IDENTITY_INSERT [dbo].[InventoryDateLocation] OFF
GO
SET IDENTITY_INSERT [dbo].[InventoryLocation] ON 
GO
INSERT [dbo].[InventoryLocation] ([Id], [InventoryLocationName]) VALUES (4, N'a')
GO
INSERT [dbo].[InventoryLocation] ([Id], [InventoryLocationName]) VALUES (1, N'First inventory')
GO
INSERT [dbo].[InventoryLocation] ([Id], [InventoryLocationName]) VALUES (2, N'First inventory2')
GO
INSERT [dbo].[InventoryLocation] ([Id], [InventoryLocationName]) VALUES (3, N'varazdin :)')
GO
INSERT [dbo].[InventoryLocation] ([Id], [InventoryLocationName]) VALUES (5, N'Varaždin')
GO
SET IDENTITY_INSERT [dbo].[InventoryLocation] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (204, 204, 407205, N'Beans - Kidney, Red Dry')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (205, 205, 877, N'Scallops - In Shell')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (206, 206, 21526, N'Fruit Mix - Light')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (207, 207, 6152432, N'Pickles - Gherkins')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (208, 208, 2577266, N'Straws - Cocktale')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (209, 209, 3508204, N'Cotton Wet Mop 16 Oz')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (210, 210, 4259784, N'Wine - Merlot Vina Carmen')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (211, 211, 147805, N'Bread - Multigrain, Loaf')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (212, 212, 1437603, N'Pasta - Penne, Rigate, Dry')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (213, 213, 682407, N'Bols Melon Liqueur')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (214, 214, 565126, N'Pate - Cognac')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (215, 215, 1074506, N'Pork - Loin, Center Cut')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (216, 216, 36953, N'Tea - Green')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (217, 217, 5935575, N'Wine - Chateau Bonnet')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (218, 218, 647520, N'Extract - Lemon')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (219, 219, 8756756, N'Muffins - Assorted')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (220, 220, 145216, N'Beef - Bresaola')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (221, 221, 2876851, N'Sugar - Brown, Individual')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (222, 222, 138, N'Pepper - Red Chili')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (223, 223, 642804, N'Compound - Raspberry')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (224, 224, 52838, N'Chicken - Whole')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (225, 225, 7222702, N'Juice - Apple, 341 Ml')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (226, 226, 3406731, N'Beans - Kidney White')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (227, 227, 679405, N'Beer - Camerons Cream Ale')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (228, 228, 4365465, N'Mousse - Mango')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (229, 229, 9119606, N'Cheese - Grie Des Champ')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (230, 230, 4156060, N'Plastic Arrow Stir Stick')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (231, 231, 5771945, N'Chicken Giblets')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (232, 232, 1253252, N'Milka Oreo')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (233, 233, 797011, N'Honey - Comb')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (234, 234, 9818542, N'Beef - Shank')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (235, 235, 7528000, N'Walkers Special Old Whiskey')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (236, 236, 7, N'Pork - Ground')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (237, 237, 9160738, N'Cornflakes')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (238, 238, 7791950, N'Shallots')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (239, 239, 909583, N'Wine - Magnotta - Cab Franc')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (240, 240, 6492584, N'Carrots - Purple, Organic')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (241, 241, 6644044, N'Jam - Blackberry, 20 Ml Jar')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (242, 242, 3141656, N'Wine - Clavet Saint Emilion')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (243, 243, 1130405, N'Salt - Sea')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (244, 244, 5041310, N'V8 Pet')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (245, 245, 53619, N'Mustard Prepared')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (246, 246, 4, N'Pumpkin')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (247, 247, 7619450, N'Creme De Cacao Mcguines')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (248, 248, 2380884, N'Berry Brulee')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (249, 249, 8728496, N'Lychee - Canned')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (250, 250, 179, N'Veal - Eye Of Round')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (251, 251, 9765179, N'Salami - Genova')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (252, 252, 2337085, N'Muffin Mix - Corn Harvest')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (253, 253, 2620417, N'Chocolate Eclairs')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (254, 254, 5775051, N'Gooseberry')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (255, 255, 41912, N'Scallops - U - 10')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (256, 256, 2412148, N'Beef - Top Butt Aaa')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (257, 257, 9948173, N'Chicken Breast Wing On')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (258, 258, 5256251, N'Crush - Grape, 355 Ml')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (259, 259, 3505943, N'Cheese - Ricotta')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (260, 260, 9086830, N'Chicken - Leg / Back Attach')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (261, 261, 9837077, N'Coffee Cup 8oz 5338cd')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (262, 262, 6232899, N'Truffle - Whole Black Peeled')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (263, 263, 2, N'Salmon - Atlantic, Fresh, Whole')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (264, 264, 482701, N'Bread - Mini Hamburger Bun')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (265, 265, 162323, N'Contreau')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (266, 266, 1180386, N'Wine - Spumante Bambino White')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (267, 267, 5090895, N'Pork - Tenderloin, Fresh')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (268, 268, 8414833, N'Chutney Sauce - Mango')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (269, 269, 351572, N'Smoked Tongue')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (270, 270, 123, N'Ecolab - Hobart Washarm End Cap')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (271, 271, 8213657, N'Sea Bass - Whole')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (272, 272, 664337, N'Turkey - Whole, Fresh')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (273, 273, 5417914, N'Flower - Leather Leaf Fern')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (274, 274, 2638491, N'Fond - Neutral')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (275, 275, 87387, N'Almonds Ground Blanched')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (276, 276, 4156235, N'Cranberries - Dry')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (277, 277, 5749311, N'Trout - Smoked')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (278, 278, 4548221, N'Wine - Zonnebloem Pinotage')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (279, 279, 6004566, N'Tamarind Paste')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (280, 280, 9, N'Pepper Squash')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (281, 281, 7703818, N'Crab - Blue, Frozen')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (282, 282, 5276620, N'Juice Peach Nectar')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (283, 283, 9832832, N'Plate - Foam, Bread And Butter')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (284, 284, 9212388, N'Pasta - Ravioli')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (285, 285, 3602750, N'Cheese - Ricotta')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (286, 286, 6172545, N'Pork - Kidney')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (287, 287, 78331, N'Apple - Delicious, Red')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (288, 288, 521, N'Hagen Daza - Dk Choocolate')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (289, 289, 9353565, N'Wine - Sauvignon Blanc Oyster')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (290, 290, 4770766, N'Wine - Red Oakridge Merlot')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (291, 291, 2, N'Wild Boar - Tenderloin')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (292, 292, 1236529, N'Broccoli - Fresh')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (293, 293, 901844, N'Pork - Back, Long Cut, Boneless')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (294, 294, 8849362, N'Triple Sec - Mcguinness')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (295, 295, 5339535, N'Lamb - Whole Head Off,nz')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (296, 296, 9774282, N'Jicama')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (297, 297, 461277, N'Longos - Greek Salad')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (298, 298, 4397760, N'Grouper - Fresh')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (299, 299, 4865650, N'Food Colouring - Orange')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (300, 300, 1232213, N'Vermouth - White, Cinzano')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (301, 301, 2, N'Soup - Knorr, Chicken Noodle')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (302, 302, 5573641, N'Spring Roll Veg Mini')
GO
INSERT [dbo].[Product] ([Id], [Company_Id], [ItemReference], [ProductName]) VALUES (303, 303, 401, N'Bread - Hamburger Buns')
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductItem] ON 
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1, 251, 8, 260453509)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (2, 234, 8, 403793385)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (3, 285, 8, 852246379)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (4, 231, 8, 735667289)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (5, 286, 8, 757951966)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (6, 232, 8, 665745364)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (7, 223, 8, 801847680)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (8, 222, 8, 287237352)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (9, 230, 8, 613995479)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (10, 276, 8, 799974681)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (11, 265, 8, 567405216)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (12, 208, 8, 879221939)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (13, 301, 8, 953896436)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (14, 301, 8, 789591829)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (15, 233, 8, 685340782)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (16, 303, 8, 15758183)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (17, 214, 8, 702195361)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (18, 244, 8, 531711382)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (19, 218, 8, 582702116)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (20, 251, 8, 7539189)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (21, 296, 8, 710586639)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (22, 224, 8, 965665296)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (23, 290, 8, 888188950)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (24, 283, 8, 747286210)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (25, 234, 8, 489702151)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (26, 273, 8, 314146073)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (27, 270, 8, 654691987)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (28, 251, 8, 222433056)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (29, 284, 8, 723397486)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (30, 287, 8, 298223819)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (31, 241, 8, 268090823)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (32, 251, 8, 961391645)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (33, 219, 8, 245246476)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (34, 252, 8, 993478913)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (35, 299, 8, 221020733)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (36, 229, 8, 905020500)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (37, 206, 8, 578785305)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (38, 242, 8, 257335495)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (39, 274, 8, 765170683)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (40, 302, 8, 526499225)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (41, 269, 8, 636079254)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (42, 212, 8, 478925232)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (43, 217, 8, 781986681)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (44, 278, 8, 649176498)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (45, 219, 8, 372490780)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (46, 231, 8, 576019402)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (47, 261, 8, 964791125)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (48, 233, 8, 202484044)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (49, 257, 8, 669939410)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (50, 251, 8, 308959667)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (51, 268, 8, 123785443)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (52, 206, 8, 756096109)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (53, 273, 8, 285958984)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (54, 280, 8, 878653803)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (55, 218, 8, 731173721)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (56, 242, 8, 844121033)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (57, 229, 8, 585577576)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (58, 235, 8, 170487768)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (59, 266, 8, 163019409)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (60, 292, 8, 805239923)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (61, 238, 8, 590741723)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (62, 218, 8, 798882092)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (63, 299, 8, 410838539)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (64, 258, 8, 684537941)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (65, 258, 8, 896079980)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (66, 204, 8, 981330301)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (67, 281, 8, 943156033)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (68, 238, 8, 647230436)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (69, 216, 8, 979941902)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (70, 235, 8, 722056037)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (71, 239, 8, 523467821)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (72, 261, 8, 952800439)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (73, 300, 8, 548584283)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (74, 268, 8, 949134708)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (75, 264, 8, 534280129)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (76, 241, 8, 959184464)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (77, 258, 8, 178133796)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (78, 272, 8, 447650759)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (79, 300, 8, 474496848)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (80, 214, 8, 768086492)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (81, 282, 8, 850255286)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (82, 232, 8, 626507126)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (83, 221, 8, 964408208)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (84, 260, 8, 437871438)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (85, 300, 8, 143424077)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (86, 294, 8, 237608261)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (87, 300, 8, 802929413)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (88, 272, 8, 319105569)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (89, 271, 8, 569431582)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (90, 232, 8, 181039777)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (91, 293, 8, 490956399)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (92, 224, 8, 734922379)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (93, 230, 8, 921348781)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (94, 236, 8, 738200433)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (95, 261, 8, 128109782)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (96, 235, 8, 316724161)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (97, 297, 8, 843758656)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (98, 299, 8, 294468046)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (99, 220, 8, 208530721)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (100, 280, 8, 207345801)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (101, 279, 8, 393655112)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (102, 213, 8, 423545576)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (103, 222, 8, 443302233)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (104, 253, 8, 35253928)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (105, 217, 8, 263143255)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (106, 238, 8, 584195894)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (107, 214, 8, 438512450)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (108, 216, 8, 228073435)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (109, 288, 8, 277250791)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (110, 288, 8, 451917617)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (111, 269, 8, 289418008)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (112, 216, 8, 12084894)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (113, 210, 8, 132833863)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (114, 271, 8, 80277486)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (115, 292, 8, 575806706)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (116, 224, 8, 432513513)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (117, 258, 8, 803047045)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (118, 261, 8, 251945203)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (119, 253, 8, 797127389)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (120, 213, 8, 890533304)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (121, 256, 8, 108227619)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (122, 228, 8, 872211764)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (123, 228, 8, 551480156)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (124, 218, 8, 589737142)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (125, 229, 8, 604546498)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (126, 251, 8, 251093235)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (127, 265, 8, 680083885)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (128, 245, 8, 588897016)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (129, 232, 8, 603856597)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (130, 221, 8, 137467591)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (131, 257, 8, 443960462)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (132, 291, 8, 29847585)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (133, 249, 8, 256180256)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (134, 263, 8, 903275877)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (135, 240, 8, 724912941)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (136, 250, 8, 105845380)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (137, 241, 8, 400736702)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (138, 245, 8, 424441669)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (139, 235, 8, 128715010)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (140, 302, 8, 180916656)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (141, 235, 8, 284274741)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (142, 216, 8, 439066842)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (143, 207, 8, 775806078)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (144, 207, 8, 244886713)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (145, 236, 8, 796147139)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (146, 250, 8, 55934435)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (147, 223, 8, 631801780)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (148, 204, 8, 196946944)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (149, 248, 8, 326752902)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (150, 286, 8, 493516557)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (151, 219, 8, 742781174)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (152, 293, 8, 503131084)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (153, 229, 8, 83355623)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (154, 230, 8, 768995333)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (155, 285, 8, 551168141)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (156, 278, 8, 568849593)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (157, 247, 8, 399255291)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (158, 243, 8, 536066835)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (159, 258, 8, 59990272)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (160, 240, 8, 426005483)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (161, 288, 8, 88217466)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (162, 255, 8, 182000297)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (163, 260, 8, 199292782)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (164, 253, 8, 484919708)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (165, 262, 8, 927490878)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (166, 239, 8, 447936003)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (167, 296, 8, 334449833)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (168, 205, 8, 556537608)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (169, 241, 8, 478989035)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (170, 244, 8, 531970920)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (171, 260, 8, 789719328)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (172, 252, 8, 271511184)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (173, 269, 8, 223874075)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (174, 300, 8, 881370843)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (175, 205, 8, 247966093)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (176, 221, 8, 724066340)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (177, 241, 8, 392600777)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (178, 262, 8, 333329350)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (179, 212, 8, 109395953)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (180, 249, 8, 874255111)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (181, 258, 8, 730996928)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (182, 254, 8, 452633079)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (183, 253, 8, 933660177)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (184, 275, 8, 25702957)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (185, 225, 8, 887302711)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (186, 248, 8, 920175403)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (187, 214, 8, 359882071)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (188, 220, 8, 841750343)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (189, 223, 8, 445414920)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (190, 300, 8, 544397253)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (191, 286, 8, 85194652)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (192, 232, 8, 391853774)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (193, 273, 8, 709430780)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (194, 204, 8, 952768961)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (195, 259, 8, 262836480)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (196, 259, 8, 971289134)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (197, 206, 8, 499979378)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (198, 244, 8, 93618722)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (199, 287, 8, 272715409)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (200, 226, 8, 797110189)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (201, 278, 8, 499815447)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (202, 231, 8, 236236131)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (203, 229, 8, 946374343)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (204, 270, 8, 130591569)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (205, 301, 8, 530889166)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (206, 235, 8, 318684869)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (207, 256, 8, 803487317)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (208, 228, 8, 122708123)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (209, 251, 8, 905484670)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (210, 249, 8, 902051495)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (211, 289, 8, 115401092)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (212, 284, 8, 394402842)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (213, 231, 8, 199060813)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (214, 299, 8, 689749237)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (215, 231, 8, 445008039)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (216, 264, 8, 804338311)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (217, 220, 8, 140367508)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (218, 214, 8, 449821068)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (219, 236, 8, 34340175)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (220, 232, 8, 421383673)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (221, 271, 8, 406684993)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (222, 217, 8, 154963084)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (223, 256, 8, 122031883)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (224, 243, 8, 879738039)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (225, 236, 8, 728775849)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (226, 215, 8, 985957784)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (227, 290, 8, 935509006)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (228, 239, 8, 195721077)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (229, 230, 8, 212398410)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (230, 299, 8, 184225937)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (231, 224, 8, 160396933)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (232, 270, 8, 40420057)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (233, 211, 8, 763996267)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (234, 287, 8, 251220028)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (235, 296, 8, 949713870)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (236, 223, 8, 750394773)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (237, 253, 8, 902810723)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (238, 216, 8, 829302131)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (239, 218, 8, 155093976)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (240, 257, 8, 903034773)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (241, 278, 8, 853612883)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (242, 286, 8, 217532799)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (243, 299, 8, 803558467)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (244, 289, 8, 647788099)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (245, 277, 8, 32224827)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (246, 258, 8, 680599105)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (247, 255, 8, 663410106)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (248, 295, 8, 20049309)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (249, 275, 8, 860010991)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (250, 252, 8, 248921050)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (251, 300, 8, 684333689)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (252, 283, 8, 622382230)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (253, 301, 8, 890476263)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (254, 293, 8, 82782867)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (255, 221, 8, 233511350)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (256, 299, 8, 252804121)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (257, 266, 8, 905664700)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (258, 242, 8, 128749522)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (259, 216, 8, 36031721)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (260, 250, 8, 612890943)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (261, 216, 8, 928063962)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (262, 245, 8, 204616910)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (263, 299, 8, 317293041)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (264, 277, 8, 224758528)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (265, 215, 8, 823072806)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (266, 228, 8, 583208193)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (267, 260, 8, 208591191)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (268, 263, 8, 699852466)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (269, 258, 8, 292933715)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (270, 242, 8, 786455963)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (271, 235, 8, 913842151)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (272, 244, 8, 615469225)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (273, 208, 8, 788132688)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (274, 279, 8, 804296064)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (275, 238, 8, 904933569)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (276, 287, 8, 690094966)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (277, 303, 8, 373789678)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (278, 248, 8, 740985473)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (279, 239, 8, 85115597)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (280, 238, 8, 896933571)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (281, 229, 8, 832809837)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (282, 283, 8, 612311510)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (283, 213, 8, 800400371)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (284, 241, 8, 990739370)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (285, 277, 8, 549695677)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (286, 250, 8, 498571504)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (287, 235, 8, 548131931)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (288, 281, 8, 554145152)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (289, 293, 8, 230772504)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (290, 283, 8, 900618280)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (291, 273, 8, 812956911)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (292, 285, 8, 123301564)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (293, 249, 8, 565474577)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (294, 242, 8, 983464488)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (295, 241, 8, 223807585)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (296, 220, 8, 526757792)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (297, 208, 8, 528727048)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (298, 211, 8, 558167339)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (299, 267, 8, 818978646)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (300, 251, 8, 242080179)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (301, 289, 8, 732288429)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (302, 205, 8, 977275213)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (303, 240, 8, 554967088)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (304, 281, 8, 21606137)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (305, 255, 8, 423471234)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (306, 256, 8, 732330512)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (307, 259, 8, 156858123)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (308, 270, 8, 379156740)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (309, 237, 8, 258123387)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (310, 267, 8, 958443272)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (311, 266, 8, 930502200)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (312, 296, 8, 538000493)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (313, 270, 8, 776766685)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (314, 232, 8, 272628664)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (315, 213, 8, 401669725)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (316, 253, 8, 526676343)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (317, 264, 8, 778070147)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (318, 230, 8, 7036599)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (319, 282, 8, 467733355)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (320, 284, 8, 846385273)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (321, 251, 8, 880209798)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (322, 219, 8, 39867364)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (323, 236, 8, 896017310)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (324, 294, 8, 391372660)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (325, 301, 8, 1183207)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (326, 212, 8, 21263172)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (327, 242, 8, 834191047)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (328, 233, 8, 627549664)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (329, 229, 8, 361020924)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (330, 261, 8, 471846589)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (331, 244, 8, 170401937)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (332, 292, 8, 131051974)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (333, 244, 8, 47899803)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (334, 274, 8, 460558960)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (335, 232, 8, 779885405)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (336, 231, 8, 43995536)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (337, 283, 8, 339464798)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (338, 266, 8, 570039130)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (339, 287, 8, 208253849)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (340, 285, 8, 360201274)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (341, 267, 8, 658957599)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (342, 277, 8, 485914761)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (343, 232, 8, 805435895)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (344, 214, 8, 719584077)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (345, 233, 8, 262654860)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (346, 207, 8, 555901026)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (347, 205, 8, 102598127)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (348, 246, 8, 346982279)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (349, 267, 8, 66083551)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (350, 205, 8, 111057776)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (351, 232, 8, 764989774)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (352, 296, 8, 738909617)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (353, 267, 8, 357824880)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (354, 208, 8, 193637626)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (355, 205, 8, 138573817)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (356, 254, 8, 128054300)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (357, 232, 8, 473199134)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (358, 232, 8, 84317564)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (359, 217, 8, 331488212)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (360, 238, 8, 358618479)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (361, 286, 8, 980456417)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (362, 271, 8, 939326517)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (363, 287, 8, 642826729)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (364, 281, 8, 521131100)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (365, 263, 8, 451079746)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (366, 264, 8, 479251704)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (367, 260, 8, 929469182)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (368, 226, 8, 718520577)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (369, 296, 8, 937757761)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (370, 276, 8, 977566074)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (371, 263, 8, 17670628)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (372, 274, 8, 381609720)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (373, 247, 8, 361750129)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (374, 207, 8, 829589098)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (375, 243, 8, 810425900)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (376, 235, 8, 38906945)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (377, 220, 8, 809468870)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (378, 219, 8, 152045632)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (379, 222, 8, 154383983)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (380, 284, 8, 976537843)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (381, 247, 8, 931573269)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (382, 264, 8, 633541162)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (383, 251, 8, 230257587)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (384, 253, 8, 772572849)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (385, 232, 8, 781495408)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (386, 233, 8, 316130204)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (387, 245, 8, 634603479)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (388, 232, 8, 562112965)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (389, 276, 8, 114300087)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (390, 302, 8, 82919485)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (391, 215, 8, 857642480)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (392, 252, 8, 143092069)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (393, 263, 8, 833615219)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (394, 269, 8, 182876037)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (395, 232, 8, 617224099)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (396, 282, 8, 89682657)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (397, 303, 8, 916015172)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (398, 223, 8, 100915756)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (399, 271, 8, 591590469)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (400, 249, 8, 293710051)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (401, 220, 8, 856257846)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (402, 234, 8, 718916855)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (403, 220, 8, 7467144)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (404, 228, 8, 919311891)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (405, 232, 8, 836127032)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (406, 271, 8, 20250144)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (407, 234, 8, 55466715)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (408, 205, 8, 402279075)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (409, 211, 8, 442034267)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (410, 279, 8, 220923026)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (411, 245, 8, 232600047)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (412, 298, 8, 640070669)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (413, 228, 8, 777071109)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (414, 225, 8, 576365133)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (415, 256, 8, 530053692)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (416, 290, 8, 814554864)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (417, 294, 8, 995828402)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (418, 264, 8, 867853554)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (419, 268, 8, 611765812)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (420, 227, 8, 504352970)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (421, 229, 8, 202675209)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (422, 268, 8, 411737617)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (423, 277, 8, 130635888)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (424, 282, 8, 349724626)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (425, 217, 8, 168320290)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (426, 250, 8, 448073642)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (427, 292, 8, 769971032)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (428, 259, 8, 620179919)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (429, 284, 8, 239011167)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (430, 280, 8, 837359418)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (431, 232, 8, 502202246)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (432, 303, 8, 536123706)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (433, 279, 8, 717044210)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (434, 288, 8, 89759424)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (435, 226, 8, 71293763)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (436, 209, 8, 251701571)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (437, 250, 8, 984892477)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (438, 218, 8, 3717681)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (439, 213, 8, 67993693)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (440, 223, 8, 750188430)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (441, 248, 8, 222143208)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (442, 278, 8, 731081044)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (443, 229, 8, 928169073)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (444, 259, 8, 565419621)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (445, 253, 8, 996487182)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (446, 277, 8, 559374663)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (447, 227, 8, 21302396)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (448, 249, 8, 381679839)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (449, 208, 8, 378886550)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (450, 278, 8, 464410537)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (451, 204, 8, 119943738)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (452, 267, 8, 69363725)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (453, 301, 8, 341714998)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (454, 207, 8, 884111124)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (455, 236, 8, 242149636)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (456, 279, 8, 743286350)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (457, 233, 8, 148820945)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (458, 273, 8, 992890591)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (459, 254, 8, 755641236)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (460, 234, 8, 355986434)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (461, 229, 8, 735623188)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (462, 292, 8, 464580869)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (463, 265, 8, 488187980)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (464, 225, 8, 735195126)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (465, 221, 8, 154379310)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (466, 220, 8, 833569991)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (467, 289, 8, 812955134)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (468, 252, 8, 869284046)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (469, 229, 8, 869814660)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (470, 294, 8, 639800813)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (471, 249, 8, 884748192)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (472, 292, 8, 499306224)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (473, 294, 8, 874921258)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (474, 225, 8, 144417764)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (475, 232, 8, 618787994)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (476, 233, 8, 95103241)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (477, 212, 8, 407355768)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (478, 211, 8, 436412723)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (479, 277, 8, 882452439)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (480, 284, 8, 733366823)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (481, 252, 8, 593711740)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (482, 216, 8, 934891493)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (483, 272, 8, 360923987)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (484, 247, 8, 896593492)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (485, 226, 8, 172257347)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (486, 291, 8, 496814291)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (487, 237, 8, 823377586)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (488, 284, 8, 75284808)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (489, 259, 8, 802173411)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (490, 268, 8, 736967497)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (491, 226, 8, 442984029)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (492, 207, 8, 269095312)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (493, 271, 8, 978199594)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (494, 235, 8, 575577553)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (495, 230, 8, 637184807)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (496, 206, 8, 843847205)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (497, 283, 8, 690792402)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (498, 260, 8, 847672247)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (499, 262, 8, 638556405)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (500, 218, 8, 832642574)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (501, 239, 8, 96740549)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (502, 301, 8, 109215102)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (503, 227, 8, 821524928)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (504, 265, 8, 726203051)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (505, 215, 8, 385033230)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (506, 277, 8, 126839213)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (507, 213, 8, 155595206)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (508, 215, 8, 388724826)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (509, 266, 8, 271591240)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (510, 283, 8, 236397049)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (511, 272, 8, 568491136)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (512, 229, 8, 814653955)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (513, 215, 8, 929676435)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (514, 246, 8, 705887471)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (515, 303, 8, 672247372)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (516, 283, 8, 85288970)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (517, 250, 8, 507997207)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (518, 282, 8, 578033734)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (519, 230, 8, 649009836)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (520, 242, 8, 641442560)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (521, 224, 8, 145015960)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (522, 232, 8, 716652471)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (523, 227, 8, 241374132)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (524, 212, 8, 410892897)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (525, 261, 8, 829639780)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (526, 205, 8, 661417836)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (527, 232, 8, 323318567)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (528, 225, 8, 362734076)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (529, 283, 8, 636901903)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (530, 259, 8, 308380011)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (531, 232, 8, 265991590)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (532, 288, 8, 749533997)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (533, 265, 8, 868781177)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (534, 227, 8, 461724127)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (535, 214, 8, 746786377)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (536, 232, 8, 830608864)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (537, 264, 8, 306181024)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (538, 211, 8, 352189032)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (539, 224, 8, 958519177)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (540, 257, 8, 425068397)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (541, 238, 8, 598871291)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (542, 232, 8, 530163036)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (543, 302, 8, 37369865)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (544, 232, 8, 247799210)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (545, 222, 8, 613390319)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (546, 237, 8, 775605305)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (547, 264, 8, 794267586)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (548, 301, 8, 71426933)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (549, 232, 8, 656694869)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (550, 277, 8, 631720033)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (551, 263, 8, 238267687)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (552, 271, 8, 890041983)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (553, 224, 8, 265281943)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (554, 253, 8, 360851989)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (555, 300, 8, 668216507)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (556, 249, 8, 915283914)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (557, 221, 8, 853013147)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (558, 215, 8, 966888955)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (559, 289, 8, 801078181)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (560, 285, 8, 500429368)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (561, 285, 8, 588832761)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (562, 244, 8, 104665341)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (563, 208, 8, 746577369)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (564, 269, 8, 704784772)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (565, 292, 8, 965231466)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (566, 269, 8, 957686704)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (567, 302, 8, 418396853)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (568, 270, 8, 910127950)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (569, 293, 8, 103523281)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (570, 232, 8, 201896220)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (571, 300, 8, 193226458)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (572, 280, 8, 268089686)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (573, 300, 8, 738242876)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (574, 271, 8, 377418095)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (575, 232, 8, 679732973)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (576, 301, 8, 276610862)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (577, 257, 8, 156270217)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (578, 232, 8, 629210442)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (579, 301, 8, 673731584)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (580, 285, 8, 634306977)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (581, 214, 8, 556666907)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (582, 295, 8, 564137915)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (583, 253, 8, 781099071)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (584, 246, 8, 17620715)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (585, 279, 8, 56439354)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (586, 214, 8, 195200675)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (587, 242, 8, 675500750)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (588, 250, 8, 726612411)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (589, 254, 8, 549147713)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (590, 208, 8, 614916258)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (591, 245, 8, 5716644)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (592, 247, 8, 514036956)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (593, 222, 8, 849272981)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (594, 232, 8, 314027090)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (595, 218, 8, 898114798)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (596, 287, 8, 102429742)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (597, 280, 8, 203178460)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (598, 290, 8, 779027804)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (599, 265, 8, 731577583)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (600, 222, 8, 350656260)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (601, 263, 8, 436915719)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (602, 250, 8, 761343817)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (603, 258, 8, 660480050)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (604, 300, 8, 801932221)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (605, 205, 8, 664657271)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (606, 206, 8, 569380618)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (607, 239, 8, 585564615)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (608, 235, 8, 626585710)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (609, 291, 8, 410890668)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (610, 281, 8, 893457552)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (611, 209, 8, 550799240)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (612, 284, 8, 909187646)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (613, 225, 8, 712122038)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (614, 276, 8, 614293337)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (615, 293, 8, 634174480)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (616, 232, 8, 135440841)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (617, 219, 8, 555818389)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (618, 205, 8, 718497292)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (619, 291, 8, 889240218)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (620, 229, 8, 333998866)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (621, 231, 8, 477474927)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (622, 222, 8, 722981456)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (623, 289, 8, 542411280)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (624, 302, 8, 905529638)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (625, 233, 8, 111040172)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (626, 210, 8, 494243502)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (627, 209, 8, 258043443)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (628, 226, 8, 89639970)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (629, 269, 8, 93694241)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (630, 254, 8, 968171485)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (631, 237, 8, 245581672)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (632, 258, 8, 406031367)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (633, 268, 8, 909071984)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (634, 274, 8, 481340204)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (635, 274, 8, 887273834)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (636, 231, 8, 247670810)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (637, 282, 8, 847899222)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (638, 288, 8, 317523608)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (639, 245, 8, 645846659)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (640, 234, 8, 197030418)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (641, 271, 8, 869963687)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (642, 255, 8, 84022924)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (643, 260, 8, 418866748)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (644, 292, 8, 913338402)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (645, 210, 8, 39555330)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (646, 258, 8, 386469555)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (647, 283, 8, 965298536)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (648, 294, 8, 199459500)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (649, 232, 8, 237448085)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (650, 267, 8, 850056602)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (651, 224, 8, 53492857)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (652, 283, 8, 867129748)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (653, 233, 8, 226832388)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (654, 214, 8, 295674876)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (655, 246, 8, 876391708)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (656, 260, 8, 61328076)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (657, 252, 8, 959486339)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (658, 248, 8, 29140318)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (659, 274, 8, 585592821)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (660, 217, 8, 922150707)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (661, 260, 8, 648813954)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (662, 229, 8, 198887103)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (663, 211, 8, 91134048)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (664, 256, 8, 531275549)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (665, 290, 8, 610118361)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (666, 252, 8, 274882789)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (667, 227, 8, 61693753)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (668, 281, 8, 196340829)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (669, 215, 8, 213613160)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (670, 208, 8, 111163440)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (671, 245, 8, 515334521)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (672, 299, 8, 734951605)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (673, 230, 8, 105459837)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (674, 283, 8, 203747511)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (675, 239, 8, 870535571)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (676, 234, 8, 13162756)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (677, 258, 8, 36582351)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (678, 246, 8, 706666957)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (679, 256, 8, 652353226)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (680, 262, 8, 527417116)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (681, 269, 8, 815343424)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (682, 260, 8, 376683774)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (683, 204, 8, 333934434)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (684, 285, 8, 33084590)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (685, 259, 8, 482484670)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (686, 285, 8, 89913152)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (687, 280, 8, 464622575)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (688, 208, 8, 967936636)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (689, 291, 8, 955133701)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (690, 242, 8, 845762882)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (691, 260, 8, 443620246)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (692, 219, 8, 434801230)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (693, 226, 8, 658383245)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (694, 295, 8, 257713592)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (695, 273, 8, 206439012)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (696, 234, 8, 336813850)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (697, 280, 8, 407042948)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (698, 298, 8, 105169299)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (699, 297, 8, 86337910)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (700, 276, 8, 620306663)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (701, 276, 8, 685743073)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (702, 287, 8, 723415517)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (703, 253, 8, 445610670)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (704, 260, 8, 820033783)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (705, 246, 8, 130127732)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (706, 232, 8, 87873498)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (707, 289, 8, 608323329)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (708, 271, 8, 273434938)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (709, 263, 8, 547489187)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (710, 296, 8, 485271373)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (711, 242, 8, 568710453)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (712, 232, 8, 85773159)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (713, 299, 8, 615903880)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (714, 216, 8, 747928795)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (715, 273, 8, 282616884)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (716, 245, 8, 954319433)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (717, 245, 8, 120069619)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (718, 223, 8, 863024041)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (719, 225, 8, 655937119)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (720, 223, 8, 920637195)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (721, 252, 8, 61996763)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (722, 301, 8, 872713324)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (723, 295, 8, 131155100)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (724, 235, 8, 200671234)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (725, 232, 8, 662871669)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (726, 236, 8, 414555479)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (727, 272, 8, 92474306)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (728, 301, 8, 154531249)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (729, 281, 8, 784785708)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (730, 286, 8, 465913852)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (731, 283, 8, 446333973)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (732, 240, 8, 213498573)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (733, 294, 8, 934859727)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (734, 300, 8, 24560452)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (735, 291, 8, 901826395)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (736, 278, 8, 409246099)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (737, 235, 8, 193249514)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (738, 213, 8, 540783353)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (739, 223, 8, 228483620)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (740, 256, 8, 66105349)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (741, 282, 8, 224463515)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (742, 250, 8, 723506265)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (743, 297, 8, 366481648)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (744, 261, 8, 526909576)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (745, 275, 8, 592061797)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (746, 228, 8, 168554116)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (747, 260, 8, 489415610)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (748, 267, 8, 2182848)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (749, 205, 8, 643191465)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (750, 206, 8, 536221876)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (751, 214, 8, 360995142)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (752, 296, 8, 726257840)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (753, 214, 8, 26579227)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (754, 290, 8, 879060920)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (755, 290, 8, 569214326)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (756, 285, 8, 391609151)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (757, 276, 8, 503970788)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (758, 217, 8, 671871707)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (759, 283, 8, 49349116)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (760, 212, 8, 100176496)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (761, 294, 8, 544913604)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (762, 240, 8, 37084813)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (763, 217, 8, 191930966)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (764, 294, 8, 357798887)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (765, 211, 8, 393966565)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (766, 236, 8, 299227890)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (767, 230, 8, 526125888)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (768, 221, 8, 634127255)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (769, 206, 8, 931506793)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (770, 290, 8, 561876672)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (771, 245, 8, 837224985)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (772, 211, 8, 627762536)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (773, 211, 8, 279282732)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (774, 248, 8, 841588324)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (775, 270, 8, 856348541)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (776, 288, 8, 919500870)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (777, 231, 8, 145541004)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (778, 299, 8, 823258565)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (779, 219, 8, 173480538)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (780, 246, 8, 684532853)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (781, 277, 8, 603015465)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (782, 232, 8, 296405317)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (783, 223, 8, 958776377)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (784, 252, 8, 154830527)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (785, 251, 8, 450884131)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (786, 258, 8, 881051117)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (787, 302, 8, 428314301)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (788, 236, 8, 997651666)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (789, 207, 8, 58218169)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (790, 229, 8, 990286917)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (791, 294, 8, 520391100)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (792, 274, 8, 192288431)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (793, 209, 8, 114736408)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (794, 232, 8, 67412469)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (795, 254, 8, 184670251)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (796, 266, 8, 593206307)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (797, 216, 8, 859448650)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (798, 293, 8, 565555501)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (799, 240, 8, 970732922)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (800, 258, 8, 705371219)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (801, 210, 8, 779566502)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (802, 239, 8, 918672354)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (803, 217, 8, 688476969)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (804, 232, 8, 83688599)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (805, 295, 8, 920366885)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (806, 281, 8, 68818855)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (807, 261, 8, 22599528)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (808, 289, 8, 38260560)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (809, 207, 8, 106004129)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (810, 213, 8, 779140932)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (811, 301, 8, 309447153)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (812, 301, 8, 325459361)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (813, 286, 8, 347001974)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (814, 220, 8, 359537378)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (815, 302, 8, 974356208)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (816, 218, 8, 432570217)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (817, 250, 8, 30013369)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (818, 273, 8, 1592322)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (819, 216, 8, 633278282)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (820, 209, 8, 665789452)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (821, 227, 8, 14343925)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (822, 276, 8, 801832952)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (823, 297, 8, 968127712)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (824, 293, 8, 443380543)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (825, 208, 8, 923925340)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (826, 278, 8, 901956078)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (827, 227, 8, 850938786)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (828, 302, 8, 139277341)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (829, 299, 8, 938959483)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (830, 301, 8, 123098613)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (831, 275, 8, 124117758)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (832, 255, 8, 307828522)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (833, 303, 8, 59692885)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (834, 249, 8, 7530948)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (835, 225, 8, 645356127)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (836, 232, 8, 771096363)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (837, 267, 8, 795042987)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (838, 268, 8, 732422048)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (839, 279, 8, 849525678)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (840, 241, 8, 630194725)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (841, 215, 8, 17943895)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (842, 234, 8, 298611764)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (843, 268, 8, 979024118)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (844, 302, 8, 983891922)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (845, 300, 8, 841602183)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (846, 295, 8, 474389086)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (847, 298, 8, 287156511)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (848, 219, 8, 697637940)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (849, 240, 8, 277144836)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (850, 215, 8, 700598965)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (851, 302, 8, 124530332)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (852, 283, 8, 521554514)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (853, 255, 8, 749007564)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (854, 295, 8, 301203598)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (855, 293, 8, 617866961)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (856, 287, 8, 815269638)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (857, 289, 8, 83616237)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (858, 259, 8, 420980780)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (859, 233, 8, 72563867)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (860, 282, 8, 89077293)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (861, 222, 8, 200853973)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (862, 208, 8, 19419218)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (863, 265, 8, 940778287)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (864, 258, 8, 990102317)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (865, 289, 8, 216223806)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (866, 251, 8, 713498489)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (867, 258, 8, 84341115)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (868, 302, 8, 158051016)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (869, 279, 8, 488516346)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (870, 275, 8, 389321531)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (871, 286, 8, 801997842)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (872, 207, 8, 271421922)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (873, 211, 8, 219094637)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (874, 281, 8, 484944234)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (875, 302, 8, 247592325)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (876, 212, 8, 303195776)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (877, 272, 8, 232226861)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (878, 250, 8, 285361515)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (879, 288, 8, 188276648)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (880, 268, 8, 581647667)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (881, 235, 8, 415187117)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (882, 211, 8, 780460817)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (883, 241, 8, 858826111)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (884, 249, 8, 219632517)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (885, 252, 8, 207069233)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (886, 239, 8, 2978684)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (887, 299, 8, 320079020)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (888, 284, 8, 122695151)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (889, 283, 8, 278287088)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (890, 237, 8, 617561115)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (891, 216, 8, 513458308)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (892, 267, 8, 865951577)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (893, 297, 8, 964513871)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (894, 212, 8, 271192453)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (895, 301, 8, 210360361)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (896, 255, 8, 479684522)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (897, 223, 8, 171454922)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (898, 232, 8, 777598139)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (899, 249, 8, 695960749)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (900, 209, 8, 261715312)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (901, 242, 8, 597347210)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (902, 216, 8, 931144186)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (903, 207, 8, 253300709)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (904, 219, 8, 690093933)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (905, 251, 8, 254189427)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (906, 298, 8, 594732384)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (907, 265, 8, 320510310)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (908, 247, 8, 738711089)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (909, 210, 8, 202868953)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (910, 255, 8, 760607831)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (911, 296, 8, 689605256)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (912, 280, 8, 798817585)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (913, 282, 8, 938659864)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (914, 296, 8, 638700823)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (915, 219, 8, 583561940)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (916, 235, 8, 449518277)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (917, 270, 8, 852034134)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (918, 253, 8, 44499175)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (919, 283, 8, 60198213)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (920, 283, 8, 925011049)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (921, 256, 8, 420173406)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (922, 227, 8, 67750255)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (923, 236, 8, 717118892)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (924, 276, 8, 328775188)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (925, 268, 8, 233285207)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (926, 226, 8, 22409456)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (927, 209, 8, 462258714)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (928, 251, 8, 432119252)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (929, 239, 8, 802794825)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (930, 296, 8, 483363691)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (931, 282, 8, 789623820)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (932, 287, 8, 182709666)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (933, 261, 8, 234752995)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (934, 245, 8, 483712900)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (935, 230, 8, 766303192)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (936, 234, 8, 231419720)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (937, 243, 8, 311114647)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (938, 254, 8, 423600995)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (939, 232, 8, 512247426)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (940, 251, 8, 531823831)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (941, 253, 8, 757865398)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (942, 248, 8, 103855346)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (943, 208, 8, 348413823)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (944, 221, 8, 359364339)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (945, 270, 8, 611376186)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (946, 210, 8, 974232511)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (947, 249, 8, 315934624)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (948, 249, 8, 488216791)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (949, 245, 8, 766253525)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (950, 228, 8, 673184242)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (951, 269, 8, 669067411)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (952, 243, 8, 64785644)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (953, 219, 8, 93955695)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (954, 287, 8, 212190131)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (955, 247, 8, 456190299)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (956, 300, 8, 71087430)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (957, 303, 8, 245387892)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (958, 261, 8, 811586308)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (959, 212, 8, 291621541)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (960, 233, 8, 985480063)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (961, 226, 8, 778633146)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (962, 290, 8, 917358077)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (963, 279, 8, 343622953)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (964, 217, 8, 420527842)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (965, 225, 8, 167180911)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (966, 268, 8, 637620059)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (967, 215, 8, 580409529)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (968, 213, 8, 320074031)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (969, 257, 8, 402794571)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (970, 228, 8, 810935189)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (971, 282, 8, 447624110)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (972, 217, 8, 285284957)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (973, 255, 8, 191634650)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (974, 212, 8, 198312063)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (975, 234, 8, 686384599)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (976, 228, 8, 862538878)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (977, 260, 8, 882778106)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (978, 283, 8, 295870862)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (979, 251, 8, 558150034)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (980, 231, 8, 868294463)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (981, 253, 8, 748384060)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (982, 224, 8, 934380952)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (983, 232, 8, 920884966)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (984, 261, 8, 134743152)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (985, 255, 8, 816554200)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (986, 215, 8, 217203559)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (987, 302, 8, 614519567)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (988, 215, 8, 422700273)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (993, 251, 9, 260453509)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (994, 234, 9, 403793385)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (995, 285, 9, 852246379)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (996, 231, 9, 735667289)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (997, 286, 9, 757951966)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (998, 232, 9, 665745364)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (999, 223, 9, 801847680)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1000, 222, 9, 287237352)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1001, 230, 9, 613995479)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1002, 276, 9, 799974681)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1003, 265, 9, 567405216)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1004, 208, 9, 879221939)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1005, 301, 9, 953896436)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1006, 301, 9, 789591829)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1007, 233, 9, 685340782)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1008, 303, 9, 15758183)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1009, 214, 9, 702195361)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1010, 244, 9, 531711382)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1011, 218, 9, 582702116)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1012, 251, 9, 7539189)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1013, 296, 9, 710586639)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1014, 224, 9, 965665296)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1015, 290, 9, 888188950)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1016, 283, 9, 747286210)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1017, 234, 9, 489702151)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1018, 273, 9, 314146073)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1019, 270, 9, 654691987)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1020, 251, 9, 222433056)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1021, 284, 9, 723397486)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1022, 287, 9, 298223819)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1023, 241, 9, 268090823)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1024, 251, 9, 961391645)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1025, 219, 9, 245246476)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1026, 252, 9, 993478913)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1027, 299, 9, 221020733)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1028, 229, 9, 905020500)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1029, 206, 9, 578785305)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1030, 242, 9, 257335495)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1031, 274, 9, 765170683)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1032, 302, 9, 526499225)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1033, 269, 9, 636079254)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1034, 212, 9, 478925232)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1035, 217, 9, 781986681)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1036, 278, 9, 649176498)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1037, 219, 9, 372490780)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1038, 231, 9, 576019402)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1039, 261, 9, 964791125)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1040, 233, 9, 202484044)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1041, 257, 9, 669939410)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1042, 251, 9, 308959667)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1043, 268, 9, 123785443)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1044, 206, 9, 756096109)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1045, 273, 9, 285958984)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1046, 280, 9, 878653803)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1047, 218, 9, 731173721)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1048, 242, 9, 844121033)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1049, 229, 9, 585577576)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1050, 235, 9, 170487768)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1051, 266, 9, 163019409)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1052, 292, 9, 805239923)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1053, 238, 9, 590741723)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1054, 218, 9, 798882092)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1055, 299, 9, 410838539)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1056, 258, 9, 684537941)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1057, 258, 9, 896079980)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1058, 204, 9, 981330301)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1059, 281, 9, 943156033)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1060, 238, 9, 647230436)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1061, 216, 9, 979941902)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1062, 235, 9, 722056037)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1063, 239, 9, 523467821)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1064, 261, 9, 952800439)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1065, 300, 9, 548584283)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1066, 268, 9, 949134708)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1067, 264, 9, 534280129)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1068, 241, 9, 959184464)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1069, 258, 9, 178133796)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1070, 272, 9, 447650759)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1071, 300, 9, 474496848)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1072, 214, 9, 768086492)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1073, 282, 9, 850255286)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1074, 232, 9, 626507126)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1075, 221, 9, 964408208)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1076, 260, 9, 437871438)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1077, 300, 9, 143424077)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1078, 294, 9, 237608261)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1079, 300, 9, 802929413)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1080, 272, 9, 319105569)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1081, 271, 9, 569431582)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1082, 232, 9, 181039777)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1083, 293, 9, 490956399)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1084, 224, 9, 734922379)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1085, 230, 9, 921348781)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1086, 236, 9, 738200433)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1087, 261, 9, 128109782)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1088, 235, 9, 316724161)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1089, 297, 9, 843758656)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1090, 299, 9, 294468046)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1091, 220, 9, 208530721)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1092, 280, 9, 207345801)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1093, 279, 9, 393655112)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1094, 213, 9, 423545576)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1095, 222, 9, 443302233)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1096, 253, 9, 35253928)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1097, 217, 9, 263143255)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1098, 238, 9, 584195894)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1099, 214, 9, 438512450)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1100, 216, 9, 228073435)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1101, 288, 9, 277250791)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1102, 288, 9, 451917617)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1103, 269, 9, 289418008)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1104, 216, 9, 12084894)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1105, 210, 9, 132833863)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1106, 271, 9, 80277486)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1107, 292, 9, 575806706)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1108, 224, 9, 432513513)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1109, 258, 9, 803047045)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1110, 261, 9, 251945203)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1111, 253, 9, 797127389)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1112, 213, 9, 890533304)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1113, 256, 9, 108227619)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1114, 228, 9, 872211764)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1115, 228, 9, 551480156)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1116, 218, 9, 589737142)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1117, 229, 9, 604546498)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1118, 251, 9, 251093235)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1119, 265, 9, 680083885)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1120, 245, 9, 588897016)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1121, 232, 9, 603856597)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1122, 221, 9, 137467591)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1123, 257, 9, 443960462)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1124, 291, 9, 29847585)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1125, 249, 9, 256180256)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1126, 263, 9, 903275877)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1127, 240, 9, 724912941)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1128, 250, 9, 105845380)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1129, 241, 9, 400736702)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1130, 245, 9, 424441669)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1131, 235, 9, 128715010)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1132, 302, 9, 180916656)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1133, 235, 9, 284274741)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1134, 216, 9, 439066842)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1135, 207, 9, 775806078)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1136, 207, 9, 244886713)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1137, 236, 9, 796147139)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1138, 250, 9, 55934435)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1139, 223, 9, 631801780)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1140, 204, 9, 196946944)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1141, 248, 9, 326752902)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1142, 286, 9, 493516557)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1143, 219, 9, 742781174)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1144, 293, 9, 503131084)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1145, 229, 9, 83355623)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1146, 230, 9, 768995333)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1147, 285, 9, 551168141)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1148, 278, 9, 568849593)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1149, 247, 9, 399255291)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1150, 243, 9, 536066835)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1151, 258, 9, 59990272)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1152, 240, 9, 426005483)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1153, 288, 9, 88217466)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1154, 255, 9, 182000297)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1155, 260, 9, 199292782)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1156, 253, 9, 484919708)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1157, 262, 9, 927490878)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1158, 239, 9, 447936003)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1159, 296, 9, 334449833)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1160, 205, 9, 556537608)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1161, 241, 9, 478989035)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1162, 244, 9, 531970920)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1163, 260, 9, 789719328)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1164, 252, 9, 271511184)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1165, 269, 9, 223874075)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1166, 300, 9, 881370843)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1167, 205, 9, 247966093)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1168, 221, 9, 724066340)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1169, 241, 9, 392600777)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1170, 262, 9, 333329350)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1171, 212, 9, 109395953)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1172, 249, 9, 874255111)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1173, 258, 9, 730996928)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1174, 254, 9, 452633079)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1175, 253, 9, 933660177)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1176, 275, 9, 25702957)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1177, 225, 9, 887302711)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1178, 248, 9, 920175403)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1179, 214, 9, 359882071)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1180, 220, 9, 841750343)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1181, 223, 9, 445414920)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1182, 300, 9, 544397253)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1183, 286, 9, 85194652)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1184, 232, 9, 391853774)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1185, 273, 9, 709430780)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1186, 204, 9, 952768961)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1187, 259, 9, 262836480)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1188, 259, 9, 971289134)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1189, 206, 9, 499979378)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1190, 244, 9, 93618722)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1191, 287, 9, 272715409)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1192, 226, 9, 797110189)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1193, 278, 9, 499815447)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1194, 231, 9, 236236131)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1195, 229, 9, 946374343)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1196, 270, 9, 130591569)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1197, 301, 9, 530889166)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1198, 235, 9, 318684869)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1199, 256, 9, 803487317)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1200, 228, 9, 122708123)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1201, 251, 9, 905484670)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1202, 249, 9, 902051495)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1203, 289, 9, 115401092)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1204, 284, 9, 394402842)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1205, 231, 9, 199060813)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1206, 299, 9, 689749237)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1207, 231, 9, 445008039)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1208, 264, 9, 804338311)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1209, 220, 9, 140367508)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1210, 214, 9, 449821068)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1211, 236, 9, 34340175)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1212, 232, 9, 421383673)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1213, 271, 9, 406684993)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1214, 217, 9, 154963084)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1215, 256, 9, 122031883)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1216, 243, 9, 879738039)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1217, 236, 9, 728775849)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1218, 215, 9, 985957784)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1219, 290, 9, 935509006)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1220, 239, 9, 195721077)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1221, 230, 9, 212398410)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1222, 299, 9, 184225937)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1223, 224, 9, 160396933)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1224, 270, 9, 40420057)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1225, 211, 9, 763996267)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1226, 287, 9, 251220028)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1227, 296, 9, 949713870)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1228, 223, 9, 750394773)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1229, 253, 9, 902810723)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1230, 216, 9, 829302131)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1231, 218, 9, 155093976)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1232, 257, 9, 903034773)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1233, 278, 9, 853612883)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1234, 286, 9, 217532799)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1235, 299, 9, 803558467)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1236, 289, 9, 647788099)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1237, 277, 9, 32224827)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1238, 258, 9, 680599105)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1239, 255, 9, 663410106)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1240, 295, 9, 20049309)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1241, 275, 9, 860010991)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1242, 252, 9, 248921050)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1243, 300, 9, 684333689)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1244, 283, 9, 622382230)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1245, 301, 9, 890476263)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1246, 293, 9, 82782867)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1247, 221, 9, 233511350)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1248, 299, 9, 252804121)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1249, 266, 9, 905664700)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1250, 242, 9, 128749522)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1251, 216, 9, 36031721)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1252, 250, 9, 612890943)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1253, 216, 9, 928063962)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1254, 245, 9, 204616910)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1255, 299, 9, 317293041)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1256, 277, 9, 224758528)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1257, 215, 9, 823072806)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1258, 228, 9, 583208193)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1259, 260, 9, 208591191)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1260, 263, 9, 699852466)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1261, 258, 9, 292933715)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1262, 242, 9, 786455963)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1263, 235, 9, 913842151)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1264, 244, 9, 615469225)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1265, 208, 9, 788132688)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1266, 279, 9, 804296064)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1267, 238, 9, 904933569)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1268, 287, 9, 690094966)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1269, 303, 9, 373789678)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1270, 248, 9, 740985473)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1271, 239, 9, 85115597)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1272, 238, 9, 896933571)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1273, 229, 9, 832809837)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1274, 283, 9, 612311510)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1275, 213, 9, 800400371)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1276, 241, 9, 990739370)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1277, 277, 9, 549695677)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1278, 250, 9, 498571504)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1279, 235, 9, 548131931)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1280, 281, 9, 554145152)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1281, 293, 9, 230772504)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1282, 283, 9, 900618280)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1283, 273, 9, 812956911)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1284, 285, 9, 123301564)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1285, 249, 9, 565474577)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1286, 242, 9, 983464488)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1287, 241, 9, 223807585)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1288, 220, 9, 526757792)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1289, 208, 9, 528727048)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1290, 211, 9, 558167339)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1291, 267, 9, 818978646)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1292, 251, 9, 242080179)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1293, 289, 9, 732288429)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1294, 205, 9, 977275213)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1295, 240, 9, 554967088)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1296, 281, 9, 21606137)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1297, 255, 9, 423471234)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1298, 256, 9, 732330512)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1299, 259, 9, 156858123)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1300, 270, 9, 379156740)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1301, 237, 9, 258123387)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1302, 267, 9, 958443272)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1303, 266, 9, 930502200)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1304, 296, 9, 538000493)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1305, 270, 9, 776766685)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1306, 232, 9, 272628664)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1307, 213, 9, 401669725)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1308, 253, 9, 526676343)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1309, 264, 9, 778070147)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1310, 230, 9, 7036599)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1311, 282, 9, 467733355)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1312, 284, 9, 846385273)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1313, 251, 9, 880209798)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1314, 219, 9, 39867364)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1315, 236, 9, 896017310)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1316, 294, 9, 391372660)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1317, 301, 9, 1183207)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1318, 212, 9, 21263172)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1319, 242, 9, 834191047)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1320, 233, 9, 627549664)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1321, 229, 9, 361020924)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1322, 261, 9, 471846589)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1323, 244, 9, 170401937)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1324, 292, 9, 131051974)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1325, 244, 9, 47899803)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1326, 274, 9, 460558960)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1327, 232, 9, 779885405)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1328, 231, 9, 43995536)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1329, 283, 9, 339464798)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1330, 266, 9, 570039130)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1331, 287, 9, 208253849)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1332, 285, 9, 360201274)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1333, 267, 9, 658957599)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1334, 277, 9, 485914761)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1335, 232, 9, 805435895)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1336, 214, 9, 719584077)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1337, 233, 9, 262654860)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1338, 207, 9, 555901026)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1339, 205, 9, 102598127)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1340, 246, 9, 346982279)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1341, 267, 9, 66083551)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1342, 205, 9, 111057776)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1343, 232, 9, 764989774)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1344, 296, 9, 738909617)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1345, 267, 9, 357824880)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1346, 208, 9, 193637626)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1347, 205, 9, 138573817)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1348, 254, 9, 128054300)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1349, 232, 9, 473199134)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1350, 232, 9, 84317564)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1351, 217, 9, 331488212)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1352, 238, 9, 358618479)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1353, 286, 9, 980456417)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1354, 271, 9, 939326517)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1355, 287, 9, 642826729)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1356, 281, 9, 521131100)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1357, 263, 9, 451079746)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1358, 264, 9, 479251704)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1359, 260, 9, 929469182)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1360, 226, 9, 718520577)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1361, 296, 9, 937757761)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1362, 276, 9, 977566074)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1363, 263, 9, 17670628)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1364, 274, 9, 381609720)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1365, 247, 9, 361750129)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1366, 207, 9, 829589098)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1367, 243, 9, 810425900)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1368, 235, 9, 38906945)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1369, 220, 9, 809468870)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1370, 219, 9, 152045632)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1371, 222, 9, 154383983)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1372, 284, 9, 976537843)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1373, 247, 9, 931573269)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1374, 264, 9, 633541162)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1375, 251, 9, 230257587)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1376, 253, 9, 772572849)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1377, 232, 9, 781495408)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1378, 233, 9, 316130204)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1379, 245, 9, 634603479)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1380, 232, 9, 562112965)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1381, 276, 9, 114300087)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1382, 302, 9, 82919485)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1383, 215, 9, 857642480)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1384, 252, 9, 143092069)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1385, 263, 9, 833615219)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1386, 269, 9, 182876037)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1387, 232, 9, 617224099)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1388, 282, 9, 89682657)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1389, 303, 9, 916015172)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1390, 223, 9, 100915756)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1391, 271, 9, 591590469)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1392, 249, 9, 293710051)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1393, 220, 9, 856257846)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1394, 234, 9, 718916855)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1395, 220, 9, 7467144)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1396, 228, 9, 919311891)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1397, 232, 9, 836127032)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1398, 271, 9, 20250144)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1399, 234, 9, 55466715)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1400, 205, 9, 402279075)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1401, 211, 9, 442034267)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1402, 279, 9, 220923026)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1403, 245, 9, 232600047)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1404, 298, 9, 640070669)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1405, 228, 9, 777071109)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1406, 225, 9, 576365133)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1407, 256, 9, 530053692)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1408, 290, 9, 814554864)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1409, 294, 9, 995828402)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1410, 264, 9, 867853554)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1411, 268, 9, 611765812)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1412, 227, 9, 504352970)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1413, 229, 9, 202675209)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1414, 268, 9, 411737617)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1415, 277, 9, 130635888)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1416, 282, 9, 349724626)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1417, 217, 9, 168320290)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1418, 250, 9, 448073642)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1419, 292, 9, 769971032)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1420, 259, 9, 620179919)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1421, 284, 9, 239011167)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1422, 280, 9, 837359418)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1423, 232, 9, 502202246)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1424, 303, 9, 536123706)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1425, 279, 9, 717044210)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1426, 288, 9, 89759424)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1427, 226, 9, 71293763)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1428, 209, 9, 251701571)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1429, 250, 9, 984892477)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1430, 218, 9, 3717681)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1431, 213, 9, 67993693)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1432, 223, 9, 750188430)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1433, 248, 9, 222143208)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1434, 278, 9, 731081044)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1435, 229, 9, 928169073)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1436, 259, 9, 565419621)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1437, 253, 9, 996487182)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1438, 277, 9, 559374663)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1439, 227, 9, 21302396)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1440, 249, 9, 381679839)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1441, 208, 9, 378886550)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1442, 278, 9, 464410537)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1443, 204, 9, 119943738)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1444, 267, 9, 69363725)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1445, 301, 9, 341714998)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1446, 207, 9, 884111124)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1447, 236, 9, 242149636)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1448, 279, 9, 743286350)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1449, 233, 9, 148820945)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1450, 273, 9, 992890591)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1451, 254, 9, 755641236)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1452, 234, 9, 355986434)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1453, 229, 9, 735623188)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1454, 292, 9, 464580869)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1455, 265, 9, 488187980)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1456, 225, 9, 735195126)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1457, 221, 9, 154379310)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1458, 220, 9, 833569991)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1459, 289, 9, 812955134)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1460, 252, 9, 869284046)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1461, 229, 9, 869814660)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1462, 294, 9, 639800813)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1463, 249, 9, 884748192)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1464, 292, 9, 499306224)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1465, 294, 9, 874921258)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1466, 225, 9, 144417764)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1467, 232, 9, 618787994)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1468, 233, 9, 95103241)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1469, 212, 9, 407355768)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1470, 211, 9, 436412723)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1471, 277, 9, 882452439)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1472, 284, 9, 733366823)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1473, 252, 9, 593711740)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1474, 216, 9, 934891493)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1475, 272, 9, 360923987)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1476, 247, 9, 896593492)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1477, 226, 9, 172257347)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1478, 291, 9, 496814291)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1479, 237, 9, 823377586)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1480, 284, 9, 75284808)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1481, 259, 9, 802173411)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1482, 268, 9, 736967497)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1483, 226, 9, 442984029)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1484, 207, 9, 269095312)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1485, 271, 9, 978199594)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1486, 235, 9, 575577553)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1487, 230, 9, 637184807)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1488, 206, 9, 843847205)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1489, 283, 9, 690792402)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1490, 260, 9, 847672247)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1491, 262, 9, 638556405)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1492, 218, 9, 832642574)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1493, 239, 9, 96740549)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1494, 301, 9, 109215102)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1495, 227, 9, 821524928)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1496, 265, 9, 726203051)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1497, 215, 9, 385033230)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1498, 277, 9, 126839213)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1499, 213, 9, 155595206)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1500, 215, 9, 388724826)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1501, 266, 9, 271591240)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1502, 283, 9, 236397049)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1503, 272, 9, 568491136)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1504, 229, 9, 814653955)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1505, 215, 9, 929676435)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1506, 246, 9, 705887471)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1507, 303, 9, 672247372)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1508, 283, 9, 85288970)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1509, 250, 9, 507997207)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1510, 282, 9, 578033734)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1511, 230, 9, 649009836)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1512, 242, 9, 641442560)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1513, 224, 9, 145015960)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1514, 232, 9, 716652471)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1515, 227, 9, 241374132)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1516, 212, 9, 410892897)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1517, 261, 9, 829639780)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1518, 205, 9, 661417836)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1519, 232, 9, 323318567)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1520, 225, 9, 362734076)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1521, 283, 9, 636901903)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1522, 259, 9, 308380011)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1523, 232, 9, 265991590)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1524, 288, 9, 749533997)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1525, 265, 9, 868781177)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1526, 227, 9, 461724127)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1527, 214, 9, 746786377)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1528, 232, 9, 830608864)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1529, 264, 9, 306181024)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1530, 211, 9, 352189032)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1531, 224, 9, 958519177)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1532, 257, 9, 425068397)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1533, 238, 9, 598871291)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1534, 232, 9, 530163036)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1535, 302, 9, 37369865)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1536, 232, 9, 247799210)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1537, 222, 9, 613390319)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1538, 237, 9, 775605305)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1539, 264, 9, 794267586)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1540, 301, 9, 71426933)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1541, 232, 9, 656694869)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1542, 277, 9, 631720033)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1543, 263, 9, 238267687)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1544, 271, 9, 890041983)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1545, 224, 9, 265281943)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1546, 253, 9, 360851989)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1547, 300, 9, 668216507)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1548, 249, 9, 915283914)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1549, 221, 9, 853013147)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1550, 215, 9, 966888955)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1551, 289, 9, 801078181)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1552, 285, 9, 500429368)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1553, 285, 9, 588832761)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1554, 244, 9, 104665341)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1555, 208, 9, 746577369)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1556, 269, 9, 704784772)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1557, 292, 9, 965231466)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1558, 269, 9, 957686704)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1559, 302, 9, 418396853)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1560, 270, 9, 910127950)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1561, 293, 9, 103523281)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1562, 232, 9, 201896220)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1563, 300, 9, 193226458)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1564, 280, 9, 268089686)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1565, 300, 9, 738242876)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1566, 271, 9, 377418095)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1567, 232, 9, 679732973)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1568, 301, 9, 276610862)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1569, 257, 9, 156270217)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1570, 232, 9, 629210442)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1571, 301, 9, 673731584)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1572, 285, 9, 634306977)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1573, 214, 9, 556666907)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1574, 295, 9, 564137915)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1575, 253, 9, 781099071)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1576, 246, 9, 17620715)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1577, 279, 9, 56439354)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1578, 214, 9, 195200675)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1579, 242, 9, 675500750)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1580, 250, 9, 726612411)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1581, 254, 9, 549147713)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1582, 208, 9, 614916258)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1583, 245, 9, 5716644)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1584, 247, 9, 514036956)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1585, 222, 9, 849272981)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1586, 232, 9, 314027090)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1587, 218, 9, 898114798)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1588, 287, 9, 102429742)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1589, 280, 9, 203178460)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1590, 290, 9, 779027804)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1591, 265, 9, 731577583)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1592, 222, 9, 350656260)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1593, 263, 9, 436915719)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1594, 250, 9, 761343817)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1595, 258, 9, 660480050)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1596, 300, 9, 801932221)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1597, 205, 9, 664657271)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1598, 206, 9, 569380618)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1599, 239, 9, 585564615)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1600, 235, 9, 626585710)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1601, 291, 9, 410890668)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1602, 281, 9, 893457552)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1603, 209, 9, 550799240)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1604, 284, 9, 909187646)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1605, 225, 9, 712122038)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1606, 276, 9, 614293337)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1607, 293, 9, 634174480)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1608, 232, 9, 135440841)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1609, 219, 9, 555818389)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1610, 205, 9, 718497292)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1611, 291, 9, 889240218)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1612, 229, 9, 333998866)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1613, 231, 9, 477474927)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1614, 222, 9, 722981456)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1615, 289, 9, 542411280)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1616, 302, 9, 905529638)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1617, 233, 9, 111040172)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1618, 210, 9, 494243502)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1619, 209, 9, 258043443)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1620, 226, 9, 89639970)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1621, 269, 9, 93694241)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1622, 254, 9, 968171485)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1623, 237, 9, 245581672)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1624, 258, 9, 406031367)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1625, 268, 9, 909071984)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1626, 274, 9, 481340204)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1627, 274, 9, 887273834)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1628, 231, 9, 247670810)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1629, 282, 9, 847899222)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1630, 288, 9, 317523608)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1631, 245, 9, 645846659)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1632, 234, 9, 197030418)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1633, 271, 9, 869963687)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1634, 255, 9, 84022924)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1635, 260, 9, 418866748)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1636, 292, 9, 913338402)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1637, 210, 9, 39555330)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1638, 258, 9, 386469555)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1639, 283, 9, 965298536)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1640, 294, 9, 199459500)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1641, 232, 9, 237448085)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1642, 267, 9, 850056602)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1643, 224, 9, 53492857)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1644, 283, 9, 867129748)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1645, 233, 9, 226832388)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1646, 214, 9, 295674876)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1647, 246, 9, 876391708)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1648, 260, 9, 61328076)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1649, 252, 9, 959486339)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1650, 248, 9, 29140318)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1651, 274, 9, 585592821)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1652, 217, 9, 922150707)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1653, 260, 9, 648813954)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1654, 229, 9, 198887103)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1655, 211, 9, 91134048)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1656, 256, 9, 531275549)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1657, 290, 9, 610118361)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1658, 252, 9, 274882789)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1659, 227, 9, 61693753)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1660, 281, 9, 196340829)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1661, 215, 9, 213613160)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1662, 208, 9, 111163440)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1663, 245, 9, 515334521)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1664, 299, 9, 734951605)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1665, 230, 9, 105459837)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1666, 283, 9, 203747511)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1667, 239, 9, 870535571)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1668, 234, 9, 13162756)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1669, 258, 9, 36582351)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1670, 246, 9, 706666957)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1671, 256, 9, 652353226)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1672, 262, 9, 527417116)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1673, 269, 9, 815343424)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1674, 260, 9, 376683774)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1675, 204, 9, 333934434)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1676, 285, 9, 33084590)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1677, 259, 9, 482484670)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1678, 285, 9, 89913152)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1679, 280, 9, 464622575)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1680, 208, 9, 967936636)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1681, 291, 9, 955133701)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1682, 242, 9, 845762882)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1683, 260, 9, 443620246)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1684, 219, 9, 434801230)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1685, 226, 9, 658383245)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1686, 295, 9, 257713592)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1687, 273, 9, 206439012)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1688, 234, 9, 336813850)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1689, 280, 9, 407042948)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1690, 298, 9, 105169299)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1691, 297, 9, 86337910)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1692, 276, 9, 620306663)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1693, 276, 9, 685743073)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1694, 287, 9, 723415517)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1695, 253, 9, 445610670)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1696, 260, 9, 820033783)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1697, 246, 9, 130127732)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1698, 232, 9, 87873498)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1699, 289, 9, 608323329)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1700, 271, 9, 273434938)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1701, 263, 9, 547489187)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1702, 296, 9, 485271373)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1703, 242, 9, 568710453)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1704, 232, 9, 85773159)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1705, 299, 9, 615903880)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1706, 216, 9, 747928795)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1707, 273, 9, 282616884)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1708, 245, 9, 954319433)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1709, 245, 9, 120069619)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1710, 223, 9, 863024041)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1711, 225, 9, 655937119)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1712, 223, 9, 920637195)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1713, 252, 9, 61996763)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1714, 301, 9, 872713324)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1715, 295, 9, 131155100)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1716, 235, 9, 200671234)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1717, 232, 9, 662871669)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1718, 236, 9, 414555479)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1719, 272, 9, 92474306)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1720, 301, 9, 154531249)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1721, 281, 9, 784785708)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1722, 286, 9, 465913852)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1723, 283, 9, 446333973)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1724, 240, 9, 213498573)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1725, 294, 9, 934859727)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1726, 300, 9, 24560452)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1727, 291, 9, 901826395)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1728, 278, 9, 409246099)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1729, 235, 9, 193249514)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1730, 213, 9, 540783353)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1731, 223, 9, 228483620)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1732, 256, 9, 66105349)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1733, 282, 9, 224463515)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1734, 250, 9, 723506265)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1735, 297, 9, 366481648)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1736, 261, 9, 526909576)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1737, 275, 9, 592061797)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1738, 228, 9, 168554116)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1739, 260, 9, 489415610)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1740, 267, 9, 2182848)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1741, 205, 9, 643191465)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1742, 206, 9, 536221876)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1743, 214, 9, 360995142)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1744, 296, 9, 726257840)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1745, 214, 9, 26579227)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1746, 290, 9, 879060920)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1747, 290, 9, 569214326)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1748, 285, 9, 391609151)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1749, 276, 9, 503970788)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1750, 217, 9, 671871707)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1751, 283, 9, 49349116)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1752, 212, 9, 100176496)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1753, 294, 9, 544913604)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1754, 240, 9, 37084813)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1755, 217, 9, 191930966)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1756, 294, 9, 357798887)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1757, 211, 9, 393966565)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1758, 236, 9, 299227890)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1759, 230, 9, 526125888)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1760, 221, 9, 634127255)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1761, 206, 9, 931506793)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1762, 290, 9, 561876672)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1763, 245, 9, 837224985)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1764, 211, 9, 627762536)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1765, 211, 9, 279282732)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1766, 248, 9, 841588324)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1767, 270, 9, 856348541)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1768, 288, 9, 919500870)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1769, 231, 9, 145541004)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1770, 299, 9, 823258565)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1771, 219, 9, 173480538)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1772, 246, 9, 684532853)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1773, 277, 9, 603015465)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1774, 232, 9, 296405317)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1775, 223, 9, 958776377)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1776, 252, 9, 154830527)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1777, 251, 9, 450884131)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1778, 258, 9, 881051117)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1779, 302, 9, 428314301)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1780, 236, 9, 997651666)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1781, 207, 9, 58218169)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1782, 229, 9, 990286917)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1783, 294, 9, 520391100)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1784, 274, 9, 192288431)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1785, 209, 9, 114736408)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1786, 232, 9, 67412469)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1787, 254, 9, 184670251)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1788, 266, 9, 593206307)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1789, 216, 9, 859448650)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1790, 293, 9, 565555501)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1791, 240, 9, 970732922)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1792, 258, 9, 705371219)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1793, 210, 9, 779566502)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1794, 239, 9, 918672354)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1795, 217, 9, 688476969)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1796, 232, 9, 83688599)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1797, 295, 9, 920366885)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1798, 281, 9, 68818855)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1799, 261, 9, 22599528)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1800, 289, 9, 38260560)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1801, 207, 9, 106004129)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1802, 213, 9, 779140932)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1803, 301, 9, 309447153)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1804, 301, 9, 325459361)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1805, 286, 9, 347001974)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1806, 220, 9, 359537378)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1807, 302, 9, 974356208)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1808, 218, 9, 432570217)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1809, 250, 9, 30013369)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1810, 273, 9, 1592322)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1811, 216, 9, 633278282)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1812, 209, 9, 665789452)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1813, 227, 9, 14343925)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1814, 276, 9, 801832952)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1815, 297, 9, 968127712)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1816, 293, 9, 443380543)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1817, 208, 9, 923925340)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1818, 278, 9, 901956078)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1819, 227, 9, 850938786)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1820, 302, 9, 139277341)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1821, 299, 9, 938959483)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1822, 301, 9, 123098613)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1823, 275, 9, 124117758)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1824, 255, 9, 307828522)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1825, 303, 9, 59692885)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1826, 249, 9, 7530948)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1827, 225, 9, 645356127)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1828, 232, 9, 771096363)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1829, 267, 9, 795042987)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1830, 268, 9, 732422048)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1831, 279, 9, 849525678)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1832, 241, 9, 630194725)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1833, 215, 9, 17943895)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1834, 234, 9, 298611764)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1835, 268, 9, 979024118)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1836, 302, 9, 983891922)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1837, 300, 9, 841602183)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1838, 295, 9, 474389086)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1839, 298, 9, 287156511)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1840, 219, 9, 697637940)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1841, 240, 9, 277144836)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1842, 215, 9, 700598965)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1843, 302, 9, 124530332)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1844, 283, 9, 521554514)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1845, 255, 9, 749007564)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1846, 295, 9, 301203598)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1847, 293, 9, 617866961)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1848, 287, 9, 815269638)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1849, 289, 9, 83616237)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1850, 259, 9, 420980780)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1851, 233, 9, 72563867)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1852, 282, 9, 89077293)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1853, 222, 9, 200853973)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1854, 208, 9, 19419218)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1855, 265, 9, 940778287)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1856, 258, 9, 990102317)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1857, 289, 9, 216223806)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1858, 251, 9, 713498489)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1859, 258, 9, 84341115)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1860, 302, 9, 158051016)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1861, 279, 9, 488516346)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1862, 275, 9, 389321531)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1863, 286, 9, 801997842)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1864, 207, 9, 271421922)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1865, 211, 9, 219094637)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1866, 281, 9, 484944234)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1867, 302, 9, 247592325)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1868, 212, 9, 303195776)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1869, 272, 9, 232226861)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1870, 250, 9, 285361515)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1871, 288, 9, 188276648)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1872, 268, 9, 581647667)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1873, 235, 9, 415187117)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1874, 211, 9, 780460817)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1875, 241, 9, 858826111)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1876, 249, 9, 219632517)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1877, 252, 9, 207069233)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1878, 239, 9, 2978684)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1879, 299, 9, 320079020)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1880, 284, 9, 122695151)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1881, 283, 9, 278287088)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1882, 237, 9, 617561115)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1883, 216, 9, 513458308)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1884, 267, 9, 865951577)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1885, 297, 9, 964513871)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1886, 212, 9, 271192453)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1887, 301, 9, 210360361)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1888, 255, 9, 479684522)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1889, 223, 9, 171454922)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1890, 232, 9, 777598139)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1891, 249, 9, 695960749)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1892, 209, 9, 261715312)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1893, 242, 9, 597347210)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1894, 216, 9, 931144186)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1895, 207, 9, 253300709)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1896, 219, 9, 690093933)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1897, 251, 9, 254189427)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1898, 298, 9, 594732384)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1899, 265, 9, 320510310)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1900, 247, 9, 738711089)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1901, 210, 9, 202868953)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1902, 255, 9, 760607831)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1903, 296, 9, 689605256)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1904, 280, 9, 798817585)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1905, 282, 9, 938659864)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1906, 296, 9, 638700823)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1907, 219, 9, 583561940)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1908, 235, 9, 449518277)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1909, 270, 9, 852034134)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1910, 253, 9, 44499175)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1911, 283, 9, 60198213)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1912, 283, 9, 925011049)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1913, 256, 9, 420173406)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1914, 227, 9, 67750255)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1915, 236, 9, 717118892)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1916, 276, 9, 328775188)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1917, 268, 9, 233285207)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1918, 226, 9, 22409456)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1919, 209, 9, 462258714)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1920, 251, 9, 432119252)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1921, 239, 9, 802794825)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1922, 296, 9, 483363691)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1923, 282, 9, 789623820)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1924, 287, 9, 182709666)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1925, 261, 9, 234752995)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1926, 245, 9, 483712900)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1927, 230, 9, 766303192)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1928, 234, 9, 231419720)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1929, 243, 9, 311114647)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1930, 254, 9, 423600995)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1931, 232, 9, 512247426)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1932, 251, 9, 531823831)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1933, 253, 9, 757865398)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1934, 248, 9, 103855346)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1935, 208, 9, 348413823)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1936, 221, 9, 359364339)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1937, 270, 9, 611376186)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1938, 210, 9, 974232511)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1939, 249, 9, 315934624)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1940, 249, 9, 488216791)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1941, 245, 9, 766253525)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1942, 228, 9, 673184242)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1943, 269, 9, 669067411)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1944, 243, 9, 64785644)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1945, 219, 9, 93955695)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1946, 287, 9, 212190131)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1947, 247, 9, 456190299)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1948, 300, 9, 71087430)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1949, 303, 9, 245387892)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1950, 261, 9, 811586308)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1951, 212, 9, 291621541)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1952, 233, 9, 985480063)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1953, 226, 9, 778633146)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1954, 290, 9, 917358077)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1955, 279, 9, 343622953)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1956, 217, 9, 420527842)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1957, 225, 9, 167180911)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1958, 268, 9, 637620059)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1959, 215, 9, 580409529)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1960, 213, 9, 320074031)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1961, 257, 9, 402794571)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1962, 228, 9, 810935189)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1963, 282, 9, 447624110)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1964, 217, 9, 285284957)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1965, 255, 9, 191634650)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1966, 212, 9, 198312063)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1967, 234, 9, 686384599)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1968, 228, 9, 862538878)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1969, 260, 9, 882778106)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1970, 283, 9, 295870862)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1971, 251, 9, 558150034)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1972, 231, 9, 868294463)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1973, 253, 9, 748384060)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1974, 224, 9, 934380952)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1975, 232, 9, 920884966)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1976, 261, 9, 134743152)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1977, 255, 9, 816554200)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1978, 215, 9, 217203559)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1979, 302, 9, 614519567)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1980, 215, 9, 422700273)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (1981, 251, 10, 260453509)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (2312, 292, 10, 131051974)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (2313, 244, 10, 47899803)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (2314, 274, 10, 460558960)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (2315, 232, 10, 779885405)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (2316, 231, 10, 43995536)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (2630, 267, 10, 850056602)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (2844, 258, 10, 990102317)
GO
INSERT [dbo].[ProductItem] ([Id], [Product_Id], [InventoryDateLocation_Id], [SerialNumber]) VALUES (2968, 215, 10, 422700273)
GO
SET IDENTITY_INSERT [dbo].[ProductItem] OFF
GO
/****** Object:  Index [UQ__Company__C2281033CA6534FB]    Script Date: 20.5.2021. 22:25:26 ******/
ALTER TABLE [dbo].[Company] ADD  CONSTRAINT [UQ__Company__C2281033CA6534FB] UNIQUE NONCLUSTERED 
(
	[CompanyPrefix] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Inventor__F5FDE6B23654FF0C]    Script Date: 20.5.2021. 22:25:26 ******/
ALTER TABLE [dbo].[Inventory] ADD UNIQUE NONCLUSTERED 
(
	[InventoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Inventor__C4422681C1203420]    Script Date: 20.5.2021. 22:25:26 ******/
ALTER TABLE [dbo].[InventoryDateLocation] ADD  CONSTRAINT [UQ__Inventor__C4422681C1203420] UNIQUE NONCLUSTERED 
(
	[Inventory_Id] ASC,
	[InventoryDate] ASC,
	[InventoryLocation_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Inventor__EC750B4FCED41B54]    Script Date: 20.5.2021. 22:25:26 ******/
ALTER TABLE [dbo].[InventoryLocation] ADD  CONSTRAINT [UQ__Inventor__EC750B4FCED41B54] UNIQUE NONCLUSTERED 
(
	[InventoryLocationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Product__12045DE22D81EEB1]    Script Date: 20.5.2021. 22:25:26 ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [UQ__Product__12045DE22D81EEB1] UNIQUE NONCLUSTERED 
(
	[Company_Id] ASC,
	[ItemReference] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__ProductI__6B86F9ABA142D6C8]    Script Date: 20.5.2021. 22:25:26 ******/
ALTER TABLE [dbo].[ProductItem] ADD  CONSTRAINT [UQ__ProductI__6B86F9ABA142D6C8] UNIQUE NONCLUSTERED 
(
	[Product_Id] ASC,
	[InventoryDateLocation_Id] ASC,
	[SerialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InventoryDateLocation]  WITH CHECK ADD  CONSTRAINT [FK_InventoryDateLocation_Inventory] FOREIGN KEY([Inventory_Id])
REFERENCES [dbo].[Inventory] ([Id])
GO
ALTER TABLE [dbo].[InventoryDateLocation] CHECK CONSTRAINT [FK_InventoryDateLocation_Inventory]
GO
ALTER TABLE [dbo].[InventoryDateLocation]  WITH CHECK ADD  CONSTRAINT [FK_InventoryDateLocation_InventoryLocation] FOREIGN KEY([InventoryLocation_Id])
REFERENCES [dbo].[InventoryLocation] ([Id])
GO
ALTER TABLE [dbo].[InventoryDateLocation] CHECK CONSTRAINT [FK_InventoryDateLocation_InventoryLocation]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Company] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Company]
GO
ALTER TABLE [dbo].[ProductItem]  WITH CHECK ADD  CONSTRAINT [FK_ProductItem_InventoryDateLocation] FOREIGN KEY([InventoryDateLocation_Id])
REFERENCES [dbo].[InventoryDateLocation] ([Id])
GO
ALTER TABLE [dbo].[ProductItem] CHECK CONSTRAINT [FK_ProductItem_InventoryDateLocation]
GO
ALTER TABLE [dbo].[ProductItem]  WITH CHECK ADD  CONSTRAINT [FK_ProductItem_Product] FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductItem] CHECK CONSTRAINT [FK_ProductItem_Product]
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteAllData]    Script Date: 20.5.2021. 22:25:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_DeleteAllData]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRAN 

    DELETE [dbo].[ProductItem]
    DELETE [dbo].[InventoryDateLocation]
    DELETE [dbo].[InventoryLocation]
	DELETE [dbo].[Product]
    DELETE [dbo].[Company]
    DELETE [dbo].[Inventory]

	COMMIT
END
GO
USE [master]
GO
ALTER DATABASE [MyCompany] SET  READ_WRITE 
GO
