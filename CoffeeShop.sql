USE [master]
GO
/****** Object:  Database [CoffeeShop]    Script Date: 1/3/2023 3:56:56 PM ******/
CREATE DATABASE [CoffeeShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AssignmentA20173', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AssignmentA20173.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AssignmentA20173_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AssignmentA20173_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CoffeeShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CoffeeShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CoffeeShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CoffeeShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CoffeeShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CoffeeShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CoffeeShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [CoffeeShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CoffeeShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CoffeeShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CoffeeShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CoffeeShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CoffeeShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CoffeeShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CoffeeShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CoffeeShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CoffeeShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CoffeeShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CoffeeShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CoffeeShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CoffeeShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CoffeeShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CoffeeShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CoffeeShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CoffeeShop] SET RECOVERY FULL 
GO
ALTER DATABASE [CoffeeShop] SET  MULTI_USER 
GO
ALTER DATABASE [CoffeeShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CoffeeShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CoffeeShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CoffeeShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CoffeeShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CoffeeShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CoffeeShop', N'ON'
GO
ALTER DATABASE [CoffeeShop] SET QUERY_STORE = OFF
GO
USE [CoffeeShop]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 1/3/2023 3:56:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Fullname] [nvarchar](255) NOT NULL,
	[Username] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Status] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 1/3/2023 3:56:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [bigint] IDENTITY(10000,1) NOT NULL,
	[CategoryName] [nvarchar](255) NOT NULL,
	[CategoryDescription] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 1/3/2023 3:56:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[ID] [bigint] IDENTITY(10000,1) NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[ProID] [bigint] NOT NULL,
	[PriceEach] [money] NOT NULL,
	[QuantityOrdered] [int] NOT NULL,
	[TotalPrice] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 1/3/2023 3:56:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [bigint] IDENTITY(10000,1) NOT NULL,
	[ID] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[PhoneShip] [nvarchar](255) NOT NULL,
	[AddressShip] [nvarchar](255) NOT NULL,
	[Note] [nvarchar](255) NOT NULL,
	[TotalAmount] [int] NOT NULL,
	[OrderStatus] [nvarchar](255) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 1/3/2023 3:56:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProID] [bigint] IDENTITY(10000,1) NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[SupID] [bigint] NOT NULL,
	[CategoryID] [bigint] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [int] NULL,
	[Image] [nvarchar](255) NULL,
	[StatusSale] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 1/3/2023 3:56:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupID] [bigint] IDENTITY(10000,1) NOT NULL,
	[SupplierName] [nvarchar](255) NOT NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[HomePage] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[SupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/3/2023 3:56:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Fullname] [nvarchar](255) NOT NULL,
	[Username] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Status] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([ID], [Fullname], [Username], [Password], [Email], [Phone], [Status]) VALUES (2, N'Le Hoang Tri Thanh ', N'thanhle', N'admin', N'thanhle2903@gmail.com', N'0387090621', NULL)
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (10007, N'G7 coffee', N'G7 coffee')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (10008, N'Qngon coffee', N'Qngon coffee')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (10009, N'Cau Dat', N'Cau Dat')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (10010, N'Phin Giay', N'Phin Giay')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (10011, N'Hight Land', N'Hight Land')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (10012, N'LoLa', N'LoLa')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (10014, N'SangTao', N'Sang Tao')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (10015, N'The Coffee House', N'The Coffee House')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [PriceEach], [QuantityOrdered], [TotalPrice]) VALUES (10002, 10007, 10020, 2.0000, 1, 2.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [PriceEach], [QuantityOrdered], [TotalPrice]) VALUES (10008, 10010, 10019, 100.0000, 1, 100.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [PriceEach], [QuantityOrdered], [TotalPrice]) VALUES (10010, 10011, 10019, 100.0000, 1, 100.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [PriceEach], [QuantityOrdered], [TotalPrice]) VALUES (10012, 10012, 10019, 100.0000, 1, 100.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [PriceEach], [QuantityOrdered], [TotalPrice]) VALUES (10014, 10014, 10019, 100.0000, 1, 100.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [PriceEach], [QuantityOrdered], [TotalPrice]) VALUES (10016, 10015, 10020, 2.0000, 1, 2.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [PriceEach], [QuantityOrdered], [TotalPrice]) VALUES (10017, 10015, 10012, 3.0000, 1, 3.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [PriceEach], [QuantityOrdered], [TotalPrice]) VALUES (10018, 10016, 10019, 100.0000, 1, 100.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [PriceEach], [QuantityOrdered], [TotalPrice]) VALUES (10019, 10017, 10017, 10.0000, 2, 20.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [PriceEach], [QuantityOrdered], [TotalPrice]) VALUES (10021, 10018, 10020, 2.0000, 1, 2.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [PriceEach], [QuantityOrdered], [TotalPrice]) VALUES (10022, 10018, 10012, 3.0000, 3, 9.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [PriceEach], [QuantityOrdered], [TotalPrice]) VALUES (10023, 10019, 10020, 2.0000, 1, 2.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [PriceEach], [QuantityOrdered], [TotalPrice]) VALUES (10026, 10021, 10013, 3.0000, 1, 3.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [PriceEach], [QuantityOrdered], [TotalPrice]) VALUES (10027, 10022, 10013, 3.0000, 1, 3.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [PriceEach], [QuantityOrdered], [TotalPrice]) VALUES (10028, 10023, 10013, 3.0000, 1, 3.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [PriceEach], [QuantityOrdered], [TotalPrice]) VALUES (10029, 10024, 10014, 3.0000, 1, 3.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [PriceEach], [QuantityOrdered], [TotalPrice]) VALUES (10030, 10025, 10020, 2.0000, 1, 2.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [PriceEach], [QuantityOrdered], [TotalPrice]) VALUES (10032, 10026, 10016, 10.0000, 2, 20.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [PriceEach], [QuantityOrdered], [TotalPrice]) VALUES (10034, 10027, 10012, 2.0000, 2, 4.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [PriceEach], [QuantityOrdered], [TotalPrice]) VALUES (10035, 10028, 10012, 2.0000, 1, 2.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [PriceEach], [QuantityOrdered], [TotalPrice]) VALUES (10036, 10028, 10013, 3.0000, 1, 3.0000)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [ID], [OrderDate], [PhoneShip], [AddressShip], [Note], [TotalAmount], [OrderStatus]) VALUES (10027, 15, CAST(N'2023-01-02' AS Date), N'0917292729', N'can tho', N'all so so', 1, N'1')
INSERT [dbo].[Orders] ([OrderID], [ID], [OrderDate], [PhoneShip], [AddressShip], [Note], [TotalAmount], [OrderStatus]) VALUES (10028, 15, CAST(N'2023-01-03' AS Date), N'0917292729', N'can tho', N'sadsad', 2, N'1')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProID], [ProductName], [SupID], [CategoryID], [UnitPrice], [Quantity], [Image], [StatusSale]) VALUES (10012, N'Caffee G7', 10003, 10007, 2.0000, 50, N'uploads\G7.jpg', NULL)
INSERT [dbo].[Products] ([ProID], [ProductName], [SupID], [CategoryID], [UnitPrice], [Quantity], [Image], [StatusSale]) VALUES (10013, N'Caffee QNgon', 10003, 10007, 3.0000, 500, N'uploads\Qngon.jpg', NULL)
INSERT [dbo].[Products] ([ProID], [ProductName], [SupID], [CategoryID], [UnitPrice], [Quantity], [Image], [StatusSale]) VALUES (10014, N'Caffee Hight Land', 10003, 10007, 3.0000, 50, N'uploads\hightland.jpg', NULL)
INSERT [dbo].[Products] ([ProID], [ProductName], [SupID], [CategoryID], [UnitPrice], [Quantity], [Image], [StatusSale]) VALUES (10015, N'Caffee ilola', 10003, 10012, 10.0000, 40, N'uploads\liola.jpg', NULL)
INSERT [dbo].[Products] ([ProID], [ProductName], [SupID], [CategoryID], [UnitPrice], [Quantity], [Image], [StatusSale]) VALUES (10016, N'Caffee Sang Tao', 10003, 10014, 10.0000, 40, N'uploads\sangtao.jpg', NULL)
INSERT [dbo].[Products] ([ProID], [ProductName], [SupID], [CategoryID], [UnitPrice], [Quantity], [Image], [StatusSale]) VALUES (10017, N'Caffee Coffee House', 10003, 10015, 3.0000, 40, N'uploads\thecoffeehouse.jpg', NULL)
INSERT [dbo].[Products] ([ProID], [ProductName], [SupID], [CategoryID], [UnitPrice], [Quantity], [Image], [StatusSale]) VALUES (10019, N'Caffee Cầu Đất', 10003, 10007, 100.0000, 40, N'uploads\coffeeCauDat.png', NULL)
INSERT [dbo].[Products] ([ProID], [ProductName], [SupID], [CategoryID], [UnitPrice], [Quantity], [Image], [StatusSale]) VALUES (10020, N'Caffee Phin Giấy', 10003, 10007, 2.0000, 40, N'uploads\coffeePhinGiay.jpg', NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupID], [SupplierName], [Address], [Phone], [HomePage]) VALUES (10003, N'Coffee Global', N'79 Hung Vuong, P. Thoi Binh, Q. Ninh Kieu,TP. Can Tho', N'0917292729', N'CoffeeGlobal.vn')
INSERT [dbo].[Suppliers] ([SupID], [SupplierName], [Address], [Phone], [HomePage]) VALUES (10007, N'Cau Dat', N'99 Cau Dat, TP. Da Lat, Tinh Lam Dong', N'0917292729', N'CauDat.vn')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [Fullname], [Username], [Password], [Email], [Phone], [Status]) VALUES (15, N'le tri thanh', N'thanhle', N'user', N'hl.trithanh@gmail.com', N'0917292729', NULL)
INSERT [dbo].[Users] ([ID], [Fullname], [Username], [Password], [Email], [Phone], [Status]) VALUES (16, N'le thanh nhan', N'lethanh', N'123456', N'hunglam.trithanh@gmail.com', N'0917292729', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
USE [master]
GO
ALTER DATABASE [CoffeeShop] SET  READ_WRITE 
GO
