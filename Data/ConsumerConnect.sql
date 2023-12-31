USE [master]
GO
/****** Object:  Database [ConsumerConnect]    Script Date: 28-08-2018 08:03:02 PM ******/
CREATE DATABASE [ConsumerConnect]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ConsumerConnect', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ConsumerConnect.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ConsumerConnect_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ConsumerConnect_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ConsumerConnect] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ConsumerConnect].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ConsumerConnect] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ConsumerConnect] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ConsumerConnect] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ConsumerConnect] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ConsumerConnect] SET ARITHABORT OFF 
GO
ALTER DATABASE [ConsumerConnect] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ConsumerConnect] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ConsumerConnect] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ConsumerConnect] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ConsumerConnect] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ConsumerConnect] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ConsumerConnect] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ConsumerConnect] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ConsumerConnect] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ConsumerConnect] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ConsumerConnect] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ConsumerConnect] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ConsumerConnect] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ConsumerConnect] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ConsumerConnect] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ConsumerConnect] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ConsumerConnect] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ConsumerConnect] SET RECOVERY FULL 
GO
ALTER DATABASE [ConsumerConnect] SET  MULTI_USER 
GO
ALTER DATABASE [ConsumerConnect] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ConsumerConnect] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ConsumerConnect] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ConsumerConnect] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ConsumerConnect] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ConsumerConnect', N'ON'
GO
USE [ConsumerConnect]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 28-08-2018 08:03:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[admin](
	[id] [varchar](50) NULL,
	[pass] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 28-08-2018 08:03:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cart](
	[PID] [varchar](50) NULL,
	[ProductName] [varchar](50) NULL,
	[Qty] [varchar](50) NULL,
	[Cost] [varchar](50) NULL,
	[TotCost] [varchar](50) NULL,
	[UID] [varchar](50) NULL,
	[Status] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 28-08-2018 08:03:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Cid] [varchar](50) NULL,
	[Category] [varchar](100) NULL,
	[SubCategory] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 28-08-2018 08:03:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FeedBack](
	[FID] [varchar](80) NULL,
	[Username] [varchar](200) NULL,
	[Message] [varchar](max) NULL,
	[Date] [varchar](max) NULL,
	[Time] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Hits]    Script Date: 28-08-2018 08:03:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hits](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Category] [varchar](50) NULL,
	[SubCategory] [varchar](50) NULL,
	[ProductID] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
	[Uid] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 28-08-2018 08:03:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[OID] [varchar](50) NULL,
	[ProductName] [varchar](max) NULL,
	[PID] [varchar](80) NULL,
	[Qty] [varchar](80) NULL,
	[Cost] [varchar](80) NULL,
	[UID] [varchar](80) NULL,
	[Date] [varchar](max) NULL,
	[Time] [varchar](max) NULL,
	[Status] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 28-08-2018 08:03:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Payment](
	[Name] [varchar](50) NULL,
	[Cno] [varchar](50) NULL,
	[Cvv] [varchar](50) NULL,
	[Exp] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 28-08-2018 08:03:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[Pid] [varchar](80) NULL,
	[ProductName] [varchar](max) NULL,
	[Cost] [varchar](80) NULL,
	[Category] [varchar](100) NULL,
	[SubCategory] [varchar](100) NULL,
	[Description] [varchar](max) NULL,
	[Stock] [varchar](80) NULL,
	[Image] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QA]    Script Date: 28-08-2018 08:03:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QA](
	[ID] [varchar](80) NULL,
	[Question] [varchar](max) NULL,
	[Answers] [varchar](max) NULL,
	[UID] [varchar](80) NULL,
	[RID] [varchar](80) NULL,
	[Date] [varchar](max) NULL,
	[Time] [varchar](max) NULL,
	[Pid] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Retailer]    Script Date: 28-08-2018 08:03:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Retailer](
	[RID] [varchar](50) NULL,
	[RetailerName] [varchar](100) NULL,
	[OwnerName] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Contact] [varchar](50) NULL,
	[Address] [varchar](max) NULL,
	[Password] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 28-08-2018 08:03:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[Uid] [varchar](50) NULL,
	[Username] [varchar](max) NULL,
	[Email] [varchar](100) NULL,
	[Contact] [varchar](100) NULL,
	[Address] [varchar](max) NULL,
	[Gender] [varchar](50) NULL,
	[Age] [varchar](50) NULL,
	[Password] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[admin] ([id], [pass]) VALUES (N'admin', N'admin')
INSERT [dbo].[Category] ([Cid], [Category], [SubCategory]) VALUES (N'1', N'Electronics', N'TV')
INSERT [dbo].[Category] ([Cid], [Category], [SubCategory]) VALUES (N'2', N'Electronics', N'Mobile')
INSERT [dbo].[Category] ([Cid], [Category], [SubCategory]) VALUES (N'3', N'Electronics', N'PC & Laptops')
INSERT [dbo].[Category] ([Cid], [Category], [SubCategory]) VALUES (N'4', N'Electronics', N'Camera')
INSERT [dbo].[Category] ([Cid], [Category], [SubCategory]) VALUES (N'5', N'Furniture', N'Wardrobe')
INSERT [dbo].[FeedBack] ([FID], [Username], [Message], [Date], [Time]) VALUES (N'1001', N'Test', N'nice', N'2018/08/24', N'13:39')
SET IDENTITY_INSERT [dbo].[Hits] ON 

INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (143, N'Electronics', NULL, NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (144, N'Electronics', N'Mobile', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (145, N'Electronics', N'Mobile', N'4', N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (146, N'Electronics', N'Mobile', N'4', N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (147, N'Electronics', N'Mobile', N'4', N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (148, N'Electronics', N'Mobile', N'4', N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (149, N'Electronics', NULL, NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (150, N'Electronics', N'Mobile', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (151, N'Electronics', N'Mobile', N'3', N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (152, N'Electronics', N'Mobile', N'3', N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (153, N'Electronics', NULL, NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (154, N'Electronics', N'Mobile', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (155, N'Electronics', N'Mobile', N'3', N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (156, N'Electronics', N'Mobile', N'3', N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (157, N'Electronics', NULL, NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (158, N'Electronics', NULL, NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (159, N'Electronics', N'Camera', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (160, N'Electronics', N'Mobile', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (161, N'Electronics', N'Camera', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (162, N'Electronics', N'Camera', N'6', N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (163, N'Electronics', N'Camera', N'6', N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (170, N'Electronics', NULL, NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (171, N'Electronics', N'Mobile', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (172, N'Electronics', NULL, NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (173, N'Electronics', N'Camera', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (174, N'Electronics', NULL, NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (175, N'Electronics', N'PC ', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (184, N'Electronics', NULL, NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (185, N'Electronics', N'Mobile', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (186, N'Electronics', N'Mobile', N'4', N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (187, N'Electronics', N'Mobile', N'4', N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (188, N'', NULL, NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (189, N'Electronics', NULL, NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (190, N'Electronics', N'Camera', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (106, N'Electronics', NULL, NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (107, N'Electronics', N'Mobile', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (108, N'Electronics', N'Mobile', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (109, N'Electronics', N'Mobile', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (110, N'Electronics', N'Mobile', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (111, N'Electronics', N'Mobile', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (112, N'Electronics', N'Mobile', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (113, N'Electronics', N'Mobile', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (114, N'Electronics', N'Mobile', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (115, N'Electronics', N'Mobile', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (116, N'Electronics', N'Mobile', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (117, N'Electronics', N'Mobile', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (118, N'Electronics', N'Mobile', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (119, N'Electronics', N'Mobile', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (120, N'Electronics', N'Mobile', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (121, N'Electronics', N'Mobile', N'2', N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (122, N'', NULL, NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (123, N'Electronics', NULL, NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (124, N'Electronics', N'Mobile', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (125, N'Electronics', N'Mobile', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (126, N'Electronics', N'Mobile', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (127, N'Electronics', N'Mobile', N'5', N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (128, N'Electronics', NULL, NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (129, N'Electronics', N'PC ', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (130, N'Electronics', N'PC ', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (131, N'Electronics', N'PC ', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (132, N'Electronics', N'PC ', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (133, N'Electronics', N'PC ', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (134, N'Electronics', N'PC ', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (135, N'Electronics', NULL, NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (136, N'Electronics', N'Mobile', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (137, N'Electronics', N'Mobile', N'5', N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (138, N'Electronics', N'Mobile', N'5', N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (139, N'Electronics', NULL, NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (140, N'Electronics', N'Mobile', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (141, N'Electronics', N'Mobile', N'4', N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (142, N'Electronics', N'Mobile', N'4', N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (164, N'Electronics', NULL, NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (165, N'Electronics', N'Mobile', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (166, N'Electronics', NULL, NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (167, N'Electronics', N'Camera', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (168, N'Electronics', N'Camera', N'6', N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (169, N'Electronics', N'Camera', N'6', N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (176, N'Electronics', NULL, NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (177, N'Electronics', N'Mobile', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (178, N'Electronics', N'Mobile', N'4', N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (179, N'Electronics', N'Mobile', N'4', N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (180, N'Electronics', N'Mobile', N'4', N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (181, N'Electronics', N'Mobile', NULL, N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (182, N'Electronics', N'Mobile', N'3', N'2018-08-28', N'101')
INSERT [dbo].[Hits] ([Id], [Category], [SubCategory], [ProductID], [Date], [Uid]) VALUES (183, N'Electronics', N'Mobile', N'3', N'2018-08-28', N'101')
SET IDENTITY_INSERT [dbo].[Hits] OFF
INSERT [dbo].[Orders] ([OID], [ProductName], [PID], [Qty], [Cost], [UID], [Date], [Time], [Status]) VALUES (N'1', N'Canon EOS 750D', N'6', N'1', N'69999', N'101', N'2018-08-28', N'18:05', N'Payment Success')
INSERT [dbo].[Orders] ([OID], [ProductName], [PID], [Qty], [Cost], [UID], [Date], [Time], [Status]) VALUES (N'2', N'One Plus 6', N'4', N'1', N'66998', N'101', N'2018-08-28', N'18:50', N'Payment Success')
INSERT [dbo].[Orders] ([OID], [ProductName], [PID], [Qty], [Cost], [UID], [Date], [Time], [Status]) VALUES (N'2', N'Apple iPhone 6', N'3', N'1', N'66998', N'101', N'2018-08-28', N'18:50', N'Payment Success')
INSERT [dbo].[Orders] ([OID], [ProductName], [PID], [Qty], [Cost], [UID], [Date], [Time], [Status]) VALUES (N'3', N'One Plus 6', N'4', N'1', N'35999', N'101', N'2018-08-28', N'19:54', N'Payment Success')
INSERT [dbo].[Payment] ([Name], [Cno], [Cvv], [Exp]) VALUES (N'TestName', N'9876543210987876', N'123', N'2018-11-08')
INSERT [dbo].[Payment] ([Name], [Cno], [Cvv], [Exp]) VALUES (N'TestName', N'9876543210987876', N'123', N'2018-10-20')
INSERT [dbo].[Payment] ([Name], [Cno], [Cvv], [Exp]) VALUES (N'TestName', N'9876543210987876', N'123', N'2018-09-20')
INSERT [dbo].[Payment] ([Name], [Cno], [Cvv], [Exp]) VALUES (N'TestName', N'9876543210987876', N'123', N'2018-08-31')
INSERT [dbo].[Payment] ([Name], [Cno], [Cvv], [Exp]) VALUES (N'TestName', N'9876543210987876', N'123', N'2018-08-31')
INSERT [dbo].[Payment] ([Name], [Cno], [Cvv], [Exp]) VALUES (N'TestName', N'9876543210987876', N'123', N'2018-08-31')
INSERT [dbo].[Payment] ([Name], [Cno], [Cvv], [Exp]) VALUES (N'TestName', N'9876543210987876', N'123', N'2018-08-31')
INSERT [dbo].[Payment] ([Name], [Cno], [Cvv], [Exp]) VALUES (N'TestName', N'9876543210987876', N'123', N'2018-08-31')
INSERT [dbo].[Product] ([Pid], [ProductName], [Cost], [Category], [SubCategory], [Description], [Stock], [Image]) VALUES (N'4', N'One Plus 6', N'35999', N'Electronics', N'Mobile', N'Speed you Need.', N'100', N'images\Products\One-PLus.png')
INSERT [dbo].[Product] ([Pid], [ProductName], [Cost], [Category], [SubCategory], [Description], [Stock], [Image]) VALUES (N'2', N'One Plus 5', N'30999', N'Electronics', N'Mobile', N'Description OP5', N'1000', N'images\Products\image.jpg')
INSERT [dbo].[Product] ([Pid], [ProductName], [Cost], [Category], [SubCategory], [Description], [Stock], [Image]) VALUES (N'3', N'Apple iPhone 6', N'30999', N'Electronics', N'Mobile', N'Apple iPhone 6 Description', N'100', N'images\Products\Apple Iphone 6 Gold.png')
INSERT [dbo].[Product] ([Pid], [ProductName], [Cost], [Category], [SubCategory], [Description], [Stock], [Image]) VALUES (N'5', N'Sony Xperia X', N'19999', N'Electronics', N'Mobile', N'Desc', N'100', N'images\Products\Xperia  X.jpg')
INSERT [dbo].[Product] ([Pid], [ProductName], [Cost], [Category], [SubCategory], [Description], [Stock], [Image]) VALUES (N'6', N'Canon EOS 750D', N'69999', N'Electronics', N'Camera', N'Description', N'100', N'images\Products\Canon EOS 750D.jpeg')
INSERT [dbo].[QA] ([ID], [Question], [Answers], [UID], [RID], [Date], [Time], [Pid]) VALUES (N'1', N'hi', N'hello', N'1001', N'1001', N'12-12-2017', N'12:43', NULL)
INSERT [dbo].[QA] ([ID], [Question], [Answers], [UID], [RID], [Date], [Time], [Pid]) VALUES (N'2', N'hi1', N'hello2', N'1001', N'1001', N'12-12-2017', N'12:43', NULL)
INSERT [dbo].[QA] ([ID], [Question], [Answers], [UID], [RID], [Date], [Time], [Pid]) VALUES (N'3', N'does it have headphone jack?', N'No..', N'101', N'101', N'2018-08-28', N'12:52', N'3')
INSERT [dbo].[QA] ([ID], [Question], [Answers], [UID], [RID], [Date], [Time], [Pid]) VALUES (N'4', N'do we have fingerprint scanner on home button?', N'Yes, it has', N'101', N'101', N'2018-08-28', N'12:54', N'3')
INSERT [dbo].[QA] ([ID], [Question], [Answers], [UID], [RID], [Date], [Time], [Pid]) VALUES (N'5', N'Expandable slot?', N'Yes', N'101', N'', N'2018-08-28', N'13:05', N'3')
INSERT [dbo].[Retailer] ([RID], [RetailerName], [OwnerName], [Email], [Contact], [Address], [Password]) VALUES (N'101', N'Retailer 1', N'Owner 1', N'retailer@gmail.com', N'9876543210', N'Address', N'1234')
INSERT [dbo].[User] ([Uid], [Username], [Email], [Contact], [Address], [Gender], [Age], [Password]) VALUES (N'101', N'test1', N'test@gmail.com', N'9967019460', N'mumbai', N'Male', N'24', N'1234')
USE [master]
GO
ALTER DATABASE [ConsumerConnect] SET  READ_WRITE 
GO
