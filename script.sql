USE [master]
GO
/****** Object:  Database [Eatery]    Script Date: 4/1/2023 2:21:43 AM ******/
CREATE DATABASE [Eatery]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Eatery', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Eatery.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Eatery_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Eatery_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Eatery] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Eatery].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Eatery] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Eatery] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Eatery] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Eatery] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Eatery] SET ARITHABORT OFF 
GO
ALTER DATABASE [Eatery] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Eatery] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Eatery] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Eatery] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Eatery] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Eatery] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Eatery] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Eatery] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Eatery] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Eatery] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Eatery] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Eatery] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Eatery] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Eatery] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Eatery] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Eatery] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Eatery] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Eatery] SET RECOVERY FULL 
GO
ALTER DATABASE [Eatery] SET  MULTI_USER 
GO
ALTER DATABASE [Eatery] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Eatery] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Eatery] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Eatery] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Eatery] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Eatery] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Eatery', N'ON'
GO
ALTER DATABASE [Eatery] SET QUERY_STORE = OFF
GO
USE [Eatery]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 4/1/2023 2:21:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Last_Login] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/1/2023 2:21:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Published] [bit] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 4/1/2023 2:21:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](250) NOT NULL,
	[AccountID] [int] NOT NULL,
	[dob] [date] NOT NULL,
	[Address] [nvarchar](max) NULL,
	[avatar] [varchar](max) NULL,
	[Gmail] [varchar](200) NULL,
	[PhoneNumber] [varchar](20) NULL,
	[gender] [bit] NOT NULL,
	[LocationID] [int] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 4/1/2023 2:21:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MainMaterial]    Script Date: 4/1/2023 2:21:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MainMaterial](
	[Main_Material_ID] [int] IDENTITY(1,1) NOT NULL,
	[Main_Material_Name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_MainMaterial] PRIMARY KEY CLUSTERED 
(
	[Main_Material_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 4/1/2023 2:21:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Order_date] [datetime] NOT NULL,
	[Ship_date] [datetime] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[Deleted] [bit] NOT NULL,
	[Paid] [bit] NOT NULL,
	[Payment_date] [datetime] NULL,
	[PaymentID] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 4/1/2023 2:21:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [nchar](10) NOT NULL,
	[Quantity] [int] NULL,
	[Discount] [int] NULL,
	[Total] [int] NULL,
	[Ship_Date] [datetime] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orderdetail_Product]    Script Date: 4/1/2023 2:21:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orderdetail_Product](
	[OrderdetailID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
 CONSTRAINT [PK_Orderdetail_Product] PRIMARY KEY CLUSTERED 
(
	[OrderdetailID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 4/1/2023 2:21:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CategoryID] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[Discount] [int] NULL,
	[Thumb] [nvarchar](max) NULL,
	[Created_Date] [datetime] NULL,
	[Active] [bit] NOT NULL,
	[UnitInStock] [int] NOT NULL,
	[Main_Material_ID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 4/1/2023 2:21:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Published]  DEFAULT ((1)) FOR [Published]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Deleted]  DEFAULT ((1)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Paid]  DEFAULT ((0)) FOR [Paid]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Account]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Location] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Location] ([LocationID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Location]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[Orderdetail_Product]  WITH CHECK ADD  CONSTRAINT [FK_Orderdetail_Product_OrderDetail] FOREIGN KEY([OrderdetailID])
REFERENCES [dbo].[OrderDetail] ([OrderDetailID])
GO
ALTER TABLE [dbo].[Orderdetail_Product] CHECK CONSTRAINT [FK_Orderdetail_Product_OrderDetail]
GO
ALTER TABLE [dbo].[Orderdetail_Product]  WITH CHECK ADD  CONSTRAINT [FK_Orderdetail_Product_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Orderdetail_Product] CHECK CONSTRAINT [FK_Orderdetail_Product_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_MainMaterial] FOREIGN KEY([Main_Material_ID])
REFERENCES [dbo].[MainMaterial] ([Main_Material_ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_MainMaterial]
GO
USE [master]
GO
ALTER DATABASE [Eatery] SET  READ_WRITE 
GO
