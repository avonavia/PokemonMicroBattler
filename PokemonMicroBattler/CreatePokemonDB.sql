USE [master]
GO
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
/****** Object:  Table [dbo].[BattleLogs]    Script Date: 10.09.2023 14:47:43 ******/
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
	[Weight] [nvarchar](255) NULL,
	[Height] [float] NULL,
	[EvolveLevel] [int] NULL,
 CONSTRAINT [PK_Pokemon] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
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
SET IDENTITY_INSERT [dbo].[BattleLogs] OFF
SET IDENTITY_INSERT [dbo].[Moves] ON 

INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (12, N'Absorb', 7, 20, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (13, N'Acid', 11, 40, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (14, N'Aurora Beam', 9, 65, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (15, N'Barrage', 10, 15, 85)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (16, N'Bind', 10, 15, 85)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (17, N'Blizzard', 9, 110, 70)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (18, N'Bite', 10, 60, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (19, N'Body Slam', 10, 85, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (20, N'Bone Club', 8, 65, 85)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (21, N'Boomerang', 8, 50, 90)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (22, N'Bubble', 14, 40, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (23, N'Bubble Beam', 14, 65, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (24, N'Clamp', 14, 35, 85)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (25, N'Comet Punch', 10, 18, 85)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (26, N'Confusion', 12, 50, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (27, N'Constrict', 10, 10, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (28, N'Crabhammer', 14, 100, 90)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (29, N'Cut', 10, 50, 95)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (30, N'Dig', 8, 80, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (31, N'Dizzy Punch', 10, 70, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (32, N'Double Kick', 4, 30, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (33, N'Double Slap', 10, 15, 85)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (34, N'Double Edge', 10, 120, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (35, N'Dream Eater', 12, 100, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (36, N'Drill Peck', 15, 80, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (37, N'Earthquake', 8, 100, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (38, N'Egg Bomb', 10, 100, 75)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (39, N'Ember', 5, 40, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (40, N'Explosion', 10, 250, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (41, N'Fire Blast', 5, 110, 85)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (42, N'Fire Punch', 5, 75, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (43, N'Fire Spin', 5, 35, 85)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (44, N'Flamethrower', 5, 90, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (45, N'Fly', 15, 90, 95)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (46, N'Fury Attack', 10, 15, 85)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (47, N'Fury Swipes', 10, 18, 80)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (48, N'Gust', 15, 40, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (49, N'Headbutt', 10, 70, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (50, N'High Jump Kick', 4, 130, 90)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (51, N'Horn Attack', 10, 65, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (52, N'Hydro Pump', 14, 110, 80)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (53, N'Hyper Beam', 10, 150, 90)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (54, N'Hyper Fang', 10, 80, 90)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (55, N'Ice Beam', 9, 90, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (56, N'Ice Punch', 9, 75, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (57, N'Jump Kick', 4, 100, 95)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (58, N'Karate Chop', 4, 50, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (59, N'Leech Life', 1, 20, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (60, N'Lick', 6, 30, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (61, N'Mega Drain', 7, 40, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (62, N'Mega Kick', 10, 120, 75)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (63, N'Mega Punch', 10, 80, 85)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (64, N'Pay Day', 10, 40, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (65, N'Peck', 15, 35, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (66, N'Pin Missile', 1, 25, 95)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (67, N'Petal Dance', 7, 120, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (68, N'Poison Sting', 11, 15, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (69, N'Pound', 10, 40, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (70, N'Psybeam', 12, 65, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (71, N'Psychic', 12, 90, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (72, N'Quick Attack', 10, 40, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (73, N'Rage', 10, 20, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (74, N'Razor Leaf', 7, 55, 95)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (75, N'Razor Wind', 10, 80, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (76, N'Rock Slide', 13, 75, 90)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (77, N'Rock Throw', 13, 50, 90)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (78, N'Rolling Kick', 4, 60, 85)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (79, N'Scratch', 10, 40, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (80, N'Self-Destruct', 10, 200, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (81, N'Skull Bash', 10, 130, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (82, N'Sky Attack', 15, 140, 90)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (83, N'Slam', 10, 80, 75)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (84, N'Slash', 10, 70, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (85, N'Sludge', 11, 65, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (86, N'Smog', 11, 30, 70)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (87, N'Solar Beam', 7, 120, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (88, N'Spike Cannon', 10, 20, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (89, N'Stomp', 10, 65, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (90, N'Strength', 10, 80, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (91, N'Struggle', 10, 50, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (92, N'Submission', 4, 80, 80)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (93, N'Surf', 14, 90, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (94, N'Swift', 10, 60, 90)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (95, N'Tackle', 10, 50, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (96, N'Take Down', 10, 90, 85)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (97, N'Thrash', 10, 120, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (98, N'Thunder', 3, 110, 70)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (99, N'Thunder Punch', 3, 75, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (100, N'Thunder Shock', 3, 40, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (101, N'Thunderbolt', 3, 90, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (102, N'Tri Attack', 10, 80, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (103, N'Twineedle', 1, 25, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (104, N'Vice Grip', 10, 55, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (105, N'Vine Whip', 7, 45, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (106, N'Water Gun', 14, 40, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (107, N'Waterfall', 14, 80, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (108, N'Wing Attack', 15, 60, 100)
INSERT [dbo].[Moves] ([ID], [Name], [TypeID], [Power], [Accuracy]) VALUES (109, N'Wrap', 10, 15, 90)
SET IDENTITY_INSERT [dbo].[Moves] OFF
GO
SET IDENTITY_INSERT [dbo].[MovesPokemon] ON 

INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (1, 95, 1)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (2, 105, 1)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (3, 74, 1)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (4, 87, 1)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (5, 95, 2)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (6, 105, 2)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (7, 74, 2)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (8, 87, 2)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (9, 11, 3)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (10, 13, 3)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (11, 25, 3)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (12, 74, 3)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (13, 79, 4)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (14, 39, 4)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (15, 73, 4)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (16, 44, 4)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (17, 79, 5)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (18, 39, 5)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (19, 73, 5)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (20, 84, 5)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (21, 43, 6)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (22, 44, 6)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (23, 84, 6)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (24, 73, 6)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (25, 95, 7)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (26, 22, 7)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (27, 18, 7)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (28, 81, 7)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (29, 81, 8)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (30, 52, 8)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (31, 18, 8)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (32, 22, 8)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (33, 52, 9)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (34, 81, 9)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (35, 18, 9)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (36, 106, 9)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (37, 95, 10)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (38, 95, 11)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (39, 95, 12)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (40, 70, 12)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (41, 68, 13)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (42, 68, 14)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (43, 66, 15)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (44, 73, 15)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (45, 46, 15)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (46, 68, 15)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (47, 48, 16)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (48, 72, 16)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (49, 108, 16)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (50, 48, 17)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (51, 108, 17)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (52, 48, 18)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (53, 72, 18)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (54, 108, 18)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (55, 95, 19)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (56, 72, 19)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (57, 54, 19)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (58, 54, 20)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (59, 72, 20)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (60, 95, 20)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (61, 65, 21)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (62, 46, 21)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (63, 36, 21)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (64, 65, 22)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (65, 46, 22)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (66, 36, 22)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (67, 109, 23)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (68, 68, 23)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (69, 18, 23)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (70, 13, 23)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (71, 109, 24)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (72, 68, 24)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (73, 18, 24)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (74, 13, 24)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (75, 100, 25)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (76, 72, 25)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (77, 98, 25)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (78, 98, 26)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (79, 100, 26)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (80, 79, 27)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (81, 84, 27)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (82, 47, 27)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (83, 84, 28)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (84, 68, 28)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (85, 46, 28)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (86, 95, 29)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (87, 68, 29)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (88, 18, 29)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (89, 47, 29)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (90, 95, 30)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (91, 79, 30)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (92, 18, 30)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (93, 47, 30)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (94, 95, 31)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (95, 79, 31)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (96, 68, 31)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (97, 19, 31)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (98, 95, 32)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (99, 51, 32)
GO
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (100, 68, 32)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (101, 46, 32)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (102, 95, 33)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (103, 51, 33)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (104, 68, 33)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (105, 46, 33)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (106, 95, 34)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (107, 51, 34)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (108, 68, 34)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (109, 97, 34)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (110, 69, 35)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (111, 33, 35)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (112, 69, 36)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (113, 33, 36)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (114, 39, 37)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (115, 72, 37)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (116, 44, 37)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (117, 43, 37)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (118, 39, 38)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (119, 72, 38)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (120, 44, 38)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (121, 43, 38)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (122, 33, 39)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (123, 34, 39)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (124, 34, 40)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (125, 33, 40)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (126, 59, 41)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (127, 18, 41)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (128, 108, 41)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (129, 59, 42)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (130, 18, 42)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (131, 108, 42)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (132, 12, 43)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (133, 13, 43)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (134, 87, 43)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (135, 12, 44)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (136, 13, 44)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (137, 87, 44)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (138, 87, 45)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (139, 13, 45)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (140, 12, 45)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (141, 79, 46)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (142, 59, 46)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (143, 84, 46)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (144, 59, 47)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (145, 84, 47)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (146, 79, 47)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (147, 95, 48)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (148, 59, 48)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (149, 70, 48)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (150, 10, 48)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (151, 59, 49)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (152, 70, 49)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (153, 95, 49)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (154, 71, 49)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (155, 79, 50)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (156, 30, 50)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (157, 84, 50)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (158, 37, 50)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (159, 37, 51)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (160, 84, 51)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (161, 30, 51)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (162, 79, 51)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (163, 79, 52)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (164, 18, 52)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (165, 47, 52)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (166, 84, 52)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (167, 84, 53)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (168, 47, 53)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (169, 18, 53)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (170, 79, 53)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (171, 52, 54)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (172, 79, 54)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (173, 47, 54)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (174, 79, 55)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (175, 47, 55)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (176, 52, 55)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (177, 79, 56)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (178, 58, 56)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (179, 47, 56)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (180, 97, 56)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (181, 79, 57)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (182, 47, 57)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (183, 97, 57)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (184, 58, 57)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (185, 18, 58)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (186, 39, 58)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (187, 96, 58)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (188, 44, 58)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (189, 18, 59)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (190, 39, 59)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (191, 96, 59)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (192, 44, 59)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (193, 22, 60)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (194, 106, 60)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (195, 33, 60)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (196, 52, 60)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (197, 22, 61)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (198, 106, 61)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (199, 33, 61)
GO
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (200, 52, 61)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (201, 22, 62)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (202, 106, 62)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (203, 32, 62)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (204, 19, 62)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (205, 33, 63)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (206, 33, 64)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (207, 70, 64)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (208, 70, 65)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (209, 71, 65)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (210, 58, 66)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (211, 92, 66)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (212, 58, 67)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (213, 92, 67)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (214, 58, 68)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (215, 92, 68)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (216, 105, 69)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (217, 109, 69)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (218, 13, 69)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (219, 74, 69)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (220, 2, 70)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (221, 13, 70)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (222, 74, 70)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (223, 83, 70)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (224, 13, 71)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (225, 109, 71)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (226, 2, 71)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (227, 83, 71)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (228, 13, 72)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (229, 52, 72)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (230, 68, 72)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (231, 106, 73)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (232, 68, 73)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (233, 13, 73)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (234, 52, 73)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (235, 95, 74)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (236, 77, 74)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (237, 37, 74)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (238, 40, 74)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (239, 95, 75)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (240, 80, 75)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (241, 37, 75)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (242, 40, 75)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (243, 95, 76)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (244, 37, 76)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (245, 40, 76)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (246, 77, 76)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (247, 39, 77)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (248, 89, 77)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (249, 41, 77)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (250, 96, 77)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (251, 39, 78)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (252, 43, 78)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (253, 96, 78)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (254, 89, 78)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (255, 26, 79)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (256, 49, 79)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (257, 106, 79)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (258, 71, 79)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (259, 26, 80)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (260, 49, 80)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (261, 106, 80)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (262, 71, 80)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (263, 95, 81)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (264, 100, 81)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (265, 94, 81)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (266, 95, 82)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (267, 94, 82)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (268, 100, 82)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (269, 65, 83)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (270, 46, 83)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (271, 84, 83)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (272, 46, 84)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (273, 36, 84)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (274, 73, 84)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (275, 102, 84)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (276, 65, 85)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (277, 46, 85)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (278, 36, 85)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (279, 102, 85)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (280, 49, 86)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (281, 14, 86)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (282, 96, 86)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (283, 55, 86)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (284, 49, 87)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (285, 14, 87)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (286, 96, 87)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (287, 55, 87)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (288, 69, 88)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (289, 85, 88)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (290, 69, 89)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (291, 85, 89)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (292, 95, 90)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (293, 24, 90)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (294, 14, 90)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (295, 55, 90)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (296, 95, 91)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (297, 88, 91)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (298, 60, 92)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (299, 35, 92)
GO
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (300, 60, 93)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (301, 35, 93)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (302, 60, 94)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (303, 35, 94)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (304, 16, 95)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (305, 77, 95)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (306, 73, 95)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (307, 83, 95)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (308, 69, 96)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (309, 49, 96)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (310, 71, 96)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (311, 69, 97)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (312, 49, 97)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (313, 71, 97)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (314, 22, 98)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (315, 104, 98)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (316, 89, 98)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (317, 28, 98)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (318, 22, 99)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (319, 28, 99)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (320, 89, 99)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (321, 95, 100)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (322, 80, 100)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (323, 94, 100)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (324, 40, 100)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (325, 95, 101)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (326, 80, 101)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (327, 94, 101)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (328, 40, 101)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (329, 15, 102)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (330, 3, 102)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (331, 11, 102)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (332, 15, 103)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (333, 89, 103)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (334, 20, 104)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (335, 97, 104)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (336, 21, 104)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (337, 73, 104)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (338, 20, 105)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (339, 97, 105)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (340, 21, 105)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (341, 73, 105)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (342, 32, 106)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (343, 78, 106)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (344, 57, 106)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (345, 50, 106)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (346, 25, 107)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (347, 42, 107)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (348, 99, 107)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (349, 63, 107)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (350, 109, 108)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (351, 89, 108)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (352, 83, 108)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (353, 95, 109)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (354, 86, 109)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (355, 80, 109)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (356, 40, 109)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (357, 95, 110)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (358, 86, 110)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (359, 85, 110)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (360, 80, 110)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (361, 51, 111)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (362, 89, 111)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (363, 46, 111)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (364, 96, 111)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (365, 51, 112)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (366, 89, 112)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (367, 46, 112)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (368, 96, 112)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (369, 69, 113)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (370, 33, 113)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (371, 34, 113)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (372, 27, 114)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (373, 16, 114)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (374, 12, 114)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (375, 83, 114)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (376, 25, 115)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (377, 73, 115)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (378, 18, 115)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (379, 31, 115)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (380, 22, 116)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (381, 106, 116)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (382, 52, 116)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (383, 22, 117)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (384, 106, 117)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (385, 52, 117)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (386, 65, 118)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (387, 51, 118)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (388, 46, 118)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (389, 107, 118)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (390, 65, 119)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (391, 51, 119)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (392, 46, 119)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (393, 107, 119)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (394, 95, 120)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (395, 106, 120)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (396, 94, 120)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (397, 52, 120)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (398, 52, 121)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (399, 26, 122)
GO
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (400, 33, 122)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (401, 72, 123)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (402, 84, 123)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (403, 69, 124)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (404, 60, 124)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (405, 33, 124)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (406, 56, 124)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (407, 19, 124)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (408, 72, 125)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (409, 100, 125)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (410, 99, 125)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (411, 98, 125)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (412, 39, 126)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (413, 42, 126)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (414, 86, 126)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (415, 44, 126)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (416, 104, 127)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (417, 84, 127)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (418, 95, 128)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (419, 89, 128)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (420, 73, 128)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (421, 96, 128)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (422, 95, 129)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (423, 95, 130)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (424, 18, 130)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (425, 52, 130)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (426, 53, 130)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (427, 106, 131)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (428, 19, 131)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (429, 55, 131)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (430, 52, 131)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (431, 33, 132)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (432, 95, 133)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (433, 72, 133)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (434, 18, 133)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (435, 96, 133)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (436, 95, 134)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (437, 72, 134)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (438, 106, 134)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (439, 52, 134)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (440, 95, 135)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (441, 72, 135)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (442, 100, 135)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (443, 98, 135)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (444, 95, 136)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (445, 72, 136)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (446, 39, 136)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (447, 18, 136)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (448, 44, 136)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (449, 95, 137)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (450, 70, 137)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (451, 102, 137)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (452, 106, 138)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (453, 51, 138)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (454, 88, 138)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (455, 52, 138)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (456, 106, 139)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (457, 51, 139)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (458, 88, 139)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (459, 52, 139)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (460, 79, 140)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (461, 12, 140)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (462, 84, 140)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (463, 52, 140)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (464, 79, 141)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (465, 12, 141)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (466, 84, 141)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (467, 52, 141)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (468, 108, 142)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (469, 18, 142)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (470, 96, 142)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (471, 53, 142)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (472, 49, 143)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (473, 19, 143)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (474, 34, 143)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (475, 53, 143)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (476, 65, 144)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (477, 55, 144)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (478, 17, 144)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (479, 100, 145)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (480, 36, 145)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (481, 98, 145)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (482, 65, 146)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (483, 43, 146)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (484, 82, 146)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (485, 109, 147)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (486, 83, 147)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (487, 53, 147)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (488, 109, 148)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (489, 83, 148)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (490, 53, 148)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (491, 109, 149)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (492, 83, 149)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (493, 53, 149)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (494, 94, 150)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (495, 71, 150)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (496, 69, 151)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (497, 63, 151)
INSERT [dbo].[MovesPokemon] ([ID], [MoveID], [PokemonID]) VALUES (498, 71, 151)
SET IDENTITY_INSERT [dbo].[MovesPokemon] OFF
GO
SET IDENTITY_INSERT [dbo].[Pokemon] ON 

INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (1, 7, 16, N'Bulbasaur', N'Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the suns rays, the seed grows progressively larger.', N'15.199', 26, 16)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (2, 7, 11, N'Ivysaur', N'There is a bud on this Pokémon''s back. To support its weight, Ivysaur''s legs and trunk grow thick and strong. If it starts spending more time lying in the sunlight, it''s a sign that the bud will bloom into a large flower soon.', N'28.699', 39, 32)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (3, 7, 11, N'Venusaur', N'There is a large flower on Venusaur''s back. The flower is said to take on vivid colors if it gets plenty of nutrition and sunlight. The flower''s aroma soothes the emotions of people.', N'220.5', 79, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (4, 5, 16, N'Charmander', N'The flame that burns at the tip of its tail is an indication of its emotions. The flame wavers when Charmander is enjoying itself. If the Pokémon becomes enraged, the flame burns fiercely.', N'18.699', 24, 16)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (5, 5, 16, N'Charmeleon', N'Charmeleon mercilessly destroys its foes using its sharp claws. If it encounters a strong foe, it turns aggressive. In this excited state, the flame at the tip of its tail flares with a bluish white color.', N'41.899', 43, 32)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (6, 5, 15, N'Charizard', N'Charizard flies around the sky in search of powerful opponents. It breathes fire of such great heat that it melts anything. However, it never turns its fiery breath on any opponent weaker than itself.', N'199.5', 67, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (7, 14, 16, N'Squirtle', N'Squirtle''s shell is not merely used for protection. The shell''s rounded shape and the grooves on its surface help minimize resistance in water, enabling this Pokémon to swim at high speeds.', N'19.8', 20, 16)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (8, 14, 16, N'Wartortle', N'Its tail is large and covered with a rich, thick fur. The tail becomes increasingly deeper in color as Wartortle ages. The scratches on its shell are evidence of this Pokémon''s toughness as a battler.', N'49.6', 39, 32)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (9, 14, 16, N'Blastoise', N'Blastoise has water spouts that protrude from its shell. The water spouts are very accurate. They can shoot bullets of water with enough accuracy to strike empty cans from a distance of over 160 feet.', N'188.5', 63, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (10, 1, 16, N'Caterpie', N'Caterpie has a voracious appetite. It can devour leaves bigger than its body right before your eyes. From its antenna, this Pokémon releases a terrifically strong odor.', N'6.4', 12, 7)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (11, 1, 16, N'Metapod', N'The shell covering this Pokémon''s body is as hard as an iron slab. Metapod does not move very much. It stays still because it is preparing its soft innards for evolution inside the hard shell.', N'21.8', 28, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (12, 1, 15, N'Butterfree', N'Butterfree has a superior ability to search for delicious honey from flowers. It can even search out, extract, and carry honey from flowers that are blooming over six miles from its nest.', N'70.5', 43, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (13, 1, 11, N'Weedle', N'Weedle has an extremely acute sense of smell. It is capable of distinguishing its favorite kinds of leaves from those it dislikes just by sniffing with its big red proboscis (nose).', N'7', 12, 7)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (14, 1, 11, N'Kakuna', N'Kakuna remains virtually immobile as it clings to a tree. However, on the inside, it is extremely busy as it prepares for its coming evolution. This is evident from how hot the shell becomes to the touch.', N'22', 24, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (15, 1, 11, N'Beedrill', N'Beedrill is extremely territorial. No one should ever approach its nest—this is for their own safety. If angered, they will attack in a furious swarm.', N'65', 39, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (16, 10, 15, N'Pidgey', N'Pidgey has an extremely sharp sense of direction. It is capable of unerringly returning home to its nest, however far it may be removed from its familiar surroundings.\n', N'4', 12, 18)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (17, 10, 15, N'Pidgeotto', N'Pidgeotto claims a large area as its own territory. This Pokémon flies around, patrolling its living space. If its territory is violated, it shows no mercy in thoroughly punishing the foe with its sharp claws.', N'66.09', 43, 36)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (18, 10, 15, N'Pidgeot', N'This Pokémon has a dazzling plumage of beautifully glossy feathers. Many Trainers are captivated by the striking beauty of the feathers on its head, compelling them to choose Pidgeot as their Pokémon.', N'87.099', 59, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (19, 10, 16, N'Rattata', N'Rattata is cautious in the extreme. Even while it is asleep, it constantly listens by moving its ears around. It is not picky about where it lives—it will make its nest anywhere.', N'7.7', 12, 20)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (20, 10, 16, N'Raticate', N'Raticate''s sturdy fangs grow steadily. To keep them ground down, it gnaws on rocks and logs. It may even chew on the walls of houses.', N'40.79', 28, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (21, 10, 15, N'Spearow', N'Spearow has a very loud cry that can be heard over half a mile away. If its high, keening cry is heard echoing all around, it is a sign that they are warning each other of danger.', N'4.4', 12, 20)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (22, 10, 15, N'Fearow', N'Fearow is recognized by its long neck and elongated beak. They are conveniently shaped for catching prey in soil or water. It deftly moves its long and skinny beak to pluck prey.', N'83.799', 47, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (23, 11, 16, N'Ekans', N'Ekans curls itself up in a spiral while it rests. Assuming this position allows it to quickly respond to a threat from any direction with a glare from its upraised head.', N'15.199', 79, 22)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (24, 11, 16, N'Arbok', N'This Pokémon is terrifically strong in order to constrict things with its body. It can even flatten steel oil drums. Once Arbok wraps its body around its foe, escaping its crunching embrace is impossible.', N'143.3', 138, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (25, 3, 16, N'Pikachu', N'Whenever Pikachu comes across something new, it blasts it with a jolt of electricity. If you come across a blackened berry, it''s evidence that this Pokémon mistook the intensity of its charge.', N'13.199', 16, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (26, 3, 16, N'Raichu', N'If the electrical sacs become excessively charged, Raichu plants its tail in the ground and discharges. Scorched patches of ground will be found near this Pokémon''s nest.', N'66.099', 31, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (27, 8, 16, N'Sandshrew', N'Sandshrew''s body is configured to absorb water without waste, enabling it to survive in an arid desert. This Pokémon curls up to protect itself from its enemies.', N'26', 24, 22)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (28, 8, 16, N'Sandslash', N'Sandslash''s body is covered by tough spikes, which are hardened sections of its hide. Once a year, the old spikes fall out, to be replaced with new spikes that grow out from beneath the old ones.', N'65', 39, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (29, 11, 16, N'Nidoran♀', N'Nidoran♀ has barbs that secrete a powerful poison. They are thought to have developed as protection for this small-bodied Pokémon. When enraged, it releases a horrible toxin from its horn.', N'15.4', 16, 16)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (30, 11, 16, N'Nidorina', N'When Nidorina are with their friends or family, they keep their barbs tucked away to prevent hurting each other. This Pokémon appears to become nervous if separated from the others.', N'44.1', 31, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (31, 11, 8, N'Nidoqueen', N'Nidoqueen''s body is encased in extremely hard scales. It is adept at sending foes flying with harsh tackles. This Pokémon is at its strongest when it is defending its young.', N'132.3', 51, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (32, 11, 16, N'Nidoran♂', N'Nidoran♂ has developed muscles for moving its ears. Thanks to them, the ears can be freely moved in any direction. Even the slightest sound does not escape this Pokémon''s notice.', N'19.8', 20, 16)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (33, 11, 16, N'Nidorino', N'Nidorino has a horn that is harder than a diamond. If it senses a hostile presence, all the barbs on its back bristle up at once, and it challenges the foe with all its might.', N'43', 35, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (34, 11, 8, N'Nidoking', N'Nidoking''s thick tail packs enormously destructive power. With one swing, it can topple a metal transmission tower. Once this Pokémon goes on a rampage, there is no stopping it.', N'136.69', 55, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (35, 10, 16, N'Clefairy', N'On every night of a full moon, groups of this Pokémon come out to play. When dawn arrives, the tired Clefairy return to their quiet mountain retreats and go to sleep nestled up against each other.', N'16', 24, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (36, 10, 16, N'Clefable', N'Clefable moves by skipping lightly as if it were flying using its wings. Its bouncy step lets it even walk on water. It is known to take strolls on lakes on quiet, moonlit nights.', N'88.2', 51, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (37, 5, 16, N'Vulpix', N'At the time of its birth, Vulpix has one white tail. The tail separates into six if this Pokémon receives plenty of love from its Trainer. The six tails become magnificently curled.', N'21.8', 24, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (38, 5, 16, N'Ninetales', N'Ninetales casts a sinister light from its bright red eyes to gain total control over its foe''s mind. This Pokémon is said to live for a thousand years.', N'43.899', 43, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (39, 10, 16, N'Jigglypuff', N'Jigglypuff''s vocal cords can freely adjust the wavelength of its voice. This Pokémon uses this ability to sing at precisely the right wavelength to make its foes most drowsy.', N'12.099', 20, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (40, 10, 16, N'Wigglytuff', N'Wigglytuff has large, saucerlike eyes. The surfaces of its eyes are always covered with a thin layer of tears. If any dust gets in this Pokémon''s eyes, it is quickly washed away.', N'26', 39, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (41, 11, 15, N'Zubat', N'Zubat remains quietly unmoving in a dark spot during the bright daylight hours. It does so because prolonged exposure to the sun causes its body to become slightly burned.', N'16', 31, 22)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (42, 11, 15, N'Golbat', N'Golbat loves to drink the blood of living things. It is particularly active in the pitch black of night. This Pokémon flits around in the night skies, seeking fresh blood.', N'121.299', 63, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (43, 7, 11, N'Oddish', N'During the daytime, Oddish buries itself in soil to absorb nutrients from the ground using its entire body. The more fertile the soil, the glossier its leaves become.', N'11.9', 20, 21)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (44, 7, 11, N'Gloom', N'Gloom releases a foul fragrance from the pistil of its flower. When faced with danger, the stench worsens. If this Pokémon is feeling calm and secure, it does not release its usual stinky aroma.', N'19', 31, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (45, 7, 11, N'Vileplume', N'Vileplume''s toxic pollen triggers atrocious allergy attacks. That''s why it is advisable never to approach any attractive flowers in a jungle, however pretty they may be.', N'41', 47, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (46, 1, 7, N'Paras', N'Paras has parasitic mushrooms growing on its back called tochukaso. They grow large by drawing nutrients from this Bug Pokémon host. They are highly valued as a medicine for extending life.', N'11.9', 12, 24)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (47, 1, 7, N'Parasect', N'Parasect is known to infest large trees en masse and drain nutrients from the lower trunk and roots. When an infested tree dies, they move onto another tree all at once.', N'65', 39, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (48, 1, 11, N'Venonat', N'Venonat is said to have evolved with a coat of thin, stiff hair that covers its entire body for protection. It possesses large eyes that never fail to spot even minuscule prey.', N'66.099', 39, 31)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (49, 1, 11, N'Venomoth', N'Venomoth is nocturnal—it is a Pokémon that only becomes active at night. Its favorite prey are small insects that gather around streetlights, attracted by the light in the darkness.', N'27.6', 59, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (50, 8, 16, N'Diglett', N'Diglett are raised in most farms. The reason is simple— wherever this Pokémon burrows, the soil is left perfectly tilled for planting crops. This soil is made ideal for growing delicious vegetables.', N'1.8', 8, 26)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (51, 8, 16, N'Dugtrio', N'Dugtrio are actually triplets that emerged from one body. As a result, each triplet thinks exactly like the other two triplets. They work cooperatively to burrow endlessly.', N'73.4', 28, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (52, 10, 16, N'Meowth', N'Meowth withdraws its sharp claws into its paws to slinkily sneak about without making any incriminating footsteps. For some reason, this Pokémon loves shiny coins that glitter with light.', N'9.3', 16, 28)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (53, 10, 16, N'Persian', N'Persian has six bold whiskers that give it a look of toughness. The whiskers sense air movements to determine what is in the Pokémon''s surrounding vicinity. It becomes docile if grabbed by the whiskers.', N'70.5', 39, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (54, 14, 16, N'Psyduck', N'Psyduck uses a mysterious power. When it does so, this Pokémon generates brain waves that are supposedly only seen in sleepers. This discovery spurred controversy among scholars.', N'43.2', 31, 33)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (55, 14, 16, N'Golduck', N'The webbed flippers on its forelegs and hind legs and the streamlined body of Golduck give it frightening speed. This Pokémon is definitely much faster than even the most athletic swimmer.', N'168.9', 67, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (56, 4, 16, N'Mankey', N'When Mankey starts shaking and its nasal breathing turns rough, it''s a sure sign that it is becoming angry. However, because it goes into a towering rage almost instantly, it is impossible for anyone to flee its wrath.', N'61.7', 20, 28)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (57, 4, 16, N'Primeape', N'When Primeape becomes furious, its blood circulation is boosted. In turn, its muscles are made even stronger. However, it also becomes much less intelligent at the same time.', N'70.5', 39, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (58, 5, 16, N'Growlithe', N'Growlithe has a superb sense of smell. Once it smells anything, this Pokémon won''t forget the scent, no matter what. It uses its advanced olfactory sense to determine the emotions of other living things.', N'41.899', 28, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (59, 5, 16, N'Arcanine', N'Arcanine is known for its high speed. It is said to be capable of running over 6,200 miles in a single day and night. The fire that blazes wildly within this Pokémon''s body is its source of power.', N'341.699', 75, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (60, 14, 16, N'Poliwag', N'Poliwag has a very thin skin. It is possible to see the Pokémon''s spiral innards right through the skin. Despite its thinness, however, the skin is also very flexible. Even sharp fangs bounce right off it.', N'27.3', 24, 25)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (61, 14, 16, N'Poliwhirl', N'The surface of Poliwhirl''s body is always wet and slick with a slimy fluid. Because of this slippery covering, it can easily slip and slide out of the clutches of any enemy in battle.', N'44.1', 39, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (62, 14, 4, N'Poliwrath', N'Poliwrath''s highly developed, brawny muscles never grow fatigued, however much it exercises. It is so tirelessly strong, this Pokémon can swim back and forth across the ocean without effort.', N'119', 51, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (63, 12, 16, N'Abra', N'Abra sleeps for eighteen hours a day. However, it can sense the presence of foes even while it is sleeping. In such a situation, this Pokémon immediately teleports to safety.', N'43', 35, 16)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (64, 12, 16, N'Kadabra', N'Kadabra emits a peculiar alpha wave if it develops a headache. Only those people with a particularly strong psyche can hope to become a Trainer of this Pokémon.', N'124.599', 51, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (65, 12, 16, N'Alakazam', N'Alakazam''s brain continually grows, making its head far too heavy to support with its neck. This Pokémon holds its head up using its psychokinetic power instead.', N'105.799', 59, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (66, 4, 16, N'Machop', N'Machop''s muscles are special—they never get sore no matter how much they are used in exercise. This Pokémon has sufficient power to hurl a hundred adult humans.', N'43', 31, 28)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (67, 4, 16, N'Machoke', N'Machoke''s thoroughly toned muscles possess the hardness of steel. This Pokémon has so much strength, it can easily hold aloft a sumo wrestler on just one finger.', N'155.4', 59, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (68, 4, 16, N'Machamp', N'Machamp has the power to hurl anything aside. However, trying to do any work requiring care and dexterity causes its arms to get tangled. This Pokémon tends to leap into action before it thinks.', N'286.6', 63, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (69, 7, 11, N'Bellsprout', N'Bellsprout''s thin and flexible body lets it bend and sway to avoid any attack, however strong it may be. From its mouth, this Pokémon spits a corrosive fluid that melts even iron.', N'8.8', 28, 21)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (70, 7, 11, N'Weepinbell', N'Weepinbell has a large hook on its rear end. At night, the Pokémon hooks on to a tree branch and goes to sleep. If it moves around in its sleep, it may wake up to find itself on the ground.', N'14.099', 39, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (71, 7, 11, N'Victreebel', N'Victreebel has a long vine that extends from its head. This vine is waved and flicked about as if it were an animal to attract prey. When an unsuspecting prey draws near, this Pokémon swallows it whole.', N'34.2', 67, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (72, 14, 11, N'Tentacool', N'Tentacool''s body is largely composed of water. If it is removed from the sea, it dries up like parchment. If this Pokémon happens to become dehydrated, put it back into the sea.', N'100.299', 35, 30)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (73, 14, 11, N'Tentacruel', N'Tentacruel has large red orbs on its head. The orbs glow before lashing the vicinity with a harsh ultrasonic blast. This Pokémon''s outburst creates rough waves around it.', N'121.299', 63, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (74, 13, 8, N'Geodude', N'The longer a Geodude lives, the more its edges are chipped and worn away, making it more rounded in appearance. However, this Pokémon''s heart will remain hard, craggy, and rough always.', N'44.1', 16, 25)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (75, 13, 8, N'Graveler', N'Graveler grows by feeding on rocks. Apparently, it prefers to eat rocks that are covered in moss. This Pokémon eats its way through a ton of rocks on a daily basis.', N'231.5', 39, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (76, 13, 8, N'Golem', N'Golem live up on mountains. If there is a large earthquake, these Pokémon will come rolling down off the mountains en masse to the foothills below.', N'661.399', 55, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (77, 5, 16, N'Ponyta', N'Ponyta is very weak at birth. It can barely stand up. This Pokémon becomes stronger by stumbling and falling to keep up with its parent.', N'66.099', 39, 40)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (78, 5, 16, N'Rapidash', N'Rapidash usually can be seen casually cantering in the fields and plains. However, when this Pokémon turns serious, its fiery manes flare and blaze as it gallops its way up to 150 mph.', N'209.4', 67, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (79, 14, 12, N'Slowpoke', N'Slowpoke uses its tail to catch prey by dipping it in water at the side of a river. However, this Pokémon often forgets what it''s doing and often spends entire days just loafing at water''s edge.', N'79.4', 47, 37)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (80, 14, 12, N'Slowbro', N'Slowbro''s tail has a Shellder firmly attached with a bite. As a result, the tail can''t be used for fishing anymore. This causes Slowbro to grudgingly swim and catch prey instead.', N'173.099', 63, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (81, 3, 16, N'Magnemite', N'Magnemite attaches itself to power lines to feed on electricity. If your house has a power outage, check your circuit breakers. You may find a large number of this Pokémon clinging to the breaker box.', N'13.199', 12, 30)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (82, 3, 16, N'Magneton', N'Magneton emits a powerful magnetic force that is fatal to mechanical devices. As a result, large cities sound sirens to warn citizens of large-scale outbreaks of this Pokémon.', N'132.3', 39, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (83, 10, 15, N'Farfetch''d', N'Farfetch''d is always seen with a stalk from a plant of some sort. Apparently, there are good stalks and bad stalks. This Pokémon has been known to fight with others over stalks.', N'33.1', 31, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (84, 10, 15, N'Doduo', N'Doduo''s two heads never sleep at the same time. Its two heads take turns sleeping, so one head can always keep watch for enemies while the other one sleeps.', N'86.4', 55, 31)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (85, 10, 15, N'Dodrio', N'Watch out if Dodrio''s three heads are looking in three separate directions. It''s a sure sign that it is on its guard. Don''t go near this Pokémon if it''s being wary—it may decide to peck you.', N'187.8', 71, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (86, 14, 16, N'Seel', N'Seel hunts for prey in the frigid sea underneath sheets of ice. When it needs to breathe, it punches a hole through the ice with the sharply protruding section of its head.', N'198.4', 43, 34)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (87, 14, 9, N'Dewgong', N'Dewgong loves to snooze on bitterly cold ice. The sight of this Pokémon sleeping on a glacier was mistakenly thought to be a mermaid by a mariner long ago.', N'264.6', 67, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (88, 11, 16, N'Grimer', N'Grimer''s sludgy and rubbery body can be forced through any opening, however small it may be. This Pokémon enters sewer pipes to drink filthy wastewater.', N'66.099', 35, 38)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (89, 11, 16, N'Muk', N'From Muk''s body seeps a foul fluid that gives off a nose-bendingly horrible stench. Just one drop of this Pokémon''s body fluid can turn a pool stagnant and rancid.', N'66.099', 47, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (90, 14, 16, N'Shellder', N'At night, this Pokémon uses its broad tongue to burrow a hole in the seafloor sand and then sleep in it. While it is sleeping, Shellder closes its shell, but leaves its tongue hanging out.', N'8.8', 12, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (91, 14, 9, N'Cloyster', N'Cloyster is capable of swimming in the sea. It does so by swallowing water, then jetting it out toward the rear. This Pokémon shoots spikes from its shell using the same system.', N'292.1', 59, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (92, 6, 11, N'Gastly', N'Gastly is largely composed of gaseous matter. When exposed to a strong wind, the gaseous body quickly dwindles away. Groups of this Pokémon cluster under the eaves of houses to escape the ravages of wind.', N'0.2', 51, 25)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (93, 6, 11, N'Haunter', N'Haunter is a dangerous Pokémon. If one beckons you while floating in darkness, you must never approach it. This Pokémon will try to lick you with its tongue and steal your life away.', N'0.2', 63, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (94, 6, 11, N'Gengar', N'Sometimes, on a dark night, your shadow thrown by a streetlight will suddenly and startlingly overtake you. It is actually a Gengar running past you, pretending to be your shadow.', N'89.299', 59, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (95, 13, 8, N'Onix', N'Onix has a magnet in its brain. It acts as a compass so that this Pokémon does not lose direction while it is tunneling. As it grows older, its body becomes increasingly rounder and smoother.', N'463', 346, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (96, 12, 16, N'Drowzee', N'If your nose becomes itchy while you are sleeping, it''s a sure sign that one of these Pokémon is standing above your pillow and trying to eat your dream through your nostrils.', N'71.4', 39, 26)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (97, 12, 16, N'Hypno', N'Hypno holds a pendulum in its hand. The arcing movement and glitter of the pendulum lull the foe into a deep state of hypnosis. While this Pokémon searches for prey, it polishes the pendulum.', N'166.699', 63, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (98, 14, 16, N'Krabby', N'Krabby live on beaches, burrowed inside holes dug into the sand. On sandy beaches with little in the way of food, these Pokémon can be seen squabbling with each other over territory.', N'14.3', 16, 28)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (99, 14, 16, N'Kingler', N'Kingler has an enormous, oversized claw. It waves this huge claw in the air to communicate with others. However, because the claw is so heavy, the Pokémon quickly tires.', N'132.3', 51, 0)
GO
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (100, 3, 16, N'Voltorb', N'Voltorb was first sighted at a company that manufactures Poké Balls. The link between that sighting and the fact that this Pokémon looks very similar to a Poké Ball remains a mystery.', N'22.899', 20, 30)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (101, 3, 16, N'Electrode', N'Electrode eats electricity in the atmosphere. On days when lightning strikes, you can see this Pokémon exploding all over the place from eating too much electricity.', N'146.8', 47, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (102, 7, 12, N'Exeggcute', N'This Pokémon consists of six eggs that form a closely knit cluster. The six eggs attract each other and spin around. When cracks increasingly appear on the eggs, Exeggcute is close to evolution.', N'5', 16, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (103, 7, 12, N'Exeggutor', N'Exeggutor originally came from the tropics. Its heads steadily grow larger from exposure to strong sunlight. It is said that when the heads fall off, they group together to form Exeggcute.', N'264.6', 79, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (104, 8, 16, N'Cubone', N'Cubone pines for the mother it will never see again. Seeing a likeness of its mother in the full moon, it cries. The stains on the skull the Pokémon wears are made by the tears it sheds.', N'14.3', 16, 28)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (105, 8, 16, N'Marowak', N'Marowak is the evolved form of a Cubone that has overcome its sadness at the loss of its mother and grown tough. This Pokémon''s tempered and hardened spirit is not easily broken.', N'99.2', 39, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (106, 4, 16, N'Hitmonlee', N'Hitmonlee''s legs freely contract and stretch. Using these springlike legs, it bowls over foes with devastating kicks. After battle, it rubs down its legs and loosens the muscles to overcome fatigue.', N'109.799', 59, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (107, 4, 16, N'Hitmonchan', N'Hitmonchan is said to possess the spirit of a boxer who had been working toward a world championship. This Pokémon has an indomitable spirit and will never give up in the face of adversity.', N'110.7', 55, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (108, 10, 16, N'Lickitung', N'Whenever Lickitung comes across something new, it will unfailingly give it a lick. It does so because it memorizes things by texture and by taste. It is somewhat put off by sour things.', N'144.4', 47, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (109, 11, 16, N'Koffing', N'If Koffing becomes agitated, it raises the toxicity of its internal gases and jets them out from all over its body. This Pokémon may also overinflate its round body, then explode.', N'2.2', 24, 35)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (110, 11, 16, N'Weezing', N'Weezing loves the gases given off by rotted kitchen garbage. This Pokémon will find a dirty, unkempt house and make it its home. At night, when the people in the house are asleep, it will go through the trash.', N'20.899', 47, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (111, 8, 13, N'Rhyhorn', N'Rhyhorn runs in a straight line, smashing everything in its path. It is not bothered even if it rushes headlong into a block of steel. This Pokémon may feel some pain from the collision the next day, however.', N'253.5', 39, 42)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (112, 8, 13, N'Rhydon', N'Rhydon''s horn can crush even uncut diamonds. One sweeping blow of its tail can topple a building. This Pokémon''s hide is extremely tough. Even direct cannon hits don''t leave a scratch.', N'264.6', 75, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (113, 10, 16, N'Chansey', N'Chansey lays nutritionally excellent eggs on an everyday basis. The eggs are so delicious, they are easily and eagerly devoured by even those people who have lost their appetite.', N'76.299', 43, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (114, 7, 16, N'Tangela', N'Tangela''s vines snap off easily if they are grabbed. This happens without pain, allowing it to make a quick getaway. The lost vines are replaced by newly grown vines the very next day.', N'77.2', 39, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (115, 10, 16, N'Kangaskhan', N'If you come across a young Kangaskhan playing by itself, you must never disturb it or attempt to catch it. The baby Pokémon''s parent is sure to be in the area, and it will become violently enraged at you.', N'176.4', 75, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (116, 14, 16, N'Horsea', N'Horsea eats small insects and moss off of rocks. If the ocean current turns fast, this Pokémon anchors itself by wrapping its tail around rocks or coral to prevent being washed away.', N'17.6', 16, 32)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (117, 14, 16, N'Seadra', N'Seadra sleeps after wriggling itself between the branches of coral. Those trying to harvest coral are occasionally stung by this Pokémon''s poison barbs if they fail to notice it.', N'55.1', 47, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (118, 14, 16, N'Goldeen', N'Goldeen is a very beautiful Pokémon with fins that billow elegantly in water. However, don''t let your guard down around this Pokémon—it could ram you powerfully with its horn.', N'33.1', 24, 33)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (119, 14, 16, N'Seaking', N'In the autumn, Seaking males can be seen performing courtship dances in riverbeds to woo females. During this season, this Pokémon''s body coloration is at its most beautiful.', N'86', 51, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (120, 14, 16, N'Staryu', N'Staryu''s center section has an organ called the core that shines bright red. If you go to a beach toward the end of summer, the glowing cores of these Pokémon look like the stars in the sky.', N'76.099', 31, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (121, 14, 12, N'Starmie', N'Starmie''s center section—the core—glows brightly in seven colors. Because of its luminous nature, this Pokémon has been given the nickname “the gem of the sea."', N'176.4', 43, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (122, 12, 16, N'Mr.Mime', N'Mr. Mime is a master of pantomime. Its gestures and motions convince watchers that something unseeable actually exists. Once the watchers are convinced, the unseeable thing exists as if it were real.', N'120.099', 51, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (123, 1, 15, N'Scyther', N'Scyther is blindingly fast. Its blazing speed enhances the effectiveness of the twin scythes on its forearms. This Pokémon''s scythes are so effective, they can slice through thick logs in one wicked stroke.', N'123.5', 59, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (124, 9, 12, N'Jynx', N'Jynx walks rhythmically, swaying and shaking its hips as if it were dancing. Its motions are so bouncingly alluring, people seeing it are compelled to shake their hips without giving any thought to what they are doing.', N'89.5', 31, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (125, 3, 16, N'Electabuzz', N'When a storm arrives, gangs of this Pokémon compete with each other to scale heights that are likely to be stricken by lightning bolts. Some towns use Electabuzz in place of lightning rods.', N'66.099', 43, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (126, 5, 16, N'Magmar', N'In battle, Magmar blows out intensely hot flames from all over its body to intimidate its opponent. This Pokémon''s fiery bursts create heat waves that ignite grass and trees in its surroundings.', N'98.099', 51, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (127, 1, 16, N'Pinsir', N'Pinsir is astoundingly strong. It can grip a foe weighing twice its weight in its horns and easily lift it. This Pokémon''s movements turn sluggish in cold places.', N'121.299', 59, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (128, 10, 16, N'Tauros', N'This Pokémon is not satisfied unless it is rampaging at all times. If there is no opponent for Tauros to battle, it will charge at thick trees and knock them down to calm itself.', N'194.9', 55, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (129, 14, 16, N'Magikarp', N'Magikarp is a pathetic excuse for a Pokémon that is only capable of flopping and splashing. This behavior prompted scientists to undertake research into it.', N'22', 35, 20)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (130, 14, 15, N'Gyarados', N'When Magikarp evolves into Gyarados, its brain cells undergo a structural transformation. It is said that this transformation is to blame for this Pokémon''s wildly violent nature.', N'518.1', 256, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (131, 14, 9, N'Lapras', N'People have driven Lapras almost to the point of extinction. In the evenings, this Pokémon is said to sing plaintively as it seeks what few others of its kind still remain.', N'485', 98, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (132, 10, 16, N'Ditto', N'Ditto rearranges its cell structure to transform itself into other shapes. However, if it tries to transform itself into something by relying on its memory, this Pokémon manages to get details wrong.', N'8.8', 12, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (133, 10, 16, N'Eevee', N'Eevee has an unstable genetic makeup that suddenly mutates due to the environment in which it lives. Radiation from various stones causes this Pokémon to evolve.', N'14.3', 12, 10)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (134, 14, 16, N'Vaporeon', N'Vaporeon underwent a spontaneous mutation and grew fins and gills that allow it to live underwater. This Pokémon has the ability to freely control water.', N'63.899', 39, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (135, 3, 16, N'Jolteon', N'Jolteon''s cells generate a low level of electricity. This power is amplified by the static electricity of its fur, enabling the Pokémon to drop thunderbolts. The bristling fur is made of electrically charged needles.', N'54', 31, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (136, 5, 16, N'Flareon', N'Flareon''s fluffy fur has a functional purpose—it releases heat into the air so that its body does not get excessively hot. This Pokémon''s body temperature can rise to a maximum of 1,650 degrees Fahrenheit.', N'55.1', 35, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (137, 10, 16, N'Porygon', N'Porygon is capable of reverting itself entirely back to program data and entering cyberspace. This Pokémon is copy protected so it cannot be duplicated by copying.', N'80.5', 31, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (138, 13, 14, N'Omanyte', N'Omanyte is one of the ancient and long-since-extinct Pokémon that have been regenerated from fossils by people. If attacked by an enemy, it withdraws itself inside its hard shell.', N'16', 16, 40)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (139, 13, 14, N'Omastar', N'Omastar uses its tentacles to capture its prey. It is believed to have become extinct because its shell grew too large and heavy, causing its movements to become too slow and ponderous.', N'77.2', 39, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (140, 13, 14, N'Kabuto', N'Kabuto is a Pokémon that has been regenerated from a fossil. However, in extremely rare cases, living examples have been discovered. The Pokémon has not changed at all for 300 million years.', N'25.399', 20, 40)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (141, 13, 14, N'Kabutops', N'Kabutops swam underwater to hunt for its prey in ancient times. The Pokémon was apparently evolving from being a water dweller to living on land as evident from the beginnings of change in its gills and legs.', N'89.299', 51, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (142, 13, 15, N'Aerodactyl', N'Aerodactyl is a Pokémon from the age of dinosaurs. It was regenerated from genetic material extracted from amber. It is imagined to have been the king of the skies in ancient times.', N'130.099', 71, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (143, 10, 16, N'Snorlax', N'Snorlax''s typical day consists of nothing more than eating and sleeping. It is such a docile Pokémon that there are children who use its expansive belly as a place to play.', N'1014.1', 83, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (144, 9, 15, N'Articuno', N'Articuno is a legendary bird Pokémon that can control ice. The flapping of its wings chills the air. As a result, it is said that when this Pokémon flies, snow will fall.', N'122.099', 67, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (145, 3, 15, N'Zapdos', N'Zapdos is a legendary bird Pokémon that has the ability to control electricity. It usually lives in thunderclouds. The Pokémon gains power if it is stricken by lightning bolts.', N'116', 63, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (146, 5, 15, N'Moltres', N'Moltres is a legendary bird Pokémon that has the ability to control fire. If this Pokémon is injured, it is said to dip its body in the molten magma of a volcano to burn and heal itself.', N'132.3', 79, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (147, 2, 16, N'Dratini', N'Dratini continually molts and sloughs off its old skin. It does so because the life energy within its body steadily builds to reach uncontrollable levels.', N'7.299', 71, 30)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (148, 2, 16, N'Dragonair', N'Dragonair stores an enormous amount of energy inside its body. It is said to alter weather conditions in its vicinity by discharging energy from the crystals on its neck and tail.', N'36.399', 157, 55)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (149, 2, 15, N'Dragonite', N'Dragonite is capable of circling the globe in just 16 hours. It is a kindhearted Pokémon that leads lost and foundering ships in a storm to the safety of land.', N'463', 87, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (150, 12, 16, N'Mewtwo', N'Mewtwo is a Pokémon that was created by genetic manipulation. However, even though the scientific power of humans created this Pokémon''s body, they failed to endow Mewtwo with a compassionate heart.', N'269', 79, 0)
INSERT [dbo].[Pokemon] ([ID], [Type1_ID], [Type2_ID], [Name], [Description], [Weight], [Height], [EvolveLevel]) VALUES (151, 12, 16, N'Mew', N'Mew is said to possess the genetic composition of all Pokémon. It is capable of making itself invisible at will, so it entirely avoids notice even if it approaches people.', N'8.8', 16, 0)
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
ALTER TABLE [dbo].[Moves]  WITH CHECK ADD  CONSTRAINT [FK_Moves_Types_] FOREIGN KEY([TypeID])
REFERENCES [dbo].[Types_] ([ID])
GO
ALTER TABLE [dbo].[Moves] CHECK CONSTRAINT [FK_Moves_Types_]
GO
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLogs]
AS
SELECT * FROM BattleLogs
GO
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
