USE [master]
GO
/****** Object:  Database [EventManagement]    Script Date: 12-09-2018 11:37:08 AM ******/
CREATE DATABASE [EventManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EventManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EventManagement.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EventManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EventManagement_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EventManagement] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EventManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EventManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EventManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EventManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EventManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EventManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [EventManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EventManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EventManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EventManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EventManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EventManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EventManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EventManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EventManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EventManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EventManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EventManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EventManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EventManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EventManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EventManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EventManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EventManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [EventManagement] SET  MULTI_USER 
GO
ALTER DATABASE [EventManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EventManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EventManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EventManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EventManagement] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EventManagement', N'ON'
GO
USE [EventManagement]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 12-09-2018 11:37:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[Id] [varchar](50) NULL,
	[Password] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CollegeDetails]    Script Date: 12-09-2018 11:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CollegeDetails](
	[Id] [varchar](50) NULL,
	[Name] [varchar](500) NULL,
	[Email] [varchar](50) NULL,
	[Contact] [varchar](50) NULL,
	[Address] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EventDetails]    Script Date: 12-09-2018 11:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EventDetails](
	[Id] [varchar](50) NULL,
	[Name] [varchar](500) NULL,
	[Date] [varchar](50) NULL,
	[College] [varchar](500) NULL,
	[Type] [varchar](50) NULL,
	[Teacher] [varchar](50) NULL,
	[Fees] [varchar](50) NULL,
	[Winner] [varchar](50) NULL,
	[Tid] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EventReg]    Script Date: 12-09-2018 11:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EventReg](
	[EId] [varchar](50) NULL,
	[EventName] [varchar](200) NULL,
	[Sid] [varchar](50) NULL,
	[StudName] [varchar](200) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentDetails]    Script Date: 12-09-2018 11:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentDetails](
	[Id] [varchar](50) NULL,
	[Name] [varchar](500) NULL,
	[Email] [varchar](50) NULL,
	[Contact] [varchar](50) NULL,
	[Age] [varchar](50) NULL,
	[CollegeName] [varchar](500) NULL,
	[Password] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TeacherDetails]    Script Date: 12-09-2018 11:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TeacherDetails](
	[Id] [varchar](50) NULL,
	[Name] [varchar](500) NULL,
	[Email] [varchar](50) NULL,
	[Contact] [varchar](50) NULL,
	[College] [varchar](50) NULL,
	[Password] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Admin] ([Id], [Password]) VALUES (N'admin', N'admin')
INSERT [dbo].[CollegeDetails] ([Id], [Name], [Email], [Contact], [Address]) VALUES (N'101', N'ABC Jr, College', N'abc@gmail.com', N'9876543210', N'Bandra East, Mumbai')
INSERT [dbo].[CollegeDetails] ([Id], [Name], [Email], [Contact], [Address]) VALUES (N'102', N'XYZ Engineering College', N'xyz@gmail.com', N'022287654321', N'Andheri West, Mumbai
')
INSERT [dbo].[EventDetails] ([Id], [Name], [Date], [College], [Type], [Teacher], [Fees], [Winner], [Tid]) VALUES (N'101', N'Chess', N'2018-09-20', N'ABC Jr, College', N'Indoor', N'Rovel Pinto', N'100', N'', N'101')
INSERT [dbo].[StudentDetails] ([Id], [Name], [Email], [Contact], [Age], [CollegeName], [Password]) VALUES (N'101', N'Test Name', N'test@gmail.com', N'9876543210', N'25', N'Hiray College', N'1234')
INSERT [dbo].[StudentDetails] ([Id], [Name], [Email], [Contact], [Age], [CollegeName], [Password]) VALUES (N'102', N'Student 2', N'test2@gmail.com', N'9876543211', N'26', N'Thakkur College', N'1234')
INSERT [dbo].[TeacherDetails] ([Id], [Name], [Email], [Contact], [College], [Password]) VALUES (N'101', N'Rovel Pinto', N'rovel@gmail.com', N'9876543211', N'ABC Jr, College', N'9876543211')
INSERT [dbo].[TeacherDetails] ([Id], [Name], [Email], [Contact], [College], [Password]) VALUES (N'102', N'Anubhuti Shah', N'anu@gmail.com', N'9876543212', N'XYZ Engineering College', N'9876543212')
USE [master]
GO
ALTER DATABASE [EventManagement] SET  READ_WRITE 
GO
