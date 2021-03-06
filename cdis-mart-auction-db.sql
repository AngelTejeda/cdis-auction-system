USE [master]
GO
ALTER DATABASE [CdisMartAuctionDB] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
DROP DATABASE IF EXISTS [CdisMartAuctionDB]
/****** Object:  Database [CdisMartAuctionDB]    Script Date: 08-Oct-21 2:48:42 AM ******/
CREATE DATABASE [CdisMartAuctionDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CdisMartAuctionDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CdisMartAuctionDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CdisMartAuctionDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CdisMartAuctionDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CdisMartAuctionDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CdisMartAuctionDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CdisMartAuctionDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CdisMartAuctionDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CdisMartAuctionDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CdisMartAuctionDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CdisMartAuctionDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CdisMartAuctionDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CdisMartAuctionDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CdisMartAuctionDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CdisMartAuctionDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CdisMartAuctionDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CdisMartAuctionDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CdisMartAuctionDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CdisMartAuctionDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CdisMartAuctionDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CdisMartAuctionDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CdisMartAuctionDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CdisMartAuctionDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CdisMartAuctionDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CdisMartAuctionDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CdisMartAuctionDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CdisMartAuctionDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CdisMartAuctionDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CdisMartAuctionDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CdisMartAuctionDB] SET  MULTI_USER 
GO
ALTER DATABASE [CdisMartAuctionDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CdisMartAuctionDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CdisMartAuctionDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CdisMartAuctionDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CdisMartAuctionDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CdisMartAuctionDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CdisMartAuctionDB] SET QUERY_STORE = OFF
GO
USE [CdisMartAuctionDB]
GO
/****** Object:  Table [dbo].[Auction]    Script Date: 08-Oct-21 2:48:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auction](
	[AuctionId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[ProductDescription] [varchar](100) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[HighestBid] [decimal](9, 2) NULL,
	[WinnerId] [int] NULL,
	[OwnerId] [int] NOT NULL,
 CONSTRAINT [PK_Auction] PRIMARY KEY CLUSTERED 
(
	[AuctionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuctionRecord]    Script Date: 08-Oct-21 2:48:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuctionRecord](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[AuctionId] [int] NOT NULL,
	[BidderId] [int] NOT NULL,
	[BidAmount] [decimal](9, 2) NOT NULL,
	[BidDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AuctionRecord] PRIMARY KEY CLUSTERED 
(
	[RecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 08-Oct-21 2:48:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](10) NOT NULL,
	[Password] [varchar](10) NOT NULL,
	[FullName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Auction] ON 

INSERT [dbo].[Auction] ([AuctionId], [ProductName], [ProductDescription], [StartDate], [EndDate], [HighestBid], [WinnerId], [OwnerId]) VALUES (1, N'Nintendo Switch', N'Consola Nintendo Switch portatil seminueva. Ligeramente raspada. Inlcuye 2 juegos.', CAST(N'2021-10-07T16:00:00.000' AS DateTime), CAST(N'2021-10-14T16:30:00.000' AS DateTime), NULL, NULL, 4)
INSERT [dbo].[Auction] ([AuctionId], [ProductName], [ProductDescription], [StartDate], [EndDate], [HighestBid], [WinnerId], [OwnerId]) VALUES (2, N'Lenovo Ideapad 3 15ADA05', N'Laptop Lenovo Ideapad 3 nueva y sin uso. Incluye cargador.', CAST(N'2021-10-06T07:00:00.000' AS DateTime), CAST(N'2021-10-08T12:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Auction] ([AuctionId], [ProductName], [ProductDescription], [StartDate], [EndDate], [HighestBid], [WinnerId], [OwnerId]) VALUES (3, N'Samsung Galaxy A72', N'Celular Samsung Galaxy A72 seminuevo en excelentes condiciones.', CAST(N'2021-09-06T11:00:00.000' AS DateTime), CAST(N'2021-09-18T17:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Auction] ([AuctionId], [ProductName], [ProductDescription], [StartDate], [EndDate], [HighestBid], [WinnerId], [OwnerId]) VALUES (4, N'PS5', N'Consola PS5 totalmente nueva. Incluye un mando y un juego.', CAST(N'2021-09-08T12:00:00.000' AS DateTime), CAST(N'2021-11-20T12:00:00.000' AS DateTime), NULL, NULL, 4)
INSERT [dbo].[Auction] ([AuctionId], [ProductName], [ProductDescription], [StartDate], [EndDate], [HighestBid], [WinnerId], [OwnerId]) VALUES (5, N'PS4', N'Consola PS4 usada. Excelentes condiciones. Incluye 5 juegos y dos mandos.', CAST(N'2021-11-10T17:00:00.000' AS DateTime), CAST(N'2021-11-30T17:00:00.000' AS DateTime), NULL, NULL, 4)
INSERT [dbo].[Auction] ([AuctionId], [ProductName], [ProductDescription], [StartDate], [EndDate], [HighestBid], [WinnerId], [OwnerId]) VALUES (6, N'Colección de Discos BTS', N'Colección de 5 albumes en excelente estado.', CAST(N'2021-10-06T17:00:00.000' AS DateTime), CAST(N'2021-10-08T17:00:00.000' AS DateTime), NULL, NULL, 2)
INSERT [dbo].[Auction] ([AuctionId], [ProductName], [ProductDescription], [StartDate], [EndDate], [HighestBid], [WinnerId], [OwnerId]) VALUES (7, N'The Book of Us Day6', N'Álbum de Day6. Caja ligeramente dañada, disco en perfecto estado.', CAST(N'2021-10-06T15:00:00.000' AS DateTime), CAST(N'2021-10-08T18:00:00.000' AS DateTime), NULL, NULL, 2)
INSERT [dbo].[Auction] ([AuctionId], [ProductName], [ProductDescription], [StartDate], [EndDate], [HighestBid], [WinnerId], [OwnerId]) VALUES (8, N'Samsung Galaxy A11', N'Celular Samsung Galaxy usado. Ligeros raspones en la carcasa. Totalmente funcional.', CAST(N'2021-10-20T13:00:00.000' AS DateTime), CAST(N'2021-11-05T14:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Auction] ([AuctionId], [ProductName], [ProductDescription], [StartDate], [EndDate], [HighestBid], [WinnerId], [OwnerId]) VALUES (9, N'Samsung Galaxy S6', N'Celular Samsung Galaxy seminuevo. Pantalla ligeramente estrellada.', CAST(N'2021-10-15T12:00:00.000' AS DateTime), CAST(N'2021-10-28T18:00:00.000' AS DateTime), NULL, NULL, 3)
INSERT [dbo].[Auction] ([AuctionId], [ProductName], [ProductDescription], [StartDate], [EndDate], [HighestBid], [WinnerId], [OwnerId]) VALUES (10, N'IPhone 8 Plus', N'Celular IPhone 8 usado. Excelentes condiciones.', CAST(N'2021-10-08T09:00:00.000' AS DateTime), CAST(N'2021-10-12T17:00:00.000' AS DateTime), NULL, NULL, 2)
SET IDENTITY_INSERT [dbo].[Auction] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [UserName], [Password], [FullName], [Email]) VALUES (1, N'angelT', N'1234', N'Angel Tejeda Tiscareño', N'angel.tejedat@gmail.com')
INSERT [dbo].[User] ([UserId], [UserName], [Password], [FullName], [Email]) VALUES (2, N'legnaMora', N'1234', N'Andrea Natalia Morales Guerra', N'andymorales2001@gmail.com')
INSERT [dbo].[User] ([UserId], [UserName], [Password], [FullName], [Email]) VALUES (3, N'OPerez', N'1234', N'Osvaldo Ortega Perez', N'osvaldo.ortega@uanl.edu.mx')
INSERT [dbo].[User] ([UserId], [UserName], [Password], [FullName], [Email]) VALUES (4, N'edZon', N'1234', N'Edson Yael García Silva', N'edson.garcias@hotmail.com')
INSERT [dbo].[User] ([UserId], [UserName], [Password], [FullName], [Email]) VALUES (5, N'sof10', N'1234', N'Sofía Alejandra Gaytán Díaz', N'sofia.gaytan@outlook.com')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Email]    Script Date: 08-Oct-21 2:48:43 AM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [UQ_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_UserName]    Script Date: 08-Oct-21 2:48:43 AM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [UQ_UserName] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Auction]  WITH CHECK ADD  CONSTRAINT [FK_Auction_Owner] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Auction] CHECK CONSTRAINT [FK_Auction_Owner]
GO
ALTER TABLE [dbo].[Auction]  WITH CHECK ADD  CONSTRAINT [FK_Auction_Winner] FOREIGN KEY([WinnerId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Auction] CHECK CONSTRAINT [FK_Auction_Winner]
GO
ALTER TABLE [dbo].[AuctionRecord]  WITH CHECK ADD  CONSTRAINT [FK_AuctionRecord_Auction] FOREIGN KEY([AuctionId])
REFERENCES [dbo].[Auction] ([AuctionId])
GO
ALTER TABLE [dbo].[AuctionRecord] CHECK CONSTRAINT [FK_AuctionRecord_Auction]
GO
ALTER TABLE [dbo].[AuctionRecord]  WITH CHECK ADD  CONSTRAINT [FK_AuctionRecord_Bidder] FOREIGN KEY([BidderId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[AuctionRecord] CHECK CONSTRAINT [FK_AuctionRecord_Bidder]
GO
USE [master]
GO
ALTER DATABASE [CdisMartAuctionDB] SET  READ_WRITE 
GO
