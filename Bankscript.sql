USE [master]
GO
/****** Object:  Database [Bank]    Script Date: 16/11/2022 10:43:31 ******/
CREATE DATABASE [Bank]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bank', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVERDEV\MSSQL\DATA\Bank.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bank_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVERDEV\MSSQL\DATA\Bank_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Bank] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bank].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bank] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bank] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bank] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bank] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bank] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bank] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bank] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bank] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bank] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bank] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bank] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bank] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bank] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bank] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bank] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Bank] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bank] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bank] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bank] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bank] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bank] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bank] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bank] SET RECOVERY FULL 
GO
ALTER DATABASE [Bank] SET  MULTI_USER 
GO
ALTER DATABASE [Bank] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bank] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bank] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bank] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Bank] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Bank] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Bank', N'ON'
GO
ALTER DATABASE [Bank] SET QUERY_STORE = OFF
GO
USE [Bank]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 16/11/2022 10:43:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccountType] [int] NOT NULL,
	[ClientID] [int] NULL,
	[Balance] [decimal](10, 2) NOT NULL,
	[RegDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountType]    Script Date: 16/11/2022 10:43:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[RegDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Administrator]    Script Date: 16/11/2022 10:43:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrator](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[PhoneNumber] [varchar](40) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Pwd] [varchar](50) NOT NULL,
	[AdminType] [varchar](30) NOT NULL,
	[RegDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BankTransaction]    Script Date: 16/11/2022 10:43:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankTransaction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[TransactionType] [int] NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[ExternalAccount] [int] NULL,
	[RegDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 16/11/2022 10:43:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[PhoneNumber] [varchar](40) NOT NULL,
	[Email] [varchar](50) NULL,
	[RegDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionType]    Script Date: 16/11/2022 10:43:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[RegDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([ID], [AccountType], [ClientID], [Balance], [RegDate]) VALUES (1, 1, 1, CAST(10000.00 AS Decimal(10, 2)), CAST(N'2022-11-15T11:25:48.283' AS DateTime))
INSERT [dbo].[Account] ([ID], [AccountType], [ClientID], [Balance], [RegDate]) VALUES (2, 2, 2, CAST(5000.00 AS Decimal(10, 2)), CAST(N'2022-11-15T11:29:49.450' AS DateTime))
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[AccountType] ON 

INSERT [dbo].[AccountType] ([ID], [Name], [RegDate]) VALUES (1, N'Administrador', CAST(N'2020-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AccountType] ([ID], [Name], [RegDate]) VALUES (2, N'Corriente', CAST(N'2021-01-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[AccountType] OFF
GO
SET IDENTITY_INSERT [dbo].[Administrator] ON 

INSERT [dbo].[Administrator] ([ID], [Name], [PhoneNumber], [Email], [Pwd], [AdminType], [RegDate]) VALUES (1, N'Boris', N'123123123', N'boris@test.com', N'1234', N'Super', CAST(N'2022-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Administrator] ([ID], [Name], [PhoneNumber], [Email], [Pwd], [AdminType], [RegDate]) VALUES (2, N'Jose', N'000123123', N'jose@test.com', N'1234', N'Viewer', CAST(N'2022-01-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Administrator] OFF
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [Name], [PhoneNumber], [Email], [RegDate]) VALUES (1, N'Boris actualizado', N'123123123', N'bvargas@test.com', CAST(N'2022-11-11T23:28:20.873' AS DateTime))
INSERT [dbo].[Client] ([ID], [Name], [PhoneNumber], [Email], [RegDate]) VALUES (2, N'Pedro', N'00045678', N'pedro@test.com', CAST(N'2022-11-11T23:29:06.960' AS DateTime))
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (getdate()) FOR [RegDate]
GO
ALTER TABLE [dbo].[AccountType] ADD  DEFAULT (getdate()) FOR [RegDate]
GO
ALTER TABLE [dbo].[Administrator] ADD  DEFAULT (getdate()) FOR [RegDate]
GO
ALTER TABLE [dbo].[BankTransaction] ADD  DEFAULT (getdate()) FOR [RegDate]
GO
ALTER TABLE [dbo].[Client] ADD  DEFAULT (getdate()) FOR [RegDate]
GO
ALTER TABLE [dbo].[TransactionType] ADD  DEFAULT (getdate()) FOR [RegDate]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([AccountType])
REFERENCES [dbo].[AccountType] ([ID])
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[BankTransaction]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[BankTransaction]  WITH CHECK ADD FOREIGN KEY([TransactionType])
REFERENCES [dbo].[TransactionType] ([ID])
GO
USE [master]
GO
ALTER DATABASE [Bank] SET  READ_WRITE 
GO
