USE [master]
GO
/****** Object:  Database [university]    Script Date: 5/8/2019 10:45:06 AM ******/
CREATE DATABASE [university]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'university', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\university.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'university_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\university_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [university] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [university].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [university] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [university] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [university] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [university] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [university] SET ARITHABORT OFF 
GO
ALTER DATABASE [university] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [university] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [university] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [university] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [university] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [university] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [university] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [university] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [university] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [university] SET  DISABLE_BROKER 
GO
ALTER DATABASE [university] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [university] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [university] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [university] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [university] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [university] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [university] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [university] SET RECOVERY FULL 
GO
ALTER DATABASE [university] SET  MULTI_USER 
GO
ALTER DATABASE [university] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [university] SET DB_CHAINING OFF 
GO
ALTER DATABASE [university] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [university] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [university] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'university', N'ON'
GO
ALTER DATABASE [university] SET QUERY_STORE = OFF
GO
USE [university]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 5/8/2019 10:45:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[depName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentDep]    Script Date: 5/8/2019 10:45:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentDep](
	[StudentID] [int] NOT NULL,
	[DepID] [int] NOT NULL,
 CONSTRAINT [PK_StudentDep] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[DepID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 5/8/2019 10:45:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([ID], [depName]) VALUES (1, N'CS')
INSERT [dbo].[Department] ([ID], [depName]) VALUES (2, N'IS')
INSERT [dbo].[Department] ([ID], [depName]) VALUES (3, N'SYS')
INSERT [dbo].[Department] ([ID], [depName]) VALUES (4, N'BIO')
INSERT [dbo].[Department] ([ID], [depName]) VALUES (7, N'Management')
INSERT [dbo].[Department] ([ID], [depName]) VALUES (8, N'Accounting')
INSERT [dbo].[Department] ([ID], [depName]) VALUES (14, N'test')
SET IDENTITY_INSERT [dbo].[Department] OFF
INSERT [dbo].[StudentDep] ([StudentID], [DepID]) VALUES (1, 1)
INSERT [dbo].[StudentDep] ([StudentID], [DepID]) VALUES (2, 1)
INSERT [dbo].[StudentDep] ([StudentID], [DepID]) VALUES (2, 3)
INSERT [dbo].[StudentDep] ([StudentID], [DepID]) VALUES (3, 1)
INSERT [dbo].[StudentDep] ([StudentID], [DepID]) VALUES (3, 2)
INSERT [dbo].[StudentDep] ([StudentID], [DepID]) VALUES (4, 3)
INSERT [dbo].[StudentDep] ([StudentID], [DepID]) VALUES (5, 2)
INSERT [dbo].[StudentDep] ([StudentID], [DepID]) VALUES (6, 1)
INSERT [dbo].[StudentDep] ([StudentID], [DepID]) VALUES (6, 2)
INSERT [dbo].[StudentDep] ([StudentID], [DepID]) VALUES (7, 2)
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([ID], [StudentName]) VALUES (1, N'Ahmed')
INSERT [dbo].[Students] ([ID], [StudentName]) VALUES (2, N'Salem')
INSERT [dbo].[Students] ([ID], [StudentName]) VALUES (3, N'Samy')
INSERT [dbo].[Students] ([ID], [StudentName]) VALUES (4, N'Aml')
INSERT [dbo].[Students] ([ID], [StudentName]) VALUES (5, N'Noha')
INSERT [dbo].[Students] ([ID], [StudentName]) VALUES (6, N'Mohamed')
INSERT [dbo].[Students] ([ID], [StudentName]) VALUES (7, N'Aya')
SET IDENTITY_INSERT [dbo].[Students] OFF
ALTER TABLE [dbo].[StudentDep]  WITH CHECK ADD FOREIGN KEY([DepID])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[StudentDep]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([ID])
GO
USE [master]
GO
ALTER DATABASE [university] SET  READ_WRITE 
GO
