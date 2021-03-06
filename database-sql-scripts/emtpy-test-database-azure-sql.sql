/*
If using Sql Server Management Studio to create Azure SQL database:
- create database "ProductInventoryApi_db"
- switch connection from "master" to "ProductInventoryApi_db"
- run script
*/
CREATE TABLE [dbo].[ProductItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Product_Id] [int] NOT NULL,
	[InventoryDateLocation_Id] [int] NOT NULL,
	[SerialNumber] [bigint] NOT NULL,
 CONSTRAINT [PK__ProductI__3214EC075FB518F7] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__ProductI__6B86F9ABA142D6C8] UNIQUE NONCLUSTERED 
(
	[Product_Id] ASC,
	[InventoryDateLocation_Id] ASC,
	[SerialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 21.5.2021. 20:11:09 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[InventoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 21.5.2021. 20:11:09 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__Product__12045DE22D81EEB1] UNIQUE NONCLUSTERED 
(
	[Company_Id] ASC,
	[ItemReference] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryDateLocation]    Script Date: 21.5.2021. 20:11:09 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__Inventor__C4422681C1203420] UNIQUE NONCLUSTERED 
(
	[Inventory_Id] ASC,
	[InventoryDate] ASC,
	[InventoryLocation_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_CountOfInventoriedItemsGroupedBySpecificProductForSpecificInventory]    Script Date: 21.5.2021. 20:11:09 ******/
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
/****** Object:  View [dbo].[v_CountOfInventoriedItemsGroupedBySpecificProductPerDay]    Script Date: 21.5.2021. 20:11:09 ******/
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
/****** Object:  Table [dbo].[Company]    Script Date: 21.5.2021. 20:11:09 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__Company__C2281033CA6534FB] UNIQUE NONCLUSTERED 
(
	[CompanyPrefix] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_CountOfInventoriedItemsGroupedBySpecificCompany]    Script Date: 21.5.2021. 20:11:09 ******/
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
/****** Object:  Table [dbo].[InventoryLocation]    Script Date: 21.5.2021. 20:11:09 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__Inventor__EC750B4FCED41B54] UNIQUE NONCLUSTERED 
(
	[InventoryLocationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
/****** Object:  StoredProcedure [dbo].[usp_DeleteAllData]    Script Date: 21.5.2021. 20:11:09 ******/
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
