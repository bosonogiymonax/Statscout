USE [transferMarket]
GO
/****** Object:  Table [dbo].[Players]    Script Date: 18.10.2020 23:59:04 ******/
DROP TABLE [dbo].[Players]
GO
USE [master]
GO
/****** Object:  Database [transferMarket]    Script Date: 18.10.2020 23:59:04 ******/
DROP DATABASE [transferMarket]
GO
/****** Object:  Database [transferMarket]    Script Date: 18.10.2020 23:59:04 ******/
CREATE DATABASE [transferMarket]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'transferMarket', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\transferMarket.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'transferMarket_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\transferMarket_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [transferMarket] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [transferMarket].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [transferMarket] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [transferMarket] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [transferMarket] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [transferMarket] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [transferMarket] SET ARITHABORT OFF 
GO
ALTER DATABASE [transferMarket] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [transferMarket] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [transferMarket] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [transferMarket] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [transferMarket] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [transferMarket] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [transferMarket] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [transferMarket] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [transferMarket] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [transferMarket] SET  DISABLE_BROKER 
GO
ALTER DATABASE [transferMarket] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [transferMarket] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [transferMarket] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [transferMarket] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [transferMarket] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [transferMarket] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [transferMarket] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [transferMarket] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [transferMarket] SET  MULTI_USER 
GO
ALTER DATABASE [transferMarket] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [transferMarket] SET DB_CHAINING OFF 
GO
ALTER DATABASE [transferMarket] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [transferMarket] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [transferMarket] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [transferMarket] SET QUERY_STORE = OFF
GO
USE [transferMarket]
GO
/****** Object:  Table [dbo].[Players]    Script Date: 18.10.2020 23:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Players](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Position] [nchar](10) NULL,
	[Age] [int] NULL,
	[MarketValue] [money] NULL,
	[Nation] [nvarchar](50) NULL,
	[Club] [nvarchar](50) NULL,
	[Salary] [money] NULL,
 CONSTRAINT [PK_Players] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Players] ON 

INSERT [dbo].[Players] ([ID], [Name], [Position], [Age], [MarketValue], [Nation], [Club], [Salary]) VALUES (1, N'Lionel Messi', N'RW        ', 33, 100.0000, N'Argentina', N'Barcelona', 50.0000)
INSERT [dbo].[Players] ([ID], [Name], [Position], [Age], [MarketValue], [Nation], [Club], [Salary]) VALUES (2, N'Cristiano Ronaldo', N'ST        ', 35, 70.0000, N'Portugal', N'Juventus', 40.0000)
INSERT [dbo].[Players] ([ID], [Name], [Position], [Age], [MarketValue], [Nation], [Club], [Salary]) VALUES (3, N'Anton Zabolotnyi', N'ST        ', 29, 5.0000, N'Russia', N'Sochi', 1.0000)
INSERT [dbo].[Players] ([ID], [Name], [Position], [Age], [MarketValue], [Nation], [Club], [Salary]) VALUES (4, N'Raheem Sterling', N'RW        ', 25, 120.0000, N'England', N'Manchester City', 10.0000)
INSERT [dbo].[Players] ([ID], [Name], [Position], [Age], [MarketValue], [Nation], [Club], [Salary]) VALUES (5, N'Kevin De Bruyne', N'CAM       ', 29, 140.0000, N'Belgium', N'Manchester City', 12.0000)
INSERT [dbo].[Players] ([ID], [Name], [Position], [Age], [MarketValue], [Nation], [Club], [Salary]) VALUES (6, N'Fedor Smolov', N'ST        ', 30, 10.0000, N'Russia', N'Locomotiv', 2.0000)
INSERT [dbo].[Players] ([ID], [Name], [Position], [Age], [MarketValue], [Nation], [Club], [Salary]) VALUES (7, N'Manuel Neuer', N'GK        ', 34, 20.0000, N'Germany', N'Bayern Munich', 15.0000)
INSERT [dbo].[Players] ([ID], [Name], [Position], [Age], [MarketValue], [Nation], [Club], [Salary]) VALUES (8, N'Sergio Ramos', N'CB        ', 34, 30.0000, N'Spain', N'Real Madrid', 15.0000)
INSERT [dbo].[Players] ([ID], [Name], [Position], [Age], [MarketValue], [Nation], [Club], [Salary]) VALUES (9, N'Eden Hazard', N'LW        ', 29, 80.0000, N'Belgium', N'Real Madrid', 15.0000)
INSERT [dbo].[Players] ([ID], [Name], [Position], [Age], [MarketValue], [Nation], [Club], [Salary]) VALUES (10, N'Alisson', N'GK        ', 28, 100.0000, N'Brazil', N'Liverpool', 10.0000)
INSERT [dbo].[Players] ([ID], [Name], [Position], [Age], [MarketValue], [Nation], [Club], [Salary]) VALUES (11, N'Alexey Miranchuk', N'CAM       ', 25, 20.0000, N'Russia', N'Atalanta', 1.5000)
SET IDENTITY_INSERT [dbo].[Players] OFF
USE [master]
GO
ALTER DATABASE [transferMarket] SET  READ_WRITE 
GO
