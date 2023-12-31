USE [master]
GO
/****** Object:  Database [Assignment]    Script Date: 8/19/2022 9:42:01 PM ******/
CREATE DATABASE [Assignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Assignment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Assignment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Assignment] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment] SET RECOVERY FULL 
GO
ALTER DATABASE [Assignment] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Assignment', N'ON'
GO
ALTER DATABASE [Assignment] SET QUERY_STORE = OFF
GO
USE [Assignment]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 8/19/2022 9:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [nchar](30) NOT NULL,
	[password] [nchar](30) NOT NULL,
	[displayname] [nchar](30) NOT NULL,
	[userid] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 8/19/2022 9:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[aid] [int] IDENTITY(1,1) NOT NULL,
	[sid] [int] NOT NULL,
	[sessionid] [int] NOT NULL,
	[attend] [bit] NULL,
	[comment] [nchar](150) NULL,
 CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 8/19/2022 9:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[depid] [int] IDENTITY(1,1) NOT NULL,
	[depname] [nchar](150) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[depid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enroll]    Script Date: 8/19/2022 9:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enroll](
	[sid] [int] NOT NULL,
	[gid] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 8/19/2022 9:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[fid] [int] NOT NULL,
	[fname] [nchar](150) NOT NULL,
	[url] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 8/19/2022 9:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[gid] [int] IDENTITY(1,1) NOT NULL,
	[gname] [nchar](150) NOT NULL,
	[lid] [int] NOT NULL,
	[subjectid] [int] NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecture]    Script Date: 8/19/2022 9:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecture](
	[lid] [int] IDENTITY(1,1) NOT NULL,
	[lname] [nchar](30) NOT NULL,
	[depid] [int] NOT NULL,
	[lgender] [bit] NOT NULL,
	[lcontract] [nchar](150) NOT NULL,
	[username] [nchar](30) NOT NULL,
 CONSTRAINT [PK_Lecture] PRIMARY KEY CLUSTERED 
(
	[lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 8/19/2022 9:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[rid] [int] NOT NULL,
	[rname] [nchar](150) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleAccount]    Script Date: 8/19/2022 9:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleAccount](
	[username] [nchar](30) NOT NULL,
	[rid] [int] NOT NULL,
 CONSTRAINT [PK_Role Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleFeature]    Script Date: 8/19/2022 9:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleFeature](
	[rid] [int] NOT NULL,
	[fid] [int] NOT NULL,
 CONSTRAINT [PK_Role Feature] PRIMARY KEY CLUSTERED 
(
	[rid] ASC,
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 8/19/2022 9:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[roomid] [int] IDENTITY(1,1) NOT NULL,
	[roomname] [nchar](150) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[roomid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 8/19/2022 9:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[sessionid] [int] IDENTITY(1,1) NOT NULL,
	[roomid] [int] NOT NULL,
	[slotid] [int] NOT NULL,
	[gid] [int] NOT NULL,
	[date] [date] NOT NULL,
	[taker] [int] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[sessionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slot]    Script Date: 8/19/2022 9:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot](
	[slotid] [int] IDENTITY(1,1) NOT NULL,
	[slotname] [nchar](150) NOT NULL,
	[slotstart] [time](7) NOT NULL,
	[slotend] [time](7) NOT NULL,
 CONSTRAINT [PK_Slot] PRIMARY KEY CLUSTERED 
(
	[slotid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 8/19/2022 9:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[sname] [nchar](150) NOT NULL,
	[sgender] [bit] NOT NULL,
	[sdob] [date] NOT NULL,
	[depid] [int] NOT NULL,
	[scode] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 8/19/2022 9:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[subjectid] [int] IDENTITY(1,1) NOT NULL,
	[subjectname] [nchar](150) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[subjectid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password], [displayname], [userid]) VALUES (N'hailt                         ', N'hailt                         ', N'hailt                         ', 5)
INSERT [dbo].[Account] ([username], [password], [displayname], [userid]) VALUES (N'sonhx                         ', N'sonhx                         ', N'sonhx                         ', 4)
INSERT [dbo].[Account] ([username], [password], [displayname], [userid]) VALUES (N'sonnt                         ', N'sonnt                         ', N'sont                          ', 1)
INSERT [dbo].[Account] ([username], [password], [displayname], [userid]) VALUES (N'thomlth                       ', N'thomlth                       ', N'thomlth                       ', 3)
INSERT [dbo].[Account] ([username], [password], [displayname], [userid]) VALUES (N'tuanvm                        ', N'tuanvm                        ', N'tuanvm                        ', 2)
GO
SET IDENTITY_INSERT [dbo].[Attendance] ON 

INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (72, 1, 7, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (73, 2, 7, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (74, 3, 7, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (75, 4, 7, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (76, 5, 7, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (77, 6, 7, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (78, 7, 7, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (79, 8, 7, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (80, 10, 7, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (81, 11, 7, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (82, 12, 7, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (83, 13, 7, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (84, 14, 7, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (85, 15, 7, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (86, 16, 7, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (87, 17, 7, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (88, 18, 7, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (89, 19, 7, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (90, 20, 7, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (91, 1, 12, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (92, 2, 12, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (93, 3, 12, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (94, 4, 12, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (95, 5, 12, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (96, 6, 12, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (97, 7, 12, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (98, 8, 12, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (99, 10, 12, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (100, 11, 12, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (101, 12, 12, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (102, 13, 12, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (103, 14, 12, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (104, 15, 12, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (105, 16, 12, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (106, 17, 12, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (107, 18, 12, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (108, 19, 12, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (109, 20, 12, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (110, 1, 15, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (111, 2, 15, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (112, 3, 15, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (113, 4, 15, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (114, 5, 15, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (115, 6, 15, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (116, 7, 15, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (117, 8, 15, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (118, 10, 15, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (119, 11, 15, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (120, 12, 15, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (121, 13, 15, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (122, 14, 15, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (123, 15, 15, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (124, 16, 15, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (125, 17, 15, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (126, 18, 15, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (127, 19, 15, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (128, 20, 15, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (129, 1, 18, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (130, 2, 18, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (131, 3, 18, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (132, 4, 18, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (133, 5, 18, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (134, 6, 18, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (135, 7, 18, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (136, 8, 18, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (137, 10, 18, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (138, 11, 18, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (139, 12, 18, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (140, 13, 18, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (141, 14, 18, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (142, 15, 18, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (143, 16, 18, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (144, 17, 18, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (145, 18, 18, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (146, 19, 18, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (147, 20, 18, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (148, 1, 21, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (149, 2, 21, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (150, 3, 21, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (151, 4, 21, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (152, 5, 21, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (153, 6, 21, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (154, 7, 21, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (155, 8, 21, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (156, 10, 21, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (157, 11, 21, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (158, 12, 21, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (159, 13, 21, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (160, 14, 21, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (161, 15, 21, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (162, 16, 21, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (163, 17, 21, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (164, 18, 21, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (165, 19, 21, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (166, 20, 21, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (167, 1, 23, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (168, 2, 23, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (169, 3, 23, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (170, 4, 23, 1, NULL)
GO
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (171, 5, 23, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (172, 6, 23, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (173, 7, 23, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (174, 8, 23, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (175, 10, 23, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (176, 11, 23, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (177, 12, 23, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (178, 13, 23, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (179, 14, 23, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (180, 15, 23, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (181, 16, 23, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (182, 17, 23, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (183, 18, 23, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (184, 19, 23, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (185, 20, 23, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (186, 1, 24, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (187, 2, 24, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (188, 3, 24, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (189, 4, 24, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (190, 5, 24, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (191, 6, 24, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (192, 7, 24, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (193, 8, 24, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (194, 10, 24, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (195, 11, 24, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (196, 12, 24, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (197, 13, 24, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (198, 14, 24, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (199, 15, 24, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (200, 16, 24, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (201, 17, 24, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (202, 18, 24, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (203, 19, 24, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (204, 20, 24, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (205, 1, 25, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (206, 2, 25, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (207, 3, 25, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (208, 4, 25, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (209, 5, 25, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (210, 6, 25, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (211, 7, 25, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (212, 8, 25, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (213, 10, 25, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (214, 11, 25, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (215, 12, 25, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (216, 13, 25, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (217, 14, 25, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (218, 15, 25, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (219, 16, 25, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (220, 17, 25, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (221, 18, 25, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (222, 19, 25, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (223, 20, 25, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (224, 1, 27, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (225, 2, 27, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (226, 3, 27, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (227, 4, 27, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (228, 5, 27, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (229, 6, 27, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (230, 7, 27, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (231, 8, 27, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (232, 10, 27, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (233, 11, 27, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (234, 12, 27, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (235, 13, 27, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (236, 14, 27, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (237, 15, 27, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (238, 16, 27, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (239, 17, 27, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (240, 18, 27, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (241, 19, 27, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (242, 20, 27, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (243, 1, 28, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (244, 2, 28, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (245, 3, 28, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (246, 4, 28, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (247, 5, 28, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (248, 6, 28, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (249, 7, 28, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (250, 8, 28, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (251, 10, 28, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (252, 11, 28, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (253, 12, 28, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (254, 13, 28, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (255, 14, 28, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (256, 15, 28, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (257, 16, 28, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (258, 17, 28, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (259, 18, 28, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (260, 19, 28, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (261, 20, 28, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (262, 1, 29, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (263, 2, 29, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (264, 3, 29, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (265, 4, 29, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (266, 5, 29, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (267, 6, 29, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (268, 7, 29, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (269, 8, 29, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (270, 10, 29, 1, NULL)
GO
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (271, 11, 29, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (272, 12, 29, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (273, 13, 29, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (274, 14, 29, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (275, 15, 29, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (276, 16, 29, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (277, 17, 29, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (278, 18, 29, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (279, 19, 29, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (280, 20, 29, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (281, 1, 31, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (282, 2, 31, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (283, 3, 31, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (284, 4, 31, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (285, 5, 31, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (286, 6, 31, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (287, 7, 31, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (288, 8, 31, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (289, 10, 31, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (290, 11, 31, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (291, 12, 31, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (292, 13, 31, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (293, 14, 31, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (294, 15, 31, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (295, 16, 31, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (296, 17, 31, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (297, 18, 31, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (298, 19, 31, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (299, 20, 31, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (300, 1, 30, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (301, 2, 30, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (302, 3, 30, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (303, 4, 30, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (304, 5, 30, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (305, 6, 30, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (306, 7, 30, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (307, 8, 30, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (308, 10, 30, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (309, 11, 30, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (310, 12, 30, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (311, 13, 30, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (312, 14, 30, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (313, 15, 30, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (314, 16, 30, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (315, 17, 30, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (316, 18, 30, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (317, 19, 30, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (318, 20, 30, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (319, 1, 32, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (320, 2, 32, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (321, 3, 32, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (322, 4, 32, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (323, 5, 32, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (324, 6, 32, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (325, 7, 32, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (326, 8, 32, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (327, 10, 32, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (328, 11, 32, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (329, 12, 32, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (330, 13, 32, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (331, 14, 32, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (332, 15, 32, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (333, 16, 32, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (334, 17, 32, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (335, 18, 32, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (336, 19, 32, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (337, 20, 32, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (338, 1, 33, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (339, 2, 33, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (340, 3, 33, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (341, 4, 33, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (342, 5, 33, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (343, 6, 33, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (344, 7, 33, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (345, 8, 33, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (346, 10, 33, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (347, 11, 33, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (348, 12, 33, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (349, 13, 33, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (350, 14, 33, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (351, 15, 33, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (352, 16, 33, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (353, 17, 33, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (354, 18, 33, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (355, 19, 33, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (356, 20, 33, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (357, 1, 36, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (358, 2, 36, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (359, 3, 36, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (360, 4, 36, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (361, 5, 36, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (362, 6, 36, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (363, 7, 36, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (364, 8, 36, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (365, 10, 36, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (366, 11, 36, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (367, 12, 36, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (368, 13, 36, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (369, 14, 36, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (370, 15, 36, 1, NULL)
GO
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (371, 16, 36, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (372, 17, 36, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (373, 18, 36, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (374, 19, 36, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (375, 20, 36, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (376, 1, 34, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (377, 2, 34, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (378, 3, 34, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (379, 4, 34, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (380, 5, 34, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (381, 6, 34, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (382, 7, 34, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (383, 8, 34, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (384, 10, 34, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (385, 11, 34, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (386, 12, 34, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (387, 13, 34, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (388, 14, 34, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (389, 15, 34, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (390, 16, 34, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (391, 17, 34, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (392, 18, 34, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (393, 19, 34, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (394, 20, 34, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (395, 1, 38, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (396, 2, 38, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (397, 3, 38, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (398, 4, 38, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (399, 5, 38, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (400, 6, 38, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (401, 7, 38, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (402, 8, 38, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (403, 10, 38, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (404, 11, 38, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (405, 12, 38, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (406, 13, 38, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (407, 14, 38, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (408, 15, 38, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (409, 16, 38, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (410, 17, 38, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (411, 18, 38, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (412, 19, 38, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (413, 20, 38, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (414, 1, 44, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (415, 2, 44, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (416, 3, 44, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (417, 4, 44, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (418, 5, 44, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (419, 6, 44, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (420, 7, 44, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (421, 8, 44, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (422, 10, 44, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (423, 11, 44, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (424, 12, 44, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (425, 13, 44, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (426, 14, 44, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (427, 15, 44, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (428, 16, 44, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (429, 17, 44, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (430, 18, 44, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (431, 19, 44, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (432, 20, 44, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (433, 1, 40, 0, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (434, 2, 40, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (435, 3, 40, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (436, 4, 40, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (437, 5, 40, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (438, 6, 40, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (439, 7, 40, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (440, 8, 40, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (441, 10, 40, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (442, 11, 40, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (443, 12, 40, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (444, 13, 40, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (445, 14, 40, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (446, 15, 40, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (447, 16, 40, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (448, 17, 40, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (449, 18, 40, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (450, 19, 40, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (451, 20, 40, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (452, 1, 41, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (453, 2, 41, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (454, 3, 41, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (455, 4, 41, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (456, 5, 41, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (457, 6, 41, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (458, 7, 41, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (459, 8, 41, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (460, 10, 41, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (461, 11, 41, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (462, 12, 41, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (463, 13, 41, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (464, 14, 41, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (465, 15, 41, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (466, 16, 41, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (467, 17, 41, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (468, 18, 41, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (469, 19, 41, 1, NULL)
INSERT [dbo].[Attendance] ([aid], [sid], [sessionid], [attend], [comment]) VALUES (470, 20, 41, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[Attendance] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([depid], [depname]) VALUES (1, N'SE                                                                                                                                                    ')
INSERT [dbo].[Department] ([depid], [depname]) VALUES (2, N'IA                                                                                                                                                    ')
INSERT [dbo].[Department] ([depid], [depname]) VALUES (3, N'IS                                                                                                                                                    ')
INSERT [dbo].[Department] ([depid], [depname]) VALUES (4, N'IOT                                                                                                                                                   ')
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (1, 15)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (2, 15)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (3, 15)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (4, 15)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (5, 15)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (6, 15)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (7, 15)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (8, 15)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (10, 15)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (11, 15)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (12, 15)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (13, 15)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (14, 15)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (15, 15)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (16, 15)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (17, 15)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (18, 15)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (19, 15)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (20, 15)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (1, 16)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (2, 16)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (3, 16)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (4, 16)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (5, 16)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (6, 16)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (7, 16)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (8, 16)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (10, 16)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (11, 16)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (12, 16)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (13, 16)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (14, 16)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (15, 16)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (16, 16)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (17, 16)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (18, 16)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (19, 16)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (20, 16)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (1, 3)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (2, 3)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (3, 3)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (4, 3)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (5, 3)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (6, 3)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (7, 3)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (8, 3)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (10, 3)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (11, 3)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (12, 3)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (13, 3)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (14, 3)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (15, 3)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (16, 3)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (17, 3)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (18, 3)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (19, 3)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (20, 3)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (1, 4)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (2, 4)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (3, 4)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (4, 4)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (5, 4)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (6, 4)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (7, 4)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (8, 4)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (10, 4)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (11, 4)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (12, 4)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (13, 4)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (14, 4)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (15, 4)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (16, 4)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (17, 4)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (18, 4)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (19, 4)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (20, 4)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (1, 5)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (2, 5)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (3, 5)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (4, 5)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (5, 5)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (6, 5)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (7, 5)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (8, 5)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (10, 5)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (11, 5)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (12, 5)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (13, 5)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (14, 5)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (15, 5)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (16, 5)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (17, 5)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (18, 5)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (19, 5)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (20, 5)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (1, 6)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (2, 6)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (3, 6)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (4, 6)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (5, 6)
GO
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (6, 6)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (7, 6)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (8, 6)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (10, 6)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (11, 6)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (12, 6)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (13, 6)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (14, 6)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (15, 6)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (16, 6)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (17, 6)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (18, 6)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (19, 6)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (20, 6)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (1, 13)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (2, 13)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (3, 13)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (4, 13)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (5, 13)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (6, 13)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (7, 13)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (8, 13)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (10, 13)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (11, 13)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (12, 13)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (13, 13)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (14, 13)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (15, 13)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (16, 13)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (17, 13)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (18, 13)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (19, 13)
INSERT [dbo].[Enroll] ([sid], [gid]) VALUES (20, 13)
GO
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (1, N'View Schedule                                                                                                                                         ', N'/schedule')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (2, N'Take Attend                                                                                                                                           ', N'/attend')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (3, N'View Attend Record                                                                                                                                    ', N'/attendrecord')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (4, N'View Group List                                                                                                                                       ', N'/grouplist')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (5, N'View All Student Attend                                                                                                                               ', N'/stuattend')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (6, N'View Single Student Attend                                                                                                                            ', N'/viewsinglestu')
GO
SET IDENTITY_INSERT [dbo].[Group] ON 

INSERT [dbo].[Group] ([gid], [gname], [lid], [subjectid]) VALUES (3, N'SE1631                                                                                                                                                ', 1, 2)
INSERT [dbo].[Group] ([gid], [gname], [lid], [subjectid]) VALUES (4, N'SE1632                                                                                                                                                ', 3, 1)
INSERT [dbo].[Group] ([gid], [gname], [lid], [subjectid]) VALUES (5, N'SE1633                                                                                                                                                ', 4, 3)
INSERT [dbo].[Group] ([gid], [gname], [lid], [subjectid]) VALUES (6, N'SE1634                                                                                                                                                ', 2, 5)
INSERT [dbo].[Group] ([gid], [gname], [lid], [subjectid]) VALUES (13, N'SE1635                                                                                                                                                ', 5, 6)
INSERT [dbo].[Group] ([gid], [gname], [lid], [subjectid]) VALUES (15, N'SE1632                                                                                                                                                ', 1, 6)
INSERT [dbo].[Group] ([gid], [gname], [lid], [subjectid]) VALUES (16, N'SE1631                                                                                                                                                ', 1, 8)
SET IDENTITY_INSERT [dbo].[Group] OFF
GO
SET IDENTITY_INSERT [dbo].[Lecture] ON 

INSERT [dbo].[Lecture] ([lid], [lname], [depid], [lgender], [lcontract], [username]) VALUES (1, N'sonnt                         ', 1, 1, N'sonnt@fe.edu.vn                                                                                                                                       ', N'sonnt                         ')
INSERT [dbo].[Lecture] ([lid], [lname], [depid], [lgender], [lcontract], [username]) VALUES (2, N'tuanvm                        ', 1, 1, N'tuanvm2@fe.edu.vn                                                                                                                                     ', N'tuanvm                        ')
INSERT [dbo].[Lecture] ([lid], [lname], [depid], [lgender], [lcontract], [username]) VALUES (3, N'thomlth                       ', 1, 0, N'thomlth2@fe.edu.vn                                                                                                                                    ', N'thomlth                       ')
INSERT [dbo].[Lecture] ([lid], [lname], [depid], [lgender], [lcontract], [username]) VALUES (4, N'sonhx                         ', 1, 1, N'sonhx@fe.edu.vn                                                                                                                                       ', N'sonhx                         ')
INSERT [dbo].[Lecture] ([lid], [lname], [depid], [lgender], [lcontract], [username]) VALUES (5, N'hailt                         ', 1, 1, N'hailt@fpt.edu.vn                                                                                                                                      ', N'hailt                         ')
SET IDENTITY_INSERT [dbo].[Lecture] OFF
GO
INSERT [dbo].[Role] ([rid], [rname]) VALUES (1, N'Full Feature                                                                                                                                          ')
GO
INSERT [dbo].[RoleAccount] ([username], [rid]) VALUES (N'hailt                         ', 1)
INSERT [dbo].[RoleAccount] ([username], [rid]) VALUES (N'sonhx                         ', 1)
INSERT [dbo].[RoleAccount] ([username], [rid]) VALUES (N'sonnt                         ', 1)
INSERT [dbo].[RoleAccount] ([username], [rid]) VALUES (N'thomlth                       ', 1)
INSERT [dbo].[RoleAccount] ([username], [rid]) VALUES (N'tuanvm                        ', 1)
GO
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (1, 1)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (1, 2)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (1, 3)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (1, 4)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (1, 5)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (1, 6)
GO
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([roomid], [roomname]) VALUES (1, N'DE-111                                                                                                                                                ')
INSERT [dbo].[Room] ([roomid], [roomname]) VALUES (2, N'DE-222                                                                                                                                                ')
INSERT [dbo].[Room] ([roomid], [roomname]) VALUES (3, N'DE-333                                                                                                                                                ')
INSERT [dbo].[Room] ([roomid], [roomname]) VALUES (4, N'DE-444                                                                                                                                                ')
INSERT [dbo].[Room] ([roomid], [roomname]) VALUES (5, N'DE-555                                                                                                                                                ')
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
SET IDENTITY_INSERT [dbo].[Session] ON 

INSERT [dbo].[Session] ([sessionid], [roomid], [slotid], [gid], [date], [taker], [status]) VALUES (7, 1, 1, 3, CAST(N'2022-06-21' AS Date), 1, 1)
INSERT [dbo].[Session] ([sessionid], [roomid], [slotid], [gid], [date], [taker], [status]) VALUES (8, 2, 2, 4, CAST(N'2022-06-21' AS Date), 3, 0)
INSERT [dbo].[Session] ([sessionid], [roomid], [slotid], [gid], [date], [taker], [status]) VALUES (10, 3, 3, 5, CAST(N'2022-06-25' AS Date), 4, 0)
INSERT [dbo].[Session] ([sessionid], [roomid], [slotid], [gid], [date], [taker], [status]) VALUES (11, 4, 4, 6, CAST(N'2022-06-21' AS Date), 2, 0)
INSERT [dbo].[Session] ([sessionid], [roomid], [slotid], [gid], [date], [taker], [status]) VALUES (12, 1, 2, 3, CAST(N'2022-06-21' AS Date), 1, 1)
INSERT [dbo].[Session] ([sessionid], [roomid], [slotid], [gid], [date], [taker], [status]) VALUES (15, 1, 3, 15, CAST(N'2022-06-21' AS Date), 1, 1)
INSERT [dbo].[Session] ([sessionid], [roomid], [slotid], [gid], [date], [taker], [status]) VALUES (17, 1, 5, 16, CAST(N'2022-06-22' AS Date), 1, 0)
INSERT [dbo].[Session] ([sessionid], [roomid], [slotid], [gid], [date], [taker], [status]) VALUES (18, 3, 1, 3, CAST(N'2022-06-23' AS Date), 1, 1)
INSERT [dbo].[Session] ([sessionid], [roomid], [slotid], [gid], [date], [taker], [status]) VALUES (21, 3, 2, 3, CAST(N'2022-06-23' AS Date), 1, 1)
INSERT [dbo].[Session] ([sessionid], [roomid], [slotid], [gid], [date], [taker], [status]) VALUES (22, 3, 2, 5, CAST(N'2022-06-25' AS Date), 4, 0)
INSERT [dbo].[Session] ([sessionid], [roomid], [slotid], [gid], [date], [taker], [status]) VALUES (23, 1, 1, 3, CAST(N'2022-06-25' AS Date), 1, 1)
INSERT [dbo].[Session] ([sessionid], [roomid], [slotid], [gid], [date], [taker], [status]) VALUES (24, 1, 2, 3, CAST(N'2022-06-25' AS Date), 1, 1)
INSERT [dbo].[Session] ([sessionid], [roomid], [slotid], [gid], [date], [taker], [status]) VALUES (25, 1, 1, 3, CAST(N'2022-06-27' AS Date), 1, 1)
INSERT [dbo].[Session] ([sessionid], [roomid], [slotid], [gid], [date], [taker], [status]) VALUES (27, 1, 2, 3, CAST(N'2022-06-27' AS Date), 1, 1)
INSERT [dbo].[Session] ([sessionid], [roomid], [slotid], [gid], [date], [taker], [status]) VALUES (28, 1, 1, 3, CAST(N'2022-06-29' AS Date), 1, 1)
INSERT [dbo].[Session] ([sessionid], [roomid], [slotid], [gid], [date], [taker], [status]) VALUES (29, 1, 2, 3, CAST(N'2022-06-29' AS Date), 1, 1)
INSERT [dbo].[Session] ([sessionid], [roomid], [slotid], [gid], [date], [taker], [status]) VALUES (30, 1, 2, 3, CAST(N'2022-07-01' AS Date), 1, 1)
INSERT [dbo].[Session] ([sessionid], [roomid], [slotid], [gid], [date], [taker], [status]) VALUES (31, 1, 1, 3, CAST(N'2022-07-01' AS Date), 1, 1)
INSERT [dbo].[Session] ([sessionid], [roomid], [slotid], [gid], [date], [taker], [status]) VALUES (32, 1, 1, 3, CAST(N'2022-07-04' AS Date), 1, 1)
INSERT [dbo].[Session] ([sessionid], [roomid], [slotid], [gid], [date], [taker], [status]) VALUES (33, 1, 2, 3, CAST(N'2022-07-04' AS Date), 1, 1)
INSERT [dbo].[Session] ([sessionid], [roomid], [slotid], [gid], [date], [taker], [status]) VALUES (34, 1, 2, 3, CAST(N'2022-07-06' AS Date), 1, 1)
INSERT [dbo].[Session] ([sessionid], [roomid], [slotid], [gid], [date], [taker], [status]) VALUES (36, 1, 1, 3, CAST(N'2022-07-06' AS Date), 1, 1)
INSERT [dbo].[Session] ([sessionid], [roomid], [slotid], [gid], [date], [taker], [status]) VALUES (38, 1, 2, 3, CAST(N'2022-07-08' AS Date), 1, 1)
INSERT [dbo].[Session] ([sessionid], [roomid], [slotid], [gid], [date], [taker], [status]) VALUES (40, 1, 1, 3, CAST(N'2022-07-11' AS Date), 1, 1)
INSERT [dbo].[Session] ([sessionid], [roomid], [slotid], [gid], [date], [taker], [status]) VALUES (41, 1, 2, 3, CAST(N'2022-07-11' AS Date), 1, 1)
INSERT [dbo].[Session] ([sessionid], [roomid], [slotid], [gid], [date], [taker], [status]) VALUES (42, 1, 1, 15, CAST(N'2022-07-12' AS Date), 1, 0)
INSERT [dbo].[Session] ([sessionid], [roomid], [slotid], [gid], [date], [taker], [status]) VALUES (43, 1, 2, 16, CAST(N'2022-07-12' AS Date), 1, 0)
INSERT [dbo].[Session] ([sessionid], [roomid], [slotid], [gid], [date], [taker], [status]) VALUES (44, 1, 1, 3, CAST(N'2022-07-08' AS Date), 1, 1)
SET IDENTITY_INSERT [dbo].[Session] OFF
GO
SET IDENTITY_INSERT [dbo].[Slot] ON 

INSERT [dbo].[Slot] ([slotid], [slotname], [slotstart], [slotend]) VALUES (1, N'Slot 1                                                                                                                                                ', CAST(N'07:30:00' AS Time), CAST(N'09:00:00' AS Time))
INSERT [dbo].[Slot] ([slotid], [slotname], [slotstart], [slotend]) VALUES (2, N'Slot 2                                                                                                                                                ', CAST(N'09:10:00' AS Time), CAST(N'10:40:00' AS Time))
INSERT [dbo].[Slot] ([slotid], [slotname], [slotstart], [slotend]) VALUES (3, N'Slot 3                                                                                                                                                ', CAST(N'10:50:00' AS Time), CAST(N'12:20:00' AS Time))
INSERT [dbo].[Slot] ([slotid], [slotname], [slotstart], [slotend]) VALUES (4, N'Slot 4                                                                                                                                                ', CAST(N'12:50:00' AS Time), CAST(N'14:20:00' AS Time))
INSERT [dbo].[Slot] ([slotid], [slotname], [slotstart], [slotend]) VALUES (5, N'Slot 5                                                                                                                                                ', CAST(N'14:30:00' AS Time), CAST(N'16:00:00' AS Time))
INSERT [dbo].[Slot] ([slotid], [slotname], [slotstart], [slotend]) VALUES (6, N'Slot 6                                                                                                                                                ', CAST(N'16:10:00' AS Time), CAST(N'17:40:00' AS Time))
SET IDENTITY_INSERT [dbo].[Slot] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([sid], [sname], [sgender], [sdob], [depid], [scode]) VALUES (1, N'MinhNPB                                                                                                                                               ', 1, CAST(N'2002-02-02' AS Date), 1, N'HE1                 ')
INSERT [dbo].[Student] ([sid], [sname], [sgender], [sdob], [depid], [scode]) VALUES (2, N'ThaiNT                                                                                                                                                ', 1, CAST(N'2002-02-02' AS Date), 1, N'HE2                 ')
INSERT [dbo].[Student] ([sid], [sname], [sgender], [sdob], [depid], [scode]) VALUES (3, N'TaiDM                                                                                                                                                 ', 1, CAST(N'2002-02-02' AS Date), 1, N'HE3                 ')
INSERT [dbo].[Student] ([sid], [sname], [sgender], [sdob], [depid], [scode]) VALUES (4, N'ThangTN                                                                                                                                               ', 1, CAST(N'2002-02-02' AS Date), 1, N'HE4                 ')
INSERT [dbo].[Student] ([sid], [sname], [sgender], [sdob], [depid], [scode]) VALUES (5, N'TamND                                                                                                                                                 ', 1, CAST(N'2002-02-02' AS Date), 1, N'HE5                 ')
INSERT [dbo].[Student] ([sid], [sname], [sgender], [sdob], [depid], [scode]) VALUES (6, N'DuongNB                                                                                                                                               ', 1, CAST(N'2002-02-02' AS Date), 1, N'HE6                 ')
INSERT [dbo].[Student] ([sid], [sname], [sgender], [sdob], [depid], [scode]) VALUES (7, N'CuongLV                                                                                                                                               ', 1, CAST(N'2002-02-02' AS Date), 1, N'HE7                 ')
INSERT [dbo].[Student] ([sid], [sname], [sgender], [sdob], [depid], [scode]) VALUES (8, N'TuanDM                                                                                                                                                ', 1, CAST(N'2002-02-02' AS Date), 1, N'HE8                 ')
INSERT [dbo].[Student] ([sid], [sname], [sgender], [sdob], [depid], [scode]) VALUES (10, N'LongCH                                                                                                                                                ', 1, CAST(N'2002-02-02' AS Date), 1, N'HE9                 ')
INSERT [dbo].[Student] ([sid], [sname], [sgender], [sdob], [depid], [scode]) VALUES (11, N'DungAL                                                                                                                                                ', 1, CAST(N'2002-02-02' AS Date), 1, N'HE10                ')
INSERT [dbo].[Student] ([sid], [sname], [sgender], [sdob], [depid], [scode]) VALUES (12, N'TruongVQ                                                                                                                                              ', 1, CAST(N'2002-02-02' AS Date), 1, N'HE11                ')
INSERT [dbo].[Student] ([sid], [sname], [sgender], [sdob], [depid], [scode]) VALUES (13, N'HuyVQ                                                                                                                                                 ', 1, CAST(N'2002-02-02' AS Date), 1, N'HE12                ')
INSERT [dbo].[Student] ([sid], [sname], [sgender], [sdob], [depid], [scode]) VALUES (14, N'TungHX                                                                                                                                                ', 1, CAST(N'2002-02-02' AS Date), 1, N'HE13                ')
INSERT [dbo].[Student] ([sid], [sname], [sgender], [sdob], [depid], [scode]) VALUES (15, N'VuHX                                                                                                                                                  ', 1, CAST(N'2002-02-02' AS Date), 1, N'HE14                ')
INSERT [dbo].[Student] ([sid], [sname], [sgender], [sdob], [depid], [scode]) VALUES (16, N'QuangHX                                                                                                                                               ', 1, CAST(N'2002-02-02' AS Date), 1, N'HE15                ')
INSERT [dbo].[Student] ([sid], [sname], [sgender], [sdob], [depid], [scode]) VALUES (17, N'HuyHX                                                                                                                                                 ', 1, CAST(N'2002-02-02' AS Date), 1, N'HE16                ')
INSERT [dbo].[Student] ([sid], [sname], [sgender], [sdob], [depid], [scode]) VALUES (18, N'DaoHV                                                                                                                                                 ', 1, CAST(N'2002-02-02' AS Date), 1, N'HE17                ')
INSERT [dbo].[Student] ([sid], [sname], [sgender], [sdob], [depid], [scode]) VALUES (19, N'GaHX                                                                                                                                                  ', 1, CAST(N'2002-02-02' AS Date), 1, N'HE18                ')
INSERT [dbo].[Student] ([sid], [sname], [sgender], [sdob], [depid], [scode]) VALUES (20, N'BaVQ                                                                                                                                                  ', 1, CAST(N'2002-02-02' AS Date), 1, N'HE19                ')
INSERT [dbo].[Student] ([sid], [sname], [sgender], [sdob], [depid], [scode]) VALUES (21, N'AoCH                                                                                                                                                  ', 0, CAST(N'2002-02-02' AS Date), 1, N'HE20                ')
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([subjectid], [subjectname]) VALUES (1, N'MAS291                                                                                                                                                ')
INSERT [dbo].[Subject] ([subjectid], [subjectname]) VALUES (2, N'PRJ301                                                                                                                                                ')
INSERT [dbo].[Subject] ([subjectid], [subjectname]) VALUES (3, N'IOT102                                                                                                                                                ')
INSERT [dbo].[Subject] ([subjectid], [subjectname]) VALUES (4, N'JPD123                                                                                                                                                ')
INSERT [dbo].[Subject] ([subjectid], [subjectname]) VALUES (5, N'PRO192                                                                                                                                                ')
INSERT [dbo].[Subject] ([subjectid], [subjectname]) VALUES (6, N'PRF192                                                                                                                                                ')
INSERT [dbo].[Subject] ([subjectid], [subjectname]) VALUES (7, N'CSD201                                                                                                                                                ')
INSERT [dbo].[Subject] ([subjectid], [subjectname]) VALUES (8, N'DBI201                                                                                                                                                ')
SET IDENTITY_INSERT [dbo].[Subject] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Lecture] FOREIGN KEY([userid])
REFERENCES [dbo].[Lecture] ([lid])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Lecture]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Student] FOREIGN KEY([sid])
REFERENCES [dbo].[Student] ([sid])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Student]
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD  CONSTRAINT [FK_Enroll_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[Enroll] CHECK CONSTRAINT [FK_Enroll_Group]
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD  CONSTRAINT [FK_Enroll_Student] FOREIGN KEY([sid])
REFERENCES [dbo].[Student] ([sid])
GO
ALTER TABLE [dbo].[Enroll] CHECK CONSTRAINT [FK_Enroll_Student]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Lecture] FOREIGN KEY([lid])
REFERENCES [dbo].[Lecture] ([lid])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Lecture]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Subject] FOREIGN KEY([subjectid])
REFERENCES [dbo].[Subject] ([subjectid])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Subject]
GO
ALTER TABLE [dbo].[Lecture]  WITH CHECK ADD  CONSTRAINT [FK_Lecture_Department] FOREIGN KEY([depid])
REFERENCES [dbo].[Department] ([depid])
GO
ALTER TABLE [dbo].[Lecture] CHECK CONSTRAINT [FK_Lecture_Department]
GO
ALTER TABLE [dbo].[RoleAccount]  WITH CHECK ADD  CONSTRAINT [FK_Role Account_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[RoleAccount] CHECK CONSTRAINT [FK_Role Account_Account]
GO
ALTER TABLE [dbo].[RoleAccount]  WITH CHECK ADD  CONSTRAINT [FK_Role Account_Role] FOREIGN KEY([rid])
REFERENCES [dbo].[Role] ([rid])
GO
ALTER TABLE [dbo].[RoleAccount] CHECK CONSTRAINT [FK_Role Account_Role]
GO
ALTER TABLE [dbo].[RoleFeature]  WITH CHECK ADD  CONSTRAINT [FK_Role Feature_Feature] FOREIGN KEY([fid])
REFERENCES [dbo].[Feature] ([fid])
GO
ALTER TABLE [dbo].[RoleFeature] CHECK CONSTRAINT [FK_Role Feature_Feature]
GO
ALTER TABLE [dbo].[RoleFeature]  WITH CHECK ADD  CONSTRAINT [FK_Role Feature_Role] FOREIGN KEY([rid])
REFERENCES [dbo].[Role] ([rid])
GO
ALTER TABLE [dbo].[RoleFeature] CHECK CONSTRAINT [FK_Role Feature_Role]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Group]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Lecture] FOREIGN KEY([taker])
REFERENCES [dbo].[Lecture] ([lid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Lecture]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Room] FOREIGN KEY([roomid])
REFERENCES [dbo].[Room] ([roomid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Room]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Slot] FOREIGN KEY([slotid])
REFERENCES [dbo].[Slot] ([slotid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Slot]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department] FOREIGN KEY([depid])
REFERENCES [dbo].[Department] ([depid])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Department]
GO
USE [master]
GO
ALTER DATABASE [Assignment] SET  READ_WRITE 
GO
