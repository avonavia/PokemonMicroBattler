USE [master]
GO
/****** Object:  Database [PokemonDB]    Script Date: 06.10.2023 16:15:40 ******/
CREATE DATABASE [PokemonDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PokemonDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PokemonDB.mdf' , SIZE = 8192KB , MAXSIZE = 102400KB , FILEGROWTH = 10240KB )
 LOG ON 
( NAME = N'PokemonDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PokemonDB_log.ldf' , SIZE = 38912KB , MAXSIZE = 102400KB , FILEGROWTH = 10240KB )
GO
ALTER DATABASE [PokemonDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PokemonDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PokemonDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PokemonDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PokemonDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PokemonDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PokemonDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PokemonDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PokemonDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PokemonDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PokemonDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PokemonDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PokemonDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PokemonDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PokemonDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PokemonDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PokemonDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PokemonDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PokemonDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PokemonDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PokemonDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PokemonDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PokemonDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PokemonDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PokemonDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PokemonDB] SET  MULTI_USER 
GO
ALTER DATABASE [PokemonDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PokemonDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PokemonDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PokemonDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PokemonDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PokemonDB] SET QUERY_STORE = OFF
GO
USE [PokemonDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [PokemonDB]
GO
/****** Object:  Table [dbo].[BattleLogs]    Script Date: 06.10.2023 16:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BattleLogs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Player] [nvarchar](255) NULL,
	[WinState] [nvarchar](255) NULL,
	[PlayerOther] [nvarchar](255) NULL,
	[PokemonID] [int] NULL,
	[LogDate] [datetime] NULL,
 CONSTRAINT [PK_BattleLogs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Moves]    Script Date: 06.10.2023 16:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Moves](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[TypeID] [int] NULL,
	[Power] [int] NULL,
	[Accuracy] [int] NULL,
 CONSTRAINT [PK_Moves] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovesPokemon]    Script Date: 06.10.2023 16:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovesPokemon](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MoveID] [int] NULL,
	[PokemonID] [int] NULL,
 CONSTRAINT [PK_MovesPokemon] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pokemon]    Script Date: 06.10.2023 16:15:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pokemon](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type1_ID] [int] NULL,
	[Type2_ID] [int] NULL,
	[Name] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[Weight] [float] NULL,
	[Height] [float] NULL,
	[EvolveLevel] [int] NULL,
 CONSTRAINT [PK_Pokemon] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Types_]    Script Date: 06.10.2023 16:15:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types_](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_Types] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BattleLogs] ON 

INSERT [dbo].[BattleLogs] ([ID], [Player], [WinState], [PlayerOther], [PokemonID], [LogDate]) VALUES (1, N'a', N'Won', N'b', 1, CAST(N'2023-09-09T19:03:19.303' AS DateTime))
INSERT [dbo].[BattleLogs] ([ID], [Player], [WinState], [PlayerOther], [PokemonID], [LogDate]) VALUES (2, N'b', N'Lost', N'a', 14, CAST(N'2023-09-09T19:03:19.387' AS DateTime))
INSERT [dbo].[BattleLogs] ([ID], [Player], [WinState], [PlayerOther], [PokemonID], [LogDate]) VALUES (3, N'b', N'Won', N'a', 54, CAST(N'2023-09-09T19:06:02.350' AS DateTime))
INSERT [dbo].[BattleLogs] ([ID], [Player], [WinState], [PlayerOther], [PokemonID], [LogDate]) VALUES (4, N'a', N'Lost', N'b', 28, CAST(N'2023-09-09T19:06:02.357' AS DateTime))
INSERT [dbo].[BattleLogs] ([ID], [Player], [WinState], [PlayerOther], [PokemonID], [LogDate]) VALUES (5, N'b', N'Won', N'a', 94, CAST(N'2023-09-09T20:18:41.443' AS DateTime))
INSERT [dbo].[BattleLogs] ([ID], [Player], [WinState], [PlayerOther], [PokemonID], [LogDate]) VALUES (6, N'a', N'Lost', N'b', 19, CAST(N'2023-09-09T20:18:41.447' AS DateTime))
INSERT [dbo].[BattleLogs] ([ID], [Player], [WinState], [PlayerOther], [PokemonID], [LogDate]) VALUES (7, N'a', N'Won', N'b', 39, CAST(N'2023-09-09T21:49:00.733' AS DateTime))
INSERT [dbo].[BattleLogs] ([ID], [Player], [WinState], [PlayerOther], [PokemonID], [LogDate]) VALUES (8, N'b', N'Lost', N'a', 95, CAST(N'2023-09-09T21:49:00.740' AS DateTime))
INSERT [dbo].[BattleLogs] ([ID], [Player], [WinState], [PlayerOther], [PokemonID], [LogDate]) VALUES (9, N'a', N'Won', N'b', 56, CAST(N'2023-09-10T15:54:23.260' AS DateTime))
INSERT [dbo].[BattleLogs] ([ID], [Player], [WinState], [PlayerOther], [PokemonID], [LogDate]) VALUES (10, N'b', N'Lost', N'a', 85, CAST(N'2023-09-10T15:54:23.260' AS DateTime))
INSERT [dbo].[BattleLogs] ([ID], [Player], [WinState], [PlayerOther], [PokemonID], [LogDate]) VALUES (11, N'a', N'Won', N'b', 144, CAST(N'2023-09-10T15:56:15.747' AS DateTime))
INSERT [dbo].[BattleLogs] ([ID], [Player], [WinState], [PlayerOther], [PokemonID], [LogDate]) VALUES (12, N'b', N'Lost', N'a', 149, CAST(N'2023-09-10T15:56:15.747' AS DateTime))
INSERT [dbo].[BattleLogs] ([ID], [Player], [WinState], [PlayerOther], [PokemonID], [LogDate]) VALUES (13, N'a', N'Won', N'b', 144, CAST(N'2023-09-10T15:59:22.277' AS DateTime))
INSERT [dbo].[BattleLogs] ([ID], [Player], [WinState], [PlayerOther], [PokemonID], [LogDate]) VALUES (14, N'b', N'Lost', N'a', 149, CAST(N'2023-09-10T15:59:22.280' AS DateTime))
INSERT [dbo].[BattleLogs] ([ID], [Player], [WinState], [PlayerOther], [PokemonID], [LogDate]) VALUES (15, N'a', N'Won', N'b', 107, CAST(N'2023-09-10T16:01:51.127' AS DateTime))
INSERT [dbo].[BattleLogs] ([ID], [Player], [WinState], [PlayerOther], [PokemonID], [LogDate]) VALUES (16, N'b', N'Lost', N'a', 83, CAST(N'2023-09-10T16:01:51.130' AS DateTime))
INSERT [dbo].[BattleLogs] ([ID], [Player], [WinState], [PlayerOther], [PokemonID], [LogDate]) VALUES (17, N'b', N'Won', N'a', 7, CAST(N'2023-09-10T16:03:37.320' AS DateTime))
INSERT [dbo].[BattleLogs] ([ID], [Player], [WinState], [PlayerOther], [PokemonID], [LogDate]) VALUES (18, N'a', N'Lost', N'b', 4, CAST(N'2023-09-10T16:03:37.327' AS DateTime))
INSERT [dbo].[BattleLogs] ([ID], [Player], [WinState], [PlayerOther], [PokemonID], [LogDate]) VALUES (19, N'b', N'Won', N'a', 6, CAST(N'2023-09-10T16:09:18.110' AS DateTime))
INSERT [dbo].[BattleLogs] ([ID], [Player], [WinState], [PlayerOther], [PokemonID], [LogDate]) VALUES (20, N'a', N'Lost', N'b', 47, CAST(N'2023-09-10T16:09:18.120' AS DateTime))
INSERT [dbo].[BattleLogs] ([ID], [Player], [WinState], [PlayerOther], [PokemonID], [LogDate]) VALUES (21, N'b', N'Won', N'a', 73, CAST(N'2023-09-11T15:33:14.290' AS DateTime))
INSERT [dbo].[BattleLogs] ([ID], [Player], [WinState], [PlayerOther], [PokemonID], [LogDate]) VALUES (22, N'a', N'Lost', N'b', 37, CAST(N'2023-09-11T15:33:14.293' AS DateTime))
INSERT [dbo].[BattleLogs] ([ID], [Player], [WinState], [PlayerOther], [PokemonID], [LogDate]) VALUES (23, N'b', N'Won', N'a', 151, CAST(N'2023-10-05T22:23:31.807' AS DateTime))
INSERT [dbo].[BattleLogs] ([ID], [Player], [WinState], [PlayerOther], [PokemonID], [LogDate]) VALUES (24, N'a', N'Lost', N'b', 25, CAST(N'2023-10-05T22:23:31.810' AS DateTime))
SET IDENTITY_INSERT [dbo].[BattleLogs] OFF
SET IDENTITY_INSERT [dbo].[Moves] ON 

INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (1, N'Absorb', 7, 20, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (2, N'Acid', 11, 40, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (3, N'Aurora Beam', 9, 65, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (4, N'Barrage', 10, 15, 85)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (5, N'Bind', 10, 15, 85)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (6, N'Blizzard', 9, 110, 70)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (7, N'Bite', 10, 60, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (8, N'Body Slam', 10, 85, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (9, N'Bone Club', 8, 65, 85)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (10, N'Boomerang', 8, 50, 90)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (11, N'Bubble', 14, 40, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (12, N'Bubble Beam', 14, 65, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (13, N'Clamp', 14, 35, 85)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (14, N'Comet Punch', 10, 18, 85)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (15, N'Confusion', 12, 50, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (16, N'Constrict', 10, 10, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (17, N'Crabhammer', 14, 100, 90)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (18, N'Cut', 10, 50, 95)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (19, N'Dig', 8, 80, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (20, N'Dizzy Punch', 10, 70, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (21, N'Double Kick', 4, 30, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (22, N'Double Slap', 10, 15, 85)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (23, N'Double Edge', 10, 120, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (24, N'Dream Eater', 12, 100, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (25, N'Drill Peck', 15, 80, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (26, N'Earthquake', 8, 100, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (27, N'Egg Bomb', 10, 100, 75)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (28, N'Ember', 5, 40, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (29, N'Explosion', 10, 250, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (30, N'Fire Blast', 5, 110, 85)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (31, N'Fire Punch', 5, 75, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (32, N'Fire Spin', 5, 35, 85)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (33, N'Flamethrower', 5, 90, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (34, N'Fly', 15, 90, 95)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (35, N'Fury Attack', 10, 15, 85)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (36, N'Fury Swipes', 10, 18, 80)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (37, N'Gust', 15, 40, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (38, N'Headbutt', 10, 70, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (39, N'High Jump Kick', 4, 130, 90)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (40, N'Horn Attack', 10, 65, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (41, N'Hydro Pump', 14, 110, 80)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (42, N'Hyper Beam', 10, 150, 90)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (43, N'Hyper Fang', 10, 80, 90)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (44, N'Ice Beam', 9, 90, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (45, N'Ice Punch', 9, 75, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (46, N'Jump Kick', 4, 100, 95)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (47, N'Karate Chop', 4, 50, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (48, N'Leech Life', 1, 20, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (49, N'Lick', 6, 30, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (50, N'Mega Drain', 7, 40, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (51, N'Mega Kick', 10, 120, 75)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (52, N'Mega Punch', 10, 80, 85)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (53, N'Pay Day', 10, 40, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (54, N'Peck', 15, 35, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (55, N'Pin Missile', 1, 25, 95)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (56, N'Petal Dance', 7, 120, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (57, N'Poison Sting', 11, 15, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (58, N'Pound', 10, 40, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (59, N'Psybeam', 12, 65, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (60, N'Psychic', 12, 90, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (61, N'Quick Attack', 10, 40, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (62, N'Rage', 10, 20, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (63, N'Razor Leaf', 7, 55, 95)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (64, N'Razor Wind', 10, 80, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (65, N'Rock Slide', 13, 75, 90)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (66, N'Rock Throw', 13, 50, 90)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (67, N'Rolling Kick', 4, 60, 85)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (68, N'Scratch', 10, 40, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (69, N'Self-Destruct', 10, 200, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (70, N'Skull Bash', 10, 130, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (71, N'Sky Attack', 15, 140, 90)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (72, N'Slam', 10, 80, 75)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (73, N'Slash', 10, 70, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (74, N'Sludge', 11, 65, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (75, N'Smog', 11, 30, 70)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (76, N'Solar Beam', 7, 120, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (77, N'Spike Cannon', 10, 20, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (78, N'Stomp', 10, 65, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (79, N'Strength', 10, 80, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (80, N'Struggle', 10, 50, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (81, N'Submission', 4, 80, 80)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (82, N'Surf', 14, 90, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (83, N'Swift', 10, 60, 90)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (84, N'Tackle', 10, 50, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (85, N'Take Down', 10, 90, 85)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (86, N'Thrash', 10, 120, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (87, N'Thunder', 3, 110, 70)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (88, N'Thunder Punch', 3, 75, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (89, N'Thunder Shock', 3, 40, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (90, N'Thunderbolt', 3, 90, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (91, N'Tri Attack', 10, 80, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (92, N'Twineedle', 1, 25, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (93, N'Vice Grip', 10, 55, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (94, N'Vine Whip', 7, 45, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (95, N'Water Gun', 14, 40, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (96, N'Waterfall', 14, 80, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (97, N'Wing Attack', 15, 60, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (98, N'Wrap', 10, 15, 90)
SET IDENTITY_INSERT [dbo].[Moves] OFF
GO
SET IDENTITY_INSERT [dbo].[MovesPokemon] ON 

INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (1, 84, 1)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (2, 94, 1)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (3, 63, 1)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (4, 76, 1)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (5, 84, 2)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (6, 94, 2)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (7, 63, 2)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (8, 76, 2)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (9, 1, 3)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (10, 2, 3)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (11, 14, 3)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (12, 63, 3)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (13, 68, 4)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (14, 28, 4)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (15, 62, 4)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (16, 33, 4)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (17, 68, 5)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (18, 28, 5)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (19, 62, 5)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (20, 73, 5)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (21, 32, 6)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (22, 33, 6)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (23, 73, 6)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (24, 62, 6)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (25, 84, 7)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (26, 11, 7)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (27, 7, 7)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (28, 70, 7)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (29, 70, 8)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (30, 41, 8)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (31, 7, 8)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (32, 11, 8)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (33, 41, 9)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (34, 70, 9)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (35, 7, 9)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (36, 95, 9)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (37, 84, 10)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (38, 84, 11)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (39, 84, 12)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (40, 59, 12)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (41, 57, 13)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (42, 57, 14)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (43, 55, 15)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (44, 62, 15)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (45, 35, 15)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (46, 57, 15)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (47, 37, 16)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (48, 61, 16)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (49, 97, 16)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (50, 37, 17)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (51, 97, 17)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (52, 37, 18)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (53, 61, 18)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (54, 97, 18)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (55, 84, 19)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (56, 61, 19)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (57, 43, 19)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (58, 43, 20)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (59, 61, 20)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (60, 84, 20)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (61, 54, 21)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (62, 35, 21)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (63, 25, 21)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (64, 54, 22)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (65, 35, 22)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (66, 25, 22)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (67, 98, 23)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (68, 57, 23)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (69, 7, 23)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (70, 2, 23)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (71, 98, 24)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (72, 57, 24)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (73, 7, 24)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (74, 2, 24)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (75, 89, 25)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (76, 61, 25)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (77, 87, 25)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (78, 87, 26)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (79, 89, 26)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (80, 68, 27)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (81, 73, 27)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (82, 36, 27)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (83, 73, 28)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (84, 57, 28)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (85, 35, 28)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (86, 84, 29)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (87, 57, 29)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (88, 7, 29)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (89, 36, 29)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (90, 84, 30)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (91, 68, 30)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (92, 7, 30)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (93, 36, 30)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (94, 84, 31)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (95, 68, 31)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (96, 57, 31)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (97, 8, 31)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (98, 84, 32)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (99, 40, 32)
GO
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (100, 57, 32)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (101, 35, 32)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (102, 84, 33)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (103, 40, 33)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (104, 57, 33)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (105, 35, 33)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (106, 84, 34)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (107, 40, 34)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (108, 57, 34)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (109, 86, 34)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (110, 58, 35)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (111, 22, 35)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (112, 58, 36)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (113, 22, 36)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (114, 28, 37)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (115, 61, 37)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (116, 33, 37)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (117, 32, 37)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (118, 28, 38)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (119, 61, 38)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (120, 33, 38)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (121, 32, 38)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (122, 22, 39)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (123, 23, 39)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (124, 23, 40)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (125, 22, 40)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (126, 48, 41)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (127, 7, 41)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (128, 97, 41)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (129, 48, 42)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (130, 7, 42)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (131, 97, 42)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (132, 1, 43)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (133, 2, 43)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (134, 76, 43)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (135, 1, 44)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (136, 2, 44)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (137, 76, 44)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (138, 76, 45)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (139, 2, 45)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (140, 1, 45)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (141, 68, 46)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (142, 48, 46)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (143, 73, 46)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (144, 48, 47)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (145, 73, 47)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (146, 68, 47)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (147, 84, 48)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (148, 48, 48)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (149, 59, 48)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (150, -1, 48)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (151, 48, 49)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (152, 59, 49)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (153, 84, 49)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (154, 60, 49)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (155, 68, 50)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (156, 19, 50)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (157, 73, 50)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (158, 26, 50)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (159, 26, 51)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (160, 73, 51)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (161, 19, 51)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (162, 68, 51)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (163, 68, 52)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (164, 7, 52)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (165, 36, 52)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (166, 73, 52)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (167, 73, 53)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (168, 36, 53)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (169, 7, 53)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (170, 68, 53)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (171, 41, 54)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (172, 68, 54)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (173, 36, 54)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (174, 68, 55)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (175, 36, 55)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (176, 41, 55)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (177, 68, 56)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (178, 47, 56)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (179, 36, 56)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (180, 86, 56)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (181, 68, 57)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (182, 36, 57)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (183, 86, 57)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (184, 47, 57)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (185, 7, 58)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (186, 28, 58)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (187, 85, 58)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (188, 33, 58)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (189, 7, 59)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (190, 28, 59)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (191, 85, 59)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (192, 33, 59)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (193, 11, 60)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (194, 95, 60)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (195, 22, 60)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (196, 41, 60)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (197, 11, 61)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (198, 95, 61)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (199, 22, 61)
GO
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (200, 41, 61)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (201, 11, 62)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (202, 95, 62)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (203, 21, 62)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (204, 8, 62)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (205, 22, 63)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (206, 22, 64)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (207, 59, 64)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (208, 59, 65)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (209, 60, 65)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (210, 47, 66)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (211, 81, 66)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (212, 47, 67)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (213, 81, 67)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (214, 47, 68)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (215, 81, 68)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (216, 94, 69)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (217, 98, 69)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (218, 2, 69)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (219, 63, 69)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (220, -9, 70)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (221, 2, 70)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (222, 63, 70)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (223, 72, 70)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (224, 2, 71)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (225, 98, 71)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (226, -9, 71)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (227, 72, 71)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (228, 2, 72)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (229, 41, 72)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (230, 57, 72)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (231, 95, 73)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (232, 57, 73)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (233, 2, 73)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (234, 41, 73)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (235, 84, 74)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (236, 66, 74)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (237, 26, 74)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (238, 29, 74)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (239, 84, 75)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (240, 69, 75)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (241, 26, 75)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (242, 29, 75)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (243, 84, 76)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (244, 26, 76)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (245, 29, 76)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (246, 66, 76)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (247, 28, 77)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (248, 78, 77)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (249, 30, 77)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (250, 85, 77)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (251, 28, 78)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (252, 32, 78)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (253, 85, 78)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (254, 78, 78)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (255, 15, 79)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (256, 38, 79)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (257, 95, 79)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (258, 60, 79)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (259, 15, 80)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (260, 38, 80)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (261, 95, 80)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (262, 60, 80)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (263, 84, 81)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (264, 89, 81)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (265, 83, 81)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (266, 84, 82)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (267, 83, 82)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (268, 89, 82)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (269, 54, 83)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (270, 35, 83)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (271, 73, 83)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (272, 35, 84)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (273, 25, 84)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (274, 62, 84)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (275, 91, 84)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (276, 54, 85)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (277, 35, 85)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (278, 25, 85)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (279, 91, 85)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (280, 38, 86)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (281, 3, 86)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (282, 85, 86)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (283, 44, 86)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (284, 38, 87)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (285, 3, 87)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (286, 85, 87)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (287, 44, 87)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (288, 58, 88)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (289, 74, 88)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (290, 58, 89)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (291, 74, 89)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (292, 84, 90)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (293, 13, 90)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (294, 3, 90)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (295, 44, 90)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (296, 84, 91)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (297, 77, 91)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (298, 49, 92)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (299, 24, 92)
GO
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (300, 49, 93)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (301, 24, 93)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (302, 49, 94)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (303, 24, 94)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (304, 5, 95)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (305, 66, 95)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (306, 62, 95)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (307, 72, 95)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (308, 58, 96)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (309, 38, 96)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (310, 60, 96)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (311, 58, 97)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (312, 38, 97)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (313, 60, 97)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (314, 11, 98)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (315, 93, 98)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (316, 78, 98)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (317, 17, 98)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (318, 11, 99)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (319, 17, 99)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (320, 78, 99)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (321, 84, 100)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (322, 69, 100)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (323, 83, 100)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (324, 29, 100)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (325, 84, 101)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (326, 69, 101)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (327, 83, 101)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (328, 29, 101)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (329, 4, 102)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (330, 17, 102)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (331, 9, 102)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (332, 4, 103)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (333, 78, 103)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (334, 9, 104)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (335, 86, 104)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (336, 10, 104)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (337, 62, 104)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (338, 9, 105)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (339, 86, 105)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (340, 10, 105)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (341, 62, 105)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (342, 21, 106)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (343, 67, 106)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (344, 46, 106)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (345, 39, 106)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (346, 14, 107)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (347, 31, 107)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (348, 88, 107)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (349, 52, 107)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (350, 98, 108)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (351, 78, 108)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (352, 72, 108)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (353, 84, 109)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (354, 75, 109)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (355, 69, 109)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (356, 29, 109)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (357, 84, 110)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (358, 75, 110)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (359, 74, 110)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (360, 69, 110)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (361, 40, 111)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (362, 78, 111)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (363, 35, 111)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (364, 85, 111)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (365, 40, 112)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (366, 78, 112)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (367, 35, 112)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (368, 85, 112)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (369, 58, 113)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (370, 22, 113)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (371, 23, 113)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (372, 16, 114)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (373, 5, 114)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (374, 1, 114)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (375, 72, 114)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (376, 14, 115)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (377, 62, 115)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (378, 7, 115)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (379, 20, 115)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (380, 11, 116)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (381, 95, 116)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (382, 41, 116)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (383, 11, 117)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (384, 95, 117)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (385, 41, 117)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (386, 54, 118)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (387, 40, 118)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (388, 35, 118)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (389, 96, 118)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (390, 54, 119)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (391, 40, 119)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (392, 35, 119)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (393, 96, 119)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (394, 84, 120)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (395, 95, 120)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (396, 83, 120)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (397, 41, 120)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (398, 41, 121)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (399, 15, 122)
GO
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (400, 22, 122)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (401, 61, 123)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (402, 73, 123)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (403, 58, 124)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (404, 49, 26)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (405, 22, 124)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (406, 45, 124)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (407, 8, 124)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (408, 61, 125)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (409, 89, 125)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (410, 88, 125)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (411, 87, 125)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (412, 28, 126)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (413, 31, 126)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (414, 75, 126)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (415, 33, 126)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (416, 93, 127)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (417, 73, 127)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (418, 84, 128)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (419, 78, 128)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (420, 62, 128)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (421, 85, 128)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (422, 84, 129)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (423, 84, 130)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (424, 7, 130)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (425, 41, 130)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (426, 42, 130)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (427, 95, 131)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (428, 8, 131)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (429, 44, 131)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (430, 41, 131)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (431, 22, 132)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (432, 84, 133)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (433, 61, 133)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (434, 7, 133)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (435, 85, 133)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (436, 84, 134)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (437, 61, 134)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (438, 95, 134)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (439, 41, 134)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (440, 84, 135)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (441, 61, 135)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (442, 89, 135)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (443, 87, 135)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (444, 84, 136)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (445, 61, 136)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (446, 28, 136)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (447, 7, 26)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (448, 33, 136)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (449, 84, 137)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (450, 59, 137)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (451, 91, 137)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (452, 95, 138)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (453, 40, 138)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (454, 77, 138)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (455, 41, 138)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (456, 95, 139)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (457, 40, 139)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (458, 77, 139)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (459, 41, 139)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (460, 68, 140)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (461, 1, 140)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (462, 73, 140)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (463, 41, 140)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (464, 68, 141)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (465, 1, 141)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (466, 73, 141)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (467, 41, 141)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (468, 97, 142)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (469, 7, 142)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (470, 85, 142)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (471, 42, 142)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (472, 38, 143)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (473, 8, 143)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (474, 23, 143)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (475, 42, 143)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (476, 54, 144)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (477, 44, 144)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (478, 6, 144)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (479, 89, 145)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (480, 25, 145)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (481, 87, 145)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (482, 54, 146)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (483, 32, 146)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (484, 71, 146)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (485, 98, 147)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (486, 72, 147)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (487, 42, 147)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (488, 98, 148)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (489, 72, 148)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (490, 42, 148)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (491, 98, 149)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (492, 72, 149)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (493, 42, 149)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (494, 83, 150)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (495, 60, 150)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (496, 58, 151)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (497, 52, 151)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (498, 60, 151)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (499, 1, 10)
GO
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (500, 3, 10)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (501, 13, 10)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (502, 10, 11)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (503, 11, 11)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (504, 61, 11)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (505, 61, 12)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (506, 85, 12)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (507, 98, 13)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (508, 91, 13)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (509, 74, 13)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (510, 98, 14)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (511, 91, 14)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (512, 74, 14)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (513, 71, 16)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (514, 71, 17)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (515, 76, 17)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (516, 71, 18)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (517, 53, 19)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (518, 53, 20)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (519, 71, 21)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (520, 71, 22)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (521, 90, 25)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (522, 7, 27)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (523, 7, 28)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (524, 78, 35)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (525, 75, 35)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (526, 5, 36)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (527, 4, 36)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (528, 18, 39)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (529, 21, 39)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (530, 18, 40)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (531, 21, 40)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (532, 18, 64)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (533, 21, 64)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (534, 62, 65)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (535, 69, 65)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (536, 39, 66)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (537, 35, 66)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (538, 39, 67)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (539, 35, 67)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (540, 39, 68)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (541, 35, 68)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (542, 61, 88)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (543, 68, 88)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (544, 61, 89)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (545, 68, 89)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (546, 61, 91)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (547, 68, 91)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (548, 20, 92)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (549, 14, 92)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (550, 20, 93)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (551, 14, 93)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (552, 20, 94)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (553, 14, 94)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (554, 18, 103)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (555, 72, 103)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (556, 18, 122)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (557, 72, 122)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (558, 70, 123)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (559, 86, 123)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (560, 94, 127)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (561, 83, 127)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (562, 94, 150)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (563, 91, 150)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (564, 91, 63)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (565, 93, 63)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (566, 96, 63)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (567, 91, 121)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (568, 93, 121)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (569, 96, 121)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (570, 91, 129)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (571, 93, 129)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (572, 96, 129)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (573, 91, 132)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (574, 93, 132)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (575, 96, 132)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (576, 92, 41)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (577, 92, 42)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (578, 92, 43)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (579, 92, 44)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (580, 92, 45)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (581, 92, 46)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (582, 92, 47)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (583, 92, 54)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (584, 92, 55)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (585, 92, 72)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (586, 92, 81)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (587, 92, 82)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (588, 92, 83)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (589, 92, 96)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (590, 92, 97)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (591, 92, 99)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (592, 92, 102)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (593, 92, 108)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (594, 92, 113)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (595, 92, 116)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (596, 92, 117)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (597, 92, 137)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (598, 92, 144)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (599, 92, 145)
GO
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (600, 92, 146)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (601, 92, 147)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (602, 92, 148)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (603, 92, 149)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (604, 92, 151)
SET IDENTITY_INSERT [dbo].[MovesPokemon] OFF
SET IDENTITY_INSERT [dbo].[Pokemon] ON 

INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (1, 7, 16, N'Bulbasaur', N'Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the suns rays, the seed grows progressively larger.', 15.199, 26, 16)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (2, 7, 11, N'Ivysaur', N'There is a bud on this Pokémon''s back. To support its weight, Ivysaur''s legs and trunk grow thick and strong. If it starts spending more time lying in the sunlight, it''s a sign that the bud will bloom into a large flower soon.', 28.699, 39, 32)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (3, 7, 11, N'Venusaur', N'There is a large flower on Venusaur''s back. The flower is said to take on vivid colors if it gets plenty of nutrition and sunlight. The flower''s aroma soothes the emotions of people.', 220.5, 79, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (4, 5, 16, N'Charmander', N'The flame that burns at the tip of its tail is an indication of its emotions. The flame wavers when Charmander is enjoying itself. If the Pokémon becomes enraged, the flame burns fiercely.', 18.699, 24, 16)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (5, 5, 16, N'Charmeleon', N'Charmeleon mercilessly destroys its foes using its sharp claws. If it encounters a strong foe, it turns aggressive. In this excited state, the flame at the tip of its tail flares with a bluish white color.', 41.899, 43, 32)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (6, 5, 15, N'Charizard', N'Charizard flies around the sky in search of powerful opponents. It breathes fire of such great heat that it melts anything. However, it never turns its fiery breath on any opponent weaker than itself.', 199.5, 67, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (7, 14, 16, N'Squirtle', N'Squirtle''s shell is not merely used for protection. The shell''s rounded shape and the grooves on its surface help minimize resistance in water, enabling this Pokémon to swim at high speeds.', 19.8, 20, 16)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (8, 14, 16, N'Wartortle', N'Its tail is large and covered with a rich, thick fur. The tail becomes increasingly deeper in color as Wartortle ages. The scratches on its shell are evidence of this Pokémon''s toughness as a battler.', 49.6, 39, 32)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (9, 14, 16, N'Blastoise', N'Blastoise has water spouts that protrude from its shell. The water spouts are very accurate. They can shoot bullets of water with enough accuracy to strike empty cans from a distance of over 160 feet.', 188.5, 63, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (10, 1, 16, N'Caterpie', N'Caterpie has a voracious appetite. It can devour leaves bigger than its body right before your eyes. From its antenna, this Pokémon releases a terrifically strong odor.', 6.4, 12, 7)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (11, 1, 16, N'Metapod', N'The shell covering this Pokémon''s body is as hard as an iron slab. Metapod does not move very much. It stays still because it is preparing its soft innards for evolution inside the hard shell.', 21.8, 28, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (12, 1, 15, N'Butterfree', N'Butterfree has a superior ability to search for delicious honey from flowers. It can even search out, extract, and carry honey from flowers that are blooming over six miles from its nest.', 70.5, 43, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (13, 1, 11, N'Weedle', N'Weedle has an extremely acute sense of smell. It is capable of distinguishing its favorite kinds of leaves from those it dislikes just by sniffing with its big red proboscis (nose).', 7, 12, 7)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (14, 1, 11, N'Kakuna', N'Kakuna remains virtually immobile as it clings to a tree. However, on the inside, it is extremely busy as it prepares for its coming evolution. This is evident from how hot the shell becomes to the touch.', 22, 24, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (15, 1, 11, N'Beedrill', N'Beedrill is extremely territorial. No one should ever approach its nest—this is for their own safety. If angered, they will attack in a furious swarm.', 65, 39, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (16, 10, 15, N'Pidgey', N'Pidgey has an extremely sharp sense of direction. It is capable of unerringly returning home to its nest, however far it may be removed from its familiar surroundings.\n', 4, 12, 18)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (17, 10, 15, N'Pidgeotto', N'Pidgeotto claims a large area as its own territory. This Pokémon flies around, patrolling its living space. If its territory is violated, it shows no mercy in thoroughly punishing the foe with its sharp claws.', 66.09, 43, 36)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (18, 10, 15, N'Pidgeot', N'This Pokémon has a dazzling plumage of beautifully glossy feathers. Many Trainers are captivated by the striking beauty of the feathers on its head, compelling them to choose Pidgeot as their Pokémon.', 87.099, 59, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (19, 10, 16, N'Rattata', N'Rattata is cautious in the extreme. Even while it is asleep, it constantly listens by moving its ears around. It is not picky about where it lives—it will make its nest anywhere.', 7.7, 12, 20)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (20, 10, 16, N'Raticate', N'Raticate''s sturdy fangs grow steadily. To keep them ground down, it gnaws on rocks and logs. It may even chew on the walls of houses.', 40.79, 28, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (21, 10, 15, N'Spearow', N'Spearow has a very loud cry that can be heard over half a mile away. If its high, keening cry is heard echoing all around, it is a sign that they are warning each other of danger.', 4.4, 12, 20)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (22, 10, 15, N'Fearow', N'Fearow is recognized by its long neck and elongated beak. They are conveniently shaped for catching prey in soil or water. It deftly moves its long and skinny beak to pluck prey.', 83.799, 47, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (23, 11, 16, N'Ekans', N'Ekans curls itself up in a spiral while it rests. Assuming this position allows it to quickly respond to a threat from any direction with a glare from its upraised head.', 15.199, 79, 22)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (24, 11, 16, N'Arbok', N'This Pokémon is terrifically strong in order to constrict things with its body. It can even flatten steel oil drums. Once Arbok wraps its body around its foe, escaping its crunching embrace is impossible.', 143.3, 138, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (25, 3, 16, N'Pikachu', N'Whenever Pikachu comes across something new, it blasts it with a jolt of electricity. If you come across a blackened berry, it''s evidence that this Pokémon mistook the intensity of its charge.', 13.199, 16, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (26, 3, 16, N'Raichu', N'If the electrical sacs become excessively charged, Raichu plants its tail in the ground and discharges. Scorched patches of ground will be found near this Pokémon''s nest.', 66.099, 31, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (27, 8, 16, N'Sandshrew', N'Sandshrew''s body is configured to absorb water without waste, enabling it to survive in an arid desert. This Pokémon curls up to protect itself from its enemies.', 26, 24, 22)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (28, 8, 16, N'Sandslash', N'Sandslash''s body is covered by tough spikes, which are hardened sections of its hide. Once a year, the old spikes fall out, to be replaced with new spikes that grow out from beneath the old ones.', 65, 39, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (29, 11, 16, N'Nidoran♀', N'Nidoran♀ has barbs that secrete a powerful poison. They are thought to have developed as protection for this small-bodied Pokémon. When enraged, it releases a horrible toxin from its horn.', 15.4, 16, 16)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (30, 11, 16, N'Nidorina', N'When Nidorina are with their friends or family, they keep their barbs tucked away to prevent hurting each other. This Pokémon appears to become nervous if separated from the others.', 44.1, 31, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (31, 11, 8, N'Nidoqueen', N'Nidoqueen''s body is encased in extremely hard scales. It is adept at sending foes flying with harsh tackles. This Pokémon is at its strongest when it is defending its young.', 132.3, 51, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (32, 11, 16, N'Nidoran♂', N'Nidoran♂ has developed muscles for moving its ears. Thanks to them, the ears can be freely moved in any direction. Even the slightest sound does not escape this Pokémon''s notice.', 19.8, 20, 16)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (33, 11, 16, N'Nidorino', N'Nidorino has a horn that is harder than a diamond. If it senses a hostile presence, all the barbs on its back bristle up at once, and it challenges the foe with all its might.', 43, 35, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (34, 11, 8, N'Nidoking', N'Nidoking''s thick tail packs enormously destructive power. With one swing, it can topple a metal transmission tower. Once this Pokémon goes on a rampage, there is no stopping it.', 136.69, 55, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (35, 10, 16, N'Clefairy', N'On every night of a full moon, groups of this Pokémon come out to play. When dawn arrives, the tired Clefairy return to their quiet mountain retreats and go to sleep nestled up against each other.', 16, 24, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (36, 10, 16, N'Clefable', N'Clefable moves by skipping lightly as if it were flying using its wings. Its bouncy step lets it even walk on water. It is known to take strolls on lakes on quiet, moonlit nights.', 88.2, 51, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (37, 5, 16, N'Vulpix', N'At the time of its birth, Vulpix has one white tail. The tail separates into six if this Pokémon receives plenty of love from its Trainer. The six tails become magnificently curled.', 21.8, 24, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (38, 5, 16, N'Ninetales', N'Ninetales casts a sinister light from its bright red eyes to gain total control over its foe''s mind. This Pokémon is said to live for a thousand years.', 43.899, 43, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (39, 10, 16, N'Jigglypuff', N'Jigglypuff''s vocal cords can freely adjust the wavelength of its voice. This Pokémon uses this ability to sing at precisely the right wavelength to make its foes most drowsy.', 12.099, 20, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (40, 10, 16, N'Wigglytuff', N'Wigglytuff has large, saucerlike eyes. The surfaces of its eyes are always covered with a thin layer of tears. If any dust gets in this Pokémon''s eyes, it is quickly washed away.', 26, 39, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (41, 11, 15, N'Zubat', N'Zubat remains quietly unmoving in a dark spot during the bright daylight hours. It does so because prolonged exposure to the sun causes its body to become slightly burned.', 16, 31, 22)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (42, 11, 15, N'Golbat', N'Golbat loves to drink the blood of living things. It is particularly active in the pitch black of night. This Pokémon flits around in the night skies, seeking fresh blood.', 121.299, 63, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (43, 7, 11, N'Oddish', N'During the daytime, Oddish buries itself in soil to absorb nutrients from the ground using its entire body. The more fertile the soil, the glossier its leaves become.', 11.9, 20, 21)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (44, 7, 11, N'Gloom', N'Gloom releases a foul fragrance from the pistil of its flower. When faced with danger, the stench worsens. If this Pokémon is feeling calm and secure, it does not release its usual stinky aroma.', 19, 31, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (45, 7, 11, N'Vileplume', N'Vileplume''s toxic pollen triggers atrocious allergy attacks. That''s why it is advisable never to approach any attractive flowers in a jungle, however pretty they may be.', 41, 47, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (46, 1, 7, N'Paras', N'Paras has parasitic mushrooms growing on its back called tochukaso. They grow large by drawing nutrients from this Bug Pokémon host. They are highly valued as a medicine for extending life.', 11.9, 12, 24)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (47, 1, 7, N'Parasect', N'Parasect is known to infest large trees en masse and drain nutrients from the lower trunk and roots. When an infested tree dies, they move onto another tree all at once.', 65, 39, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (48, 1, 11, N'Venonat', N'Venonat is said to have evolved with a coat of thin, stiff hair that covers its entire body for protection. It possesses large eyes that never fail to spot even minuscule prey.', 66.099, 39, 31)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (49, 1, 11, N'Venomoth', N'Venomoth is nocturnal—it is a Pokémon that only becomes active at night. Its favorite prey are small insects that gather around streetlights, attracted by the light in the darkness.', 27.6, 59, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (50, 8, 16, N'Diglett', N'Diglett are raised in most farms. The reason is simple— wherever this Pokémon burrows, the soil is left perfectly tilled for planting crops. This soil is made ideal for growing delicious vegetables.', 1.8, 8, 26)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (51, 8, 16, N'Dugtrio', N'Dugtrio are actually triplets that emerged from one body. As a result, each triplet thinks exactly like the other two triplets. They work cooperatively to burrow endlessly.', 73.4, 28, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (52, 10, 16, N'Meowth', N'Meowth withdraws its sharp claws into its paws to slinkily sneak about without making any incriminating footsteps. For some reason, this Pokémon loves shiny coins that glitter with light.', 9.3, 16, 28)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (53, 10, 16, N'Persian', N'Persian has six bold whiskers that give it a look of toughness. The whiskers sense air movements to determine what is in the Pokémon''s surrounding vicinity. It becomes docile if grabbed by the whiskers.', 70.5, 39, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (54, 14, 16, N'Psyduck', N'Psyduck uses a mysterious power. When it does so, this Pokémon generates brain waves that are supposedly only seen in sleepers. This discovery spurred controversy among scholars.', 43.2, 31, 33)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (55, 14, 16, N'Golduck', N'The webbed flippers on its forelegs and hind legs and the streamlined body of Golduck give it frightening speed. This Pokémon is definitely much faster than even the most athletic swimmer.', 168.9, 67, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (56, 4, 16, N'Mankey', N'When Mankey starts shaking and its nasal breathing turns rough, it''s a sure sign that it is becoming angry. However, because it goes into a towering rage almost instantly, it is impossible for anyone to flee its wrath.', 61.7, 20, 28)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (57, 4, 16, N'Primeape', N'When Primeape becomes furious, its blood circulation is boosted. In turn, its muscles are made even stronger. However, it also becomes much less intelligent at the same time.', 70.5, 39, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (58, 5, 16, N'Growlithe', N'Growlithe has a superb sense of smell. Once it smells anything, this Pokémon won''t forget the scent, no matter what. It uses its advanced olfactory sense to determine the emotions of other living things.', 41.899, 28, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (59, 5, 16, N'Arcanine', N'Arcanine is known for its high speed. It is said to be capable of running over 6,200 miles in a single day and night. The fire that blazes wildly within this Pokémon''s body is its source of power.', 341.699, 75, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (60, 14, 16, N'Poliwag', N'Poliwag has a very thin skin. It is possible to see the Pokémon''s spiral innards right through the skin. Despite its thinness, however, the skin is also very flexible. Even sharp fangs bounce right off it.', 27.3, 24, 25)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (61, 14, 16, N'Poliwhirl', N'The surface of Poliwhirl''s body is always wet and slick with a slimy fluid. Because of this slippery covering, it can easily slip and slide out of the clutches of any enemy in battle.', 44.1, 39, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (62, 14, 4, N'Poliwrath', N'Poliwrath''s highly developed, brawny muscles never grow fatigued, however much it exercises. It is so tirelessly strong, this Pokémon can swim back and forth across the ocean without effort.', 119, 51, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (63, 12, 16, N'Abra', N'Abra sleeps for eighteen hours a day. However, it can sense the presence of foes even while it is sleeping. In such a situation, this Pokémon immediately teleports to safety.', 43, 35, 16)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (64, 12, 16, N'Kadabra', N'Kadabra emits a peculiar alpha wave if it develops a headache. Only those people with a particularly strong psyche can hope to become a Trainer of this Pokémon.', 124.599, 51, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (65, 12, 16, N'Alakazam', N'Alakazam''s brain continually grows, making its head far too heavy to support with its neck. This Pokémon holds its head up using its psychokinetic power instead.', 105.799, 59, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (66, 4, 16, N'Machop', N'Machop''s muscles are special—they never get sore no matter how much they are used in exercise. This Pokémon has sufficient power to hurl a hundred adult humans.', 43, 31, 28)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (67, 4, 16, N'Machoke', N'Machoke''s thoroughly toned muscles possess the hardness of steel. This Pokémon has so much strength, it can easily hold aloft a sumo wrestler on just one finger.', 155.4, 59, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (68, 4, 16, N'Machamp', N'Machamp has the power to hurl anything aside. However, trying to do any work requiring care and dexterity causes its arms to get tangled. This Pokémon tends to leap into action before it thinks.', 286.6, 63, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (69, 7, 11, N'Bellsprout', N'Bellsprout''s thin and flexible body lets it bend and sway to avoid any attack, however strong it may be. From its mouth, this Pokémon spits a corrosive fluid that melts even iron.', 8.8, 28, 21)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (70, 7, 11, N'Weepinbell', N'Weepinbell has a large hook on its rear end. At night, the Pokémon hooks on to a tree branch and goes to sleep. If it moves around in its sleep, it may wake up to find itself on the ground.', 14.099, 39, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (71, 7, 11, N'Victreebel', N'Victreebel has a long vine that extends from its head. This vine is waved and flicked about as if it were an animal to attract prey. When an unsuspecting prey draws near, this Pokémon swallows it whole.', 34.2, 67, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (72, 14, 11, N'Tentacool', N'Tentacool''s body is largely composed of water. If it is removed from the sea, it dries up like parchment. If this Pokémon happens to become dehydrated, put it back into the sea.', 100.299, 35, 30)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (73, 14, 11, N'Tentacruel', N'Tentacruel has large red orbs on its head. The orbs glow before lashing the vicinity with a harsh ultrasonic blast. This Pokémon''s outburst creates rough waves around it.', 121.299, 63, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (74, 13, 8, N'Geodude', N'The longer a Geodude lives, the more its edges are chipped and worn away, making it more rounded in appearance. However, this Pokémon''s heart will remain hard, craggy, and rough always.', 44.1, 16, 25)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (75, 13, 8, N'Graveler', N'Graveler grows by feeding on rocks. Apparently, it prefers to eat rocks that are covered in moss. This Pokémon eats its way through a ton of rocks on a daily basis.', 231.5, 39, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (76, 13, 8, N'Golem', N'Golem live up on mountains. If there is a large earthquake, these Pokémon will come rolling down off the mountains en masse to the foothills below.', 661.399, 55, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (77, 5, 16, N'Ponyta', N'Ponyta is very weak at birth. It can barely stand up. This Pokémon becomes stronger by stumbling and falling to keep up with its parent.', 66.099, 39, 40)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (78, 5, 16, N'Rapidash', N'Rapidash usually can be seen casually cantering in the fields and plains. However, when this Pokémon turns serious, its fiery manes flare and blaze as it gallops its way up to 150 mph.', 209.4, 67, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (79, 14, 12, N'Slowpoke', N'Slowpoke uses its tail to catch prey by dipping it in water at the side of a river. However, this Pokémon often forgets what it''s doing and often spends entire days just loafing at water''s edge.', 79.4, 47, 37)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (80, 14, 12, N'Slowbro', N'Slowbro''s tail has a Shellder firmly attached with a bite. As a result, the tail can''t be used for fishing anymore. This causes Slowbro to grudgingly swim and catch prey instead.', 173.099, 63, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (81, 3, 16, N'Magnemite', N'Magnemite attaches itself to power lines to feed on electricity. If your house has a power outage, check your circuit breakers. You may find a large number of this Pokémon clinging to the breaker box.', 13.199, 12, 30)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (82, 3, 16, N'Magneton', N'Magneton emits a powerful magnetic force that is fatal to mechanical devices. As a result, large cities sound sirens to warn citizens of large-scale outbreaks of this Pokémon.', 132.3, 39, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (83, 10, 15, N'Farfetch''d', N'Farfetch''d is always seen with a stalk from a plant of some sort. Apparently, there are good stalks and bad stalks. This Pokémon has been known to fight with others over stalks.', 33.1, 31, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (84, 10, 15, N'Doduo', N'Doduo''s two heads never sleep at the same time. Its two heads take turns sleeping, so one head can always keep watch for enemies while the other one sleeps.', 86.4, 55, 31)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (85, 10, 15, N'Dodrio', N'Watch out if Dodrio''s three heads are looking in three separate directions. It''s a sure sign that it is on its guard. Don''t go near this Pokémon if it''s being wary—it may decide to peck you.', 187.8, 71, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (86, 14, 16, N'Seel', N'Seel hunts for prey in the frigid sea underneath sheets of ice. When it needs to breathe, it punches a hole through the ice with the sharply protruding section of its head.', 198.4, 43, 34)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (87, 14, 9, N'Dewgong', N'Dewgong loves to snooze on bitterly cold ice. The sight of this Pokémon sleeping on a glacier was mistakenly thought to be a mermaid by a mariner long ago.', 264.6, 67, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (88, 11, 16, N'Grimer', N'Grimer''s sludgy and rubbery body can be forced through any opening, however small it may be. This Pokémon enters sewer pipes to drink filthy wastewater.', 66.099, 35, 38)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (89, 11, 16, N'Muk', N'From Muk''s body seeps a foul fluid that gives off a nose-bendingly horrible stench. Just one drop of this Pokémon''s body fluid can turn a pool stagnant and rancid.', 66.099, 47, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (90, 14, 16, N'Shellder', N'At night, this Pokémon uses its broad tongue to burrow a hole in the seafloor sand and then sleep in it. While it is sleeping, Shellder closes its shell, but leaves its tongue hanging out.', 8.8, 12, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (91, 14, 9, N'Cloyster', N'Cloyster is capable of swimming in the sea. It does so by swallowing water, then jetting it out toward the rear. This Pokémon shoots spikes from its shell using the same system.', 292.1, 59, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (92, 6, 11, N'Gastly', N'Gastly is largely composed of gaseous matter. When exposed to a strong wind, the gaseous body quickly dwindles away. Groups of this Pokémon cluster under the eaves of houses to escape the ravages of wind.', 0.2, 51, 25)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (93, 6, 11, N'Haunter', N'Haunter is a dangerous Pokémon. If one beckons you while floating in darkness, you must never approach it. This Pokémon will try to lick you with its tongue and steal your life away.', 0.2, 63, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (94, 6, 11, N'Gengar', N'Sometimes, on a dark night, your shadow thrown by a streetlight will suddenly and startlingly overtake you. It is actually a Gengar running past you, pretending to be your shadow.', 89.299, 59, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (95, 13, 8, N'Onix', N'Onix has a magnet in its brain. It acts as a compass so that this Pokémon does not lose direction while it is tunneling. As it grows older, its body becomes increasingly rounder and smoother.', 463, 346, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (96, 12, 16, N'Drowzee', N'If your nose becomes itchy while you are sleeping, it''s a sure sign that one of these Pokémon is standing above your pillow and trying to eat your dream through your nostrils.', 71.4, 39, 26)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (97, 12, 16, N'Hypno', N'Hypno holds a pendulum in its hand. The arcing movement and glitter of the pendulum lull the foe into a deep state of hypnosis. While this Pokémon searches for prey, it polishes the pendulum.', 166.699, 63, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (98, 14, 16, N'Krabby', N'Krabby live on beaches, burrowed inside holes dug into the sand. On sandy beaches with little in the way of food, these Pokémon can be seen squabbling with each other over territory.', 14.3, 16, 28)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (99, 14, 16, N'Kingler', N'Kingler has an enormous, oversized claw. It waves this huge claw in the air to communicate with others. However, because the claw is so heavy, the Pokémon quickly tires.', 132.3, 51, 0)
GO
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (100, 3, 16, N'Voltorb', N'Voltorb was first sighted at a company that manufactures Poké Balls. The link between that sighting and the fact that this Pokémon looks very similar to a Poké Ball remains a mystery.', 22.899, 20, 30)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (101, 3, 16, N'Electrode', N'Electrode eats electricity in the atmosphere. On days when lightning strikes, you can see this Pokémon exploding all over the place from eating too much electricity.', 146.8, 47, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (102, 7, 12, N'Exeggcute', N'This Pokémon consists of six eggs that form a closely knit cluster. The six eggs attract each other and spin around. When cracks increasingly appear on the eggs, Exeggcute is close to evolution.', 5, 16, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (103, 7, 12, N'Exeggutor', N'Exeggutor originally came from the tropics. Its heads steadily grow larger from exposure to strong sunlight. It is said that when the heads fall off, they group together to form Exeggcute.', 264.6, 79, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (104, 8, 16, N'Cubone', N'Cubone pines for the mother it will never see again. Seeing a likeness of its mother in the full moon, it cries. The stains on the skull the Pokémon wears are made by the tears it sheds.', 14.3, 16, 28)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (105, 8, 16, N'Marowak', N'Marowak is the evolved form of a Cubone that has overcome its sadness at the loss of its mother and grown tough. This Pokémon''s tempered and hardened spirit is not easily broken.', 99.2, 39, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (106, 4, 16, N'Hitmonlee', N'Hitmonlee''s legs freely contract and stretch. Using these springlike legs, it bowls over foes with devastating kicks. After battle, it rubs down its legs and loosens the muscles to overcome fatigue.', 109.799, 59, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (107, 4, 16, N'Hitmonchan', N'Hitmonchan is said to possess the spirit of a boxer who had been working toward a world championship. This Pokémon has an indomitable spirit and will never give up in the face of adversity.', 110.7, 55, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (108, 10, 16, N'Lickitung', N'Whenever Lickitung comes across something new, it will unfailingly give it a lick. It does so because it memorizes things by texture and by taste. It is somewhat put off by sour things.', 144.4, 47, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (109, 11, 16, N'Koffing', N'If Koffing becomes agitated, it raises the toxicity of its internal gases and jets them out from all over its body. This Pokémon may also overinflate its round body, then explode.', 2.2, 24, 35)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (110, 11, 16, N'Weezing', N'Weezing loves the gases given off by rotted kitchen garbage. This Pokémon will find a dirty, unkempt house and make it its home. At night, when the people in the house are asleep, it will go through the trash.', 20.899, 47, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (111, 8, 13, N'Rhyhorn', N'Rhyhorn runs in a straight line, smashing everything in its path. It is not bothered even if it rushes headlong into a block of steel. This Pokémon may feel some pain from the collision the next day, however.', 253.5, 39, 42)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (112, 8, 13, N'Rhydon', N'Rhydon''s horn can crush even uncut diamonds. One sweeping blow of its tail can topple a building. This Pokémon''s hide is extremely tough. Even direct cannon hits don''t leave a scratch.', 264.6, 75, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (113, 10, 16, N'Chansey', N'Chansey lays nutritionally excellent eggs on an everyday basis. The eggs are so delicious, they are easily and eagerly devoured by even those people who have lost their appetite.', 76.299, 43, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (114, 7, 16, N'Tangela', N'Tangela''s vines snap off easily if they are grabbed. This happens without pain, allowing it to make a quick getaway. The lost vines are replaced by newly grown vines the very next day.', 77.2, 39, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (115, 10, 16, N'Kangaskhan', N'If you come across a young Kangaskhan playing by itself, you must never disturb it or attempt to catch it. The baby Pokémon''s parent is sure to be in the area, and it will become violently enraged at you.', 176.4, 75, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (116, 14, 16, N'Horsea', N'Horsea eats small insects and moss off of rocks. If the ocean current turns fast, this Pokémon anchors itself by wrapping its tail around rocks or coral to prevent being washed away.', 17.6, 16, 32)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (117, 14, 16, N'Seadra', N'Seadra sleeps after wriggling itself between the branches of coral. Those trying to harvest coral are occasionally stung by this Pokémon''s poison barbs if they fail to notice it.', 55.1, 47, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (118, 14, 16, N'Goldeen', N'Goldeen is a very beautiful Pokémon with fins that billow elegantly in water. However, don''t let your guard down around this Pokémon—it could ram you powerfully with its horn.', 33.1, 24, 33)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (119, 14, 16, N'Seaking', N'In the autumn, Seaking males can be seen performing courtship dances in riverbeds to woo females. During this season, this Pokémon''s body coloration is at its most beautiful.', 86, 51, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (120, 14, 16, N'Staryu', N'Staryu''s center section has an organ called the core that shines bright red. If you go to a beach toward the end of summer, the glowing cores of these Pokémon look like the stars in the sky.', 76.099, 31, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (121, 14, 12, N'Starmie', N'Starmie''s center section—the core—glows brightly in seven colors. Because of its luminous nature, this Pokémon has been given the nickname “the gem of the sea."', 176.4, 43, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (122, 12, 16, N'Mr.Mime', N'Mr. Mime is a master of pantomime. Its gestures and motions convince watchers that something unseeable actually exists. Once the watchers are convinced, the unseeable thing exists as if it were real.', 120.099, 51, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (123, 1, 15, N'Scyther', N'Scyther is blindingly fast. Its blazing speed enhances the effectiveness of the twin scythes on its forearms. This Pokémon''s scythes are so effective, they can slice through thick logs in one wicked stroke.', 123.5, 59, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (124, 9, 12, N'Jynx', N'Jynx walks rhythmically, swaying and shaking its hips as if it were dancing. Its motions are so bouncingly alluring, people seeing it are compelled to shake their hips without giving any thought to what they are doing.', 89.5, 31, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (125, 3, 16, N'Electabuzz', N'When a storm arrives, gangs of this Pokémon compete with each other to scale heights that are likely to be stricken by lightning bolts. Some towns use Electabuzz in place of lightning rods.', 66.099, 43, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (126, 5, 16, N'Magmar', N'In battle, Magmar blows out intensely hot flames from all over its body to intimidate its opponent. This Pokémon''s fiery bursts create heat waves that ignite grass and trees in its surroundings.', 98.099, 51, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (127, 1, 16, N'Pinsir', N'Pinsir is astoundingly strong. It can grip a foe weighing twice its weight in its horns and easily lift it. This Pokémon''s movements turn sluggish in cold places.', 121.299, 59, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (128, 10, 16, N'Tauros', N'This Pokémon is not satisfied unless it is rampaging at all times. If there is no opponent for Tauros to battle, it will charge at thick trees and knock them down to calm itself.', 194.9, 55, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (129, 14, 16, N'Magikarp', N'Magikarp is a pathetic excuse for a Pokémon that is only capable of flopping and splashing. This behavior prompted scientists to undertake research into it.', 22, 35, 20)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (130, 14, 15, N'Gyarados', N'When Magikarp evolves into Gyarados, its brain cells undergo a structural transformation. It is said that this transformation is to blame for this Pokémon''s wildly violent nature.', 518.1, 256, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (131, 14, 9, N'Lapras', N'People have driven Lapras almost to the point of extinction. In the evenings, this Pokémon is said to sing plaintively as it seeks what few others of its kind still remain.', 485, 98, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (132, 10, 16, N'Ditto', N'Ditto rearranges its cell structure to transform itself into other shapes. However, if it tries to transform itself into something by relying on its memory, this Pokémon manages to get details wrong.', 8.8, 12, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (133, 10, 16, N'Eevee', N'Eevee has an unstable genetic makeup that suddenly mutates due to the environment in which it lives. Radiation from various stones causes this Pokémon to evolve.', 14.3, 12, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (134, 14, 16, N'Vaporeon', N'Vaporeon underwent a spontaneous mutation and grew fins and gills that allow it to live underwater. This Pokémon has the ability to freely control water.', 63.899, 39, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (135, 3, 16, N'Jolteon', N'Jolteon''s cells generate a low level of electricity. This power is amplified by the static electricity of its fur, enabling the Pokémon to drop thunderbolts. The bristling fur is made of electrically charged needles.', 54, 31, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (136, 5, 16, N'Flareon', N'Flareon''s fluffy fur has a functional purpose—it releases heat into the air so that its body does not get excessively hot. This Pokémon''s body temperature can rise to a maximum of 1,650 degrees Fahrenheit.', 55.1, 35, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (137, 10, 16, N'Porygon', N'Porygon is capable of reverting itself entirely back to program data and entering cyberspace. This Pokémon is copy protected so it cannot be duplicated by copying.', 80.5, 31, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (138, 13, 14, N'Omanyte', N'Omanyte is one of the ancient and long-since-extinct Pokémon that have been regenerated from fossils by people. If attacked by an enemy, it withdraws itself inside its hard shell.', 16, 16, 40)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (139, 13, 14, N'Omastar', N'Omastar uses its tentacles to capture its prey. It is believed to have become extinct because its shell grew too large and heavy, causing its movements to become too slow and ponderous.', 77.2, 39, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (140, 13, 14, N'Kabuto', N'Kabuto is a Pokémon that has been regenerated from a fossil. However, in extremely rare cases, living examples have been discovered. The Pokémon has not changed at all for 300 million years.', 25.399, 20, 40)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (141, 13, 14, N'Kabutops', N'Kabutops swam underwater to hunt for its prey in ancient times. The Pokémon was apparently evolving from being a water dweller to living on land as evident from the beginnings of change in its gills and legs.', 89.299, 51, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (142, 13, 15, N'Aerodactyl', N'Aerodactyl is a Pokémon from the age of dinosaurs. It was regenerated from genetic material extracted from amber. It is imagined to have been the king of the skies in ancient times.', 130.099, 71, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (143, 10, 16, N'Snorlax', N'Snorlax''s typical day consists of nothing more than eating and sleeping. It is such a docile Pokémon that there are children who use its expansive belly as a place to play.', 1014.1, 83, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (144, 9, 15, N'Articuno', N'Articuno is a legendary bird Pokémon that can control ice. The flapping of its wings chills the air. As a result, it is said that when this Pokémon flies, snow will fall.', 122.099, 67, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (145, 3, 15, N'Zapdos', N'Zapdos is a legendary bird Pokémon that has the ability to control electricity. It usually lives in thunderclouds. The Pokémon gains power if it is stricken by lightning bolts.', 116, 63, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (146, 5, 15, N'Moltres', N'Moltres is a legendary bird Pokémon that has the ability to control fire. If this Pokémon is injured, it is said to dip its body in the molten magma of a volcano to burn and heal itself.', 132.3, 79, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (147, 2, 16, N'Dratini', N'Dratini continually molts and sloughs off its old skin. It does so because the life energy within its body steadily builds to reach uncontrollable levels.', 7.299, 71, 30)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (148, 2, 16, N'Dragonair', N'Dragonair stores an enormous amount of energy inside its body. It is said to alter weather conditions in its vicinity by discharging energy from the crystals on its neck and tail.', 36.399, 157, 55)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (149, 2, 15, N'Dragonite', N'Dragonite is capable of circling the globe in just 16 hours. It is a kindhearted Pokémon that leads lost and foundering ships in a storm to the safety of land.', 463, 87, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (150, 12, 16, N'Mewtwo', N'Mewtwo is a Pokémon that was created by genetic manipulation. However, even though the scientific power of humans created this Pokémon''s body, they failed to endow Mewtwo with a compassionate heart.', 269, 79, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (151, 12, 16, N'Mew', N'Mew is said to possess the genetic composition of all Pokémon. It is capable of making itself invisible at will, so it entirely avoids notice even if it approaches people.', 8.8, 16, 0)
SET IDENTITY_INSERT [dbo].[Pokemon] OFF
SET IDENTITY_INSERT [dbo].[Types_] ON 

INSERT [dbo].[Types_] ([ID], [Name]) VALUES (1, N'Bug')
INSERT [dbo].[Types_] ([ID], [Name]) VALUES (2, N'Dragon')
INSERT [dbo].[Types_] ([ID], [Name]) VALUES (3, N'Electric')
INSERT [dbo].[Types_] ([ID], [Name]) VALUES (4, N'Fighting')
INSERT [dbo].[Types_] ([ID], [Name]) VALUES (5, N'Fire')
INSERT [dbo].[Types_] ([ID], [Name]) VALUES (6, N'Ghost')
INSERT [dbo].[Types_] ([ID], [Name]) VALUES (7, N'Grass')
INSERT [dbo].[Types_] ([ID], [Name]) VALUES (8, N'Ground')
INSERT [dbo].[Types_] ([ID], [Name]) VALUES (9, N'Ice')
INSERT [dbo].[Types_] ([ID], [Name]) VALUES (10, N'Normal')
INSERT [dbo].[Types_] ([ID], [Name]) VALUES (11, N'Poison')
INSERT [dbo].[Types_] ([ID], [Name]) VALUES (12, N'Psychic')
INSERT [dbo].[Types_] ([ID], [Name]) VALUES (13, N'Rock')
INSERT [dbo].[Types_] ([ID], [Name]) VALUES (14, N'Water')
INSERT [dbo].[Types_] ([ID], [Name]) VALUES (15, N'Flying')
INSERT [dbo].[Types_] ([ID], [Name]) VALUES (16, N'None')
SET IDENTITY_INSERT [dbo].[Types_] OFF
ALTER TABLE [dbo].[Pokemon]  WITH CHECK ADD  CONSTRAINT [FK_Pokemon_Types_] FOREIGN KEY([Type1_ID])
REFERENCES [dbo].[Types_] ([ID])
GO
ALTER TABLE [dbo].[Pokemon] CHECK CONSTRAINT [FK_Pokemon_Types_]
GO
ALTER TABLE [dbo].[Pokemon]  WITH CHECK ADD  CONSTRAINT [FK_Pokemon_Types_1] FOREIGN KEY([Type2_ID])
REFERENCES [dbo].[Types_] ([ID])
GO
ALTER TABLE [dbo].[Pokemon] CHECK CONSTRAINT [FK_Pokemon_Types_1]
GO
/****** Object:  StoredProcedure [dbo].[AddLog]    Script Date: 06.10.2023 16:15:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddLog]
@name1 nvarchar(255),
@winstate nvarchar(255),
@name2 nvarchar(255),
@pokeID int
AS
INSERT INTO BattleLogs(Player, WinState, PlayerOther, PokemonID, LogDate)
VALUES(@name1, @winstate, @name2, @pokeID, GETDATE())
GO
/****** Object:  StoredProcedure [dbo].[AddMove]    Script Date: 06.10.2023 16:15:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddMove]
@name nvarchar(255),
@typeid int,
@power int,
@acc int
AS
INSERT INTO Moves(Name, TypeID, Power, Accuracy)
VALUES(@name, @typeid, @power, @acc)
GO
/****** Object:  StoredProcedure [dbo].[AddMoveToPokemon]    Script Date: 06.10.2023 16:15:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddMoveToPokemon]
@moveid int,
@pokemonid int
AS
INSERT INTO MovesPokemon(MoveID, PokemonID)
VALUES(@moveid, @pokemonid)
GO
/****** Object:  StoredProcedure [dbo].[AddPokemon]    Script Date: 06.10.2023 16:15:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddPokemon]
@type1id INT,
@type2id INT,
@name NVARCHAR(255),
@desc NVARCHAR(255),
@w float,
@h float,
@level int
AS
INSERT INTO Pokemon(Type1_ID, Type2_ID, Name, Description, Weight, Height, EvolveLevel)
VALUES(@type1id, @type2id, @name, @desc, @w, @h, @level)
GO
/****** Object:  StoredProcedure [dbo].[GetAllMoves]    Script Date: 06.10.2023 16:15:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllMoves]
AS
SELECT * FROM Moves
GO
/****** Object:  StoredProcedure [dbo].[GetLogs]    Script Date: 06.10.2023 16:15:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLogs]
AS
SELECT * FROM BattleLogs
GO
/****** Object:  StoredProcedure [dbo].[GetPokemonList]    Script Date: 06.10.2023 16:15:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPokemonList]
AS
SELECT p.ID, p.Name, t1.Name AS Type1, t2.Name AS Type2, p.Weight, p.Height, p.EvolveLevel, p.Description
FROM Pokemon p
INNER JOIN Types_ t1 ON p.Type1_ID = t1.ID
INNER JOIN Types_ t2 ON p.Type2_ID = t2.ID
GO
/****** Object:  StoredProcedure [dbo].[GetPokemonMoves]    Script Date: 06.10.2023 16:15:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPokemonMoves]
@id INT
AS
SELECT Moves.Name, Moves.Power, Moves.Accuracy, Types_.Name FROM MovesPokemon
INNER JOIN Moves
ON MovesPokemon.MoveID = Moves.ID
INNER JOIN Types_
ON Moves.TypeID = Types_.ID
WHERE PokemonID = @id
GO
/****** Object:  StoredProcedure [dbo].[GetTypeIDByName]    Script Date: 06.10.2023 16:15:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTypeIDByName]
@name NVARCHAR(255)
AS
SELECT ID FROM Types_
WHERE Name = @name
GO
/****** Object:  StoredProcedure [dbo].[GetTypes]    Script Date: 06.10.2023 16:15:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTypes]
AS
SELECT Name FROM Types_
GO
USE [master]
GO
ALTER DATABASE [PokemonDB] SET  READ_WRITE 
GO
