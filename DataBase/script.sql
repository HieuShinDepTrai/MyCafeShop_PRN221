USE [master]
GO
/****** Object:  Database [QuanLyQuanCafe]    Script Date: 27-Mar-23 2:09:57 PM ******/
CREATE DATABASE [QuanLyQuanCafe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyQuanCafe', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\QuanLyQuanCafe.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyQuanCafe_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\QuanLyQuanCafe_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QuanLyQuanCafe] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyQuanCafe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyQuanCafe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyQuanCafe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyQuanCafe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLyQuanCafe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyQuanCafe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLyQuanCafe] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyQuanCafe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyQuanCafe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyQuanCafe] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyQuanCafe] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyQuanCafe] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLyQuanCafe', N'ON'
GO
ALTER DATABASE [QuanLyQuanCafe] SET QUERY_STORE = ON
GO
ALTER DATABASE [QuanLyQuanCafe] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QuanLyQuanCafe]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 27-Mar-23 2:09:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[UserName] [nvarchar](100) NOT NULL,
	[DisplayName] [nvarchar](100) NOT NULL,
	[PassWord] [nvarchar](1000) NOT NULL,
	[Type] [int] NOT NULL,
	[AccountId] [nchar](10) NOT NULL,
	[Avatar] [nvarchar](max) NULL,
	[Phone] [nchar](13) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 27-Mar-23 2:09:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[BillId] [char](10) NOT NULL,
	[DateCheckIn] [datetime] NOT NULL,
	[DateCheckOut] [datetime] NULL,
	[TableId] [char](3) NULL,
	[Status] [smallint] NOT NULL,
	[Discount] [tinyint] NOT NULL,
	[AccountId] [nchar](10) NULL,
	[Total] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[BillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillInfo]    Script Date: 27-Mar-23 2:09:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillInfo](
	[BillId] [char](10) NOT NULL,
	[FoodId] [char](5) NOT NULL,
	[Quantity] [smallint] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_BillInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 27-Mar-23 2:09:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [char](5) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Food]    Script Date: 27-Mar-23 2:09:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[FoodId] [char](5) NOT NULL,
	[FoodName] [nvarchar](100) NOT NULL,
	[CategoryId] [char](5) NOT NULL,
	[Price] [money] NOT NULL,
	[ImgPath] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[FoodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 27-Mar-23 2:09:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] NOT NULL,
	[Name] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TableFood]    Script Date: 27-Mar-23 2:09:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableFood](
	[TableId] [char](3) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Status] [bit] NOT NULL,
	[InUse] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[TableId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([UserName], [DisplayName], [PassWord], [Type], [AccountId], [Avatar], [Phone]) VALUES (N'admin', N'Duong', N'$2a$12$xlCfY3oPL46ky9hMmCWjHOv91XgWRWj0p0FGfP8Gwlw0husrNZFhy', 1, N'0000000001', N'saostar-j73cdymihyu8myso.jpg', N'0366880570   ')
INSERT [dbo].[Account] ([UserName], [DisplayName], [PassWord], [Type], [AccountId], [Avatar], [Phone]) VALUES (N'staff', N'Staff', N'$2a$12$xlCfY3oPL46ky9hMmCWjHOv91XgWRWj0p0FGfP8Gwlw0husrNZFhy', 0, N'0000000002', N'saostar-j67dox5fxucodxyz.jpg', N'03455664545  ')
GO
INSERT [dbo].[Bill] ([BillId], [DateCheckIn], [DateCheckOut], [TableId], [Status], [Discount], [AccountId], [Total]) VALUES (N'0000000000', CAST(N'2023-03-17T12:34:10.353' AS DateTime), CAST(N'2023-03-17T12:34:14.850' AS DateTime), N'1  ', 1, 0, N'0000000001', 20000.0000)
INSERT [dbo].[Bill] ([BillId], [DateCheckIn], [DateCheckOut], [TableId], [Status], [Discount], [AccountId], [Total]) VALUES (N'0000000001', CAST(N'2023-03-17T12:46:51.083' AS DateTime), NULL, N'0  ', 0, 0, N'0000000001', NULL)
INSERT [dbo].[Bill] ([BillId], [DateCheckIn], [DateCheckOut], [TableId], [Status], [Discount], [AccountId], [Total]) VALUES (N'0000000002', CAST(N'2023-03-17T20:02:50.160' AS DateTime), CAST(N'2023-03-17T20:02:56.657' AS DateTime), N'1  ', 1, 0, N'0000000001', 20000.0000)
INSERT [dbo].[Bill] ([BillId], [DateCheckIn], [DateCheckOut], [TableId], [Status], [Discount], [AccountId], [Total]) VALUES (N'0000000003', CAST(N'2023-03-17T20:03:07.310' AS DateTime), CAST(N'2023-03-17T20:04:20.243' AS DateTime), N'1  ', 1, 50, N'0000000001', 20000.0000)
INSERT [dbo].[Bill] ([BillId], [DateCheckIn], [DateCheckOut], [TableId], [Status], [Discount], [AccountId], [Total]) VALUES (N'0000000004', CAST(N'2023-03-19T23:23:55.757' AS DateTime), CAST(N'2023-03-19T23:24:03.357' AS DateTime), N'1  ', 1, 0, N'0000000002', 35000.0000)
INSERT [dbo].[Bill] ([BillId], [DateCheckIn], [DateCheckOut], [TableId], [Status], [Discount], [AccountId], [Total]) VALUES (N'0000000005', CAST(N'2023-03-20T14:40:48.493' AS DateTime), CAST(N'2023-03-20T14:42:46.653' AS DateTime), N'1  ', 1, 20, N'0000000002', 72000.0000)
INSERT [dbo].[Bill] ([BillId], [DateCheckIn], [DateCheckOut], [TableId], [Status], [Discount], [AccountId], [Total]) VALUES (N'0000000006', CAST(N'2023-03-20T14:43:34.233' AS DateTime), CAST(N'2023-03-27T13:50:41.733' AS DateTime), N'2  ', 1, 0, N'0000000002', 95000.0000)
GO
SET IDENTITY_INSERT [dbo].[BillInfo] ON 

INSERT [dbo].[BillInfo] ([BillId], [FoodId], [Quantity], [Id]) VALUES (N'0000000000', N'00019', 1, 112)
INSERT [dbo].[BillInfo] ([BillId], [FoodId], [Quantity], [Id]) VALUES (N'0000000000', N'00018', 1, 113)
INSERT [dbo].[BillInfo] ([BillId], [FoodId], [Quantity], [Id]) VALUES (N'0000000002', N'00018', 1, 115)
INSERT [dbo].[BillInfo] ([BillId], [FoodId], [Quantity], [Id]) VALUES (N'0000000002', N'00006', 1, 116)
INSERT [dbo].[BillInfo] ([BillId], [FoodId], [Quantity], [Id]) VALUES (N'0000000003', N'00006', 1, 117)
INSERT [dbo].[BillInfo] ([BillId], [FoodId], [Quantity], [Id]) VALUES (N'0000000003', N'00015', 1, 118)
INSERT [dbo].[BillInfo] ([BillId], [FoodId], [Quantity], [Id]) VALUES (N'0000000004', N'00020', 1, 119)
INSERT [dbo].[BillInfo] ([BillId], [FoodId], [Quantity], [Id]) VALUES (N'0000000004', N'00021', 1, 120)
INSERT [dbo].[BillInfo] ([BillId], [FoodId], [Quantity], [Id]) VALUES (N'0000000005', N'00012', 1, 123)
INSERT [dbo].[BillInfo] ([BillId], [FoodId], [Quantity], [Id]) VALUES (N'0000000005', N'00008', 6, 124)
INSERT [dbo].[BillInfo] ([BillId], [FoodId], [Quantity], [Id]) VALUES (N'0000000006', N'00009', 5, 125)
INSERT [dbo].[BillInfo] ([BillId], [FoodId], [Quantity], [Id]) VALUES (N'0000000006', N'00019', 1, 126)
INSERT [dbo].[BillInfo] ([BillId], [FoodId], [Quantity], [Id]) VALUES (N'0000000006', N'00020', 1, 127)
INSERT [dbo].[BillInfo] ([BillId], [FoodId], [Quantity], [Id]) VALUES (N'0000000006', N'00021', 1, 128)
SET IDENTITY_INSERT [dbo].[BillInfo] OFF
GO
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (N'1    ', N'Other Drinks')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (N'2    ', N'Bubble Tea')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (N'3    ', N'Fruit')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (N'4    ', N'Cafe')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (N'5    ', N'Snacks')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (N'6    ', N'Savory Dishes')
GO
INSERT [dbo].[Food] ([FoodId], [FoodName], [CategoryId], [Price], [ImgPath]) VALUES (N'00001', N'Classic Buble Tea', N'2    ', 30000.0000, N'Classic Buble Tea.jpg')
INSERT [dbo].[Food] ([FoodId], [FoodName], [CategoryId], [Price], [ImgPath]) VALUES (N'00002', N'Pomelo (5 Pieces)', N'3    ', 20000.0000, N'Pomelo (5 Pieces).jpg')
INSERT [dbo].[Food] ([FoodId], [FoodName], [CategoryId], [Price], [ImgPath]) VALUES (N'00003', N'Guava (5 Pieces)', N'3    ', 15000.0000, N'Guava (5 Pieces).jpg')
INSERT [dbo].[Food] ([FoodId], [FoodName], [CategoryId], [Price], [ImgPath]) VALUES (N'00004', N'Espressso', N'4    ', 10000.0000, N'Espressso.jpg')
INSERT [dbo].[Food] ([FoodId], [FoodName], [CategoryId], [Price], [ImgPath]) VALUES (N'00005', N'Macchiato', N'4    ', 10000.0000, N'Macchiato.jpg')
INSERT [dbo].[Food] ([FoodId], [FoodName], [CategoryId], [Price], [ImgPath]) VALUES (N'00006', N'Latte', N'4    ', 10000.0000, N'Latte.jpeg')
INSERT [dbo].[Food] ([FoodId], [FoodName], [CategoryId], [Price], [ImgPath]) VALUES (N'00007', N'Cappuccino', N'4    ', 10000.0000, N'Cappuccino.jpg')
INSERT [dbo].[Food] ([FoodId], [FoodName], [CategoryId], [Price], [ImgPath]) VALUES (N'00008', N'Spicy shredded chicken', N'5    ', 10000.0000, N'Spicy shredded chicken.jpg')
INSERT [dbo].[Food] ([FoodId], [FoodName], [CategoryId], [Price], [ImgPath]) VALUES (N'00009', N'Spicy shredded pork', N'5    ', 10000.0000, N'Spicy shredded pork.jpg')
INSERT [dbo].[Food] ([FoodId], [FoodName], [CategoryId], [Price], [ImgPath]) VALUES (N'00010', N'French Fries', N'5    ', 30000.0000, N'French Fries.jpg')
INSERT [dbo].[Food] ([FoodId], [FoodName], [CategoryId], [Price], [ImgPath]) VALUES (N'00011', N'Sweet Potato Fried', N'5    ', 30000.0000, N'Sweet Potato Fried.jpg')
INSERT [dbo].[Food] ([FoodId], [FoodName], [CategoryId], [Price], [ImgPath]) VALUES (N'00012', N'Brown Sugar Milk Tea', N'2    ', 30000.0000, N'Brown Sugar Milk Tea.png')
INSERT [dbo].[Food] ([FoodId], [FoodName], [CategoryId], [Price], [ImgPath]) VALUES (N'00013', N'Banh Mi Pate', N'6    ', 20000.0000, N'Banh Mi Pate.jpg')
INSERT [dbo].[Food] ([FoodId], [FoodName], [CategoryId], [Price], [ImgPath]) VALUES (N'00014', N'Banh Mi Ap Chao', N'6    ', 30000.0000, N'Banh Mi Ap Chao.jpg')
INSERT [dbo].[Food] ([FoodId], [FoodName], [CategoryId], [Price], [ImgPath]) VALUES (N'00015', N'Bun Tron', N'6    ', 30000.0000, N'Bun Tron.jpeg')
INSERT [dbo].[Food] ([FoodId], [FoodName], [CategoryId], [Price], [ImgPath]) VALUES (N'00016', N'Bun Dau Mam tom', N'6    ', 50000.0000, N'Bun Dau Mam tom.jpg')
INSERT [dbo].[Food] ([FoodId], [FoodName], [CategoryId], [Price], [ImgPath]) VALUES (N'00017', N'Cheese Foam Tea', N'2    ', 30000.0000, N'Cheese Foam Tea.jpg')
INSERT [dbo].[Food] ([FoodId], [FoodName], [CategoryId], [Price], [ImgPath]) VALUES (N'00018', N'Sting', N'1    ', 10000.0000, N'Sting.jpeg')
INSERT [dbo].[Food] ([FoodId], [FoodName], [CategoryId], [Price], [ImgPath]) VALUES (N'00019', N'7-Up', N'1    ', 10000.0000, N'7-Up.jpg')
INSERT [dbo].[Food] ([FoodId], [FoodName], [CategoryId], [Price], [ImgPath]) VALUES (N'00020', N'Beer Heineken', N'1    ', 23000.0000, N'Beer Heineken.jpg')
INSERT [dbo].[Food] ([FoodId], [FoodName], [CategoryId], [Price], [ImgPath]) VALUES (N'00021', N'Beer 333', N'1    ', 12000.0000, N'Beer 333.jpg')
INSERT [dbo].[Food] ([FoodId], [FoodName], [CategoryId], [Price], [ImgPath]) VALUES (N'00022', N'Orange Juice Twitster', N'1    ', 10000.0000, N'Orange Juice Twitster.jpeg')
INSERT [dbo].[Food] ([FoodId], [FoodName], [CategoryId], [Price], [ImgPath]) VALUES (N'00023', N'Melon (5 Pieces)', N'3    ', 20000.0000, N'Melon (5 Pieces).jpg')
INSERT [dbo].[Food] ([FoodId], [FoodName], [CategoryId], [Price], [ImgPath]) VALUES (N'00024', N'Sting vang', N'5    ', 20000.0000, N'Sting.jpeg')
GO
INSERT [dbo].[Role] ([Id], [Name]) VALUES (0, N'Staff     ')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Admin     ')
GO
INSERT [dbo].[TableFood] ([TableId], [Name], [Status], [InUse]) VALUES (N'0  ', N'Take Away', 0, 0)
INSERT [dbo].[TableFood] ([TableId], [Name], [Status], [InUse]) VALUES (N'1  ', N'Table1', 0, 1)
INSERT [dbo].[TableFood] ([TableId], [Name], [Status], [InUse]) VALUES (N'2  ', N'Table2', 0, 1)
INSERT [dbo].[TableFood] ([TableId], [Name], [Status], [InUse]) VALUES (N'3  ', N'Table3', 0, 1)
INSERT [dbo].[TableFood] ([TableId], [Name], [Status], [InUse]) VALUES (N'4  ', N'Table4', 0, 1)
INSERT [dbo].[TableFood] ([TableId], [Name], [Status], [InUse]) VALUES (N'5  ', N'Table5', 0, 1)
INSERT [dbo].[TableFood] ([TableId], [Name], [Status], [InUse]) VALUES (N'6  ', N'Table6', 0, 1)
INSERT [dbo].[TableFood] ([TableId], [Name], [Status], [InUse]) VALUES (N'7  ', N'Table7', 0, 1)
INSERT [dbo].[TableFood] ([TableId], [Name], [Status], [InUse]) VALUES (N'8  ', N'Table8', 0, 1)
INSERT [dbo].[TableFood] ([TableId], [Name], [Status], [InUse]) VALUES (N'9  ', N'Table9', 0, 1)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Account]    Script Date: 27-Mar-23 2:09:58 PM ******/
CREATE NONCLUSTERED INDEX [IX_Account] ON [dbo].[Account]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (N'New User') FOR [DisplayName]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((0)) FOR [PassWord]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[BillInfo] ADD  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[TableFood] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([Type])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_TableFood] FOREIGN KEY([TableId])
REFERENCES [dbo].[TableFood] ([TableId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_TableFood]
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD  CONSTRAINT [FK_BillInfo_Food] FOREIGN KEY([FoodId])
REFERENCES [dbo].[Food] ([FoodId])
GO
ALTER TABLE [dbo].[BillInfo] CHECK CONSTRAINT [FK_BillInfo_Food]
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD  CONSTRAINT [FK_Food_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Food] CHECK CONSTRAINT [FK_Food_Category]
GO
ALTER TABLE [dbo].[Role]  WITH CHECK ADD  CONSTRAINT [FK_Role_Role] FOREIGN KEY([Id])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[Role] CHECK CONSTRAINT [FK_Role_Role]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [CK_Bill_Date] CHECK  (([DateCheckIn]<=[DateCheckOut]))
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [CK_Bill_Date]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [CK_Bill_Discount] CHECK  (([Discount]>=(0) AND [Discount]<=(100)))
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [CK_Bill_Discount]
GO
USE [master]
GO
ALTER DATABASE [QuanLyQuanCafe] SET  READ_WRITE 
GO
