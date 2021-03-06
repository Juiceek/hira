USE [master]
GO
/****** Object:  Database [Hira]    Script Date: 22.02.2016 6:22:26 ******/
CREATE DATABASE [Hira]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hira', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Hira.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Hira_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Hira_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Hira] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hira].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hira] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hira] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hira] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hira] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hira] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hira] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Hira] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Hira] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hira] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hira] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hira] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hira] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hira] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hira] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hira] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hira] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Hira] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hira] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hira] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hira] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hira] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hira] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Hira] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hira] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Hira] SET  MULTI_USER 
GO
ALTER DATABASE [Hira] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hira] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hira] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hira] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Hira]
GO
/****** Object:  Table [dbo].[AppModules]    Script Date: 22.02.2016 6:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppModules](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AppModules] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 22.02.2016 6:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 22.02.2016 6:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 22.02.2016 6:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 22.02.2016 6:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 22.02.2016 6:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoleModules]    Script Date: 22.02.2016 6:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleModules](
	[Role_Id] [nvarchar](128) NOT NULL,
	[Module_Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.RoleModules] PRIMARY KEY CLUSTERED 
(
	[Role_Id] ASC,
	[Module_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[AppModules] ([Id], [Name]) VALUES (N'0218d2af-e920-45ac-88f7-173d93682e26', N'Module1')
GO
INSERT [dbo].[AppModules] ([Id], [Name]) VALUES (N'e912d4de-5c12-4f0d-b292-737095b5ae11', N'ModuleApp2')
GO
INSERT [dbo].[AppModules] ([Id], [Name]) VALUES (N'c7ced45d-1822-4403-80c5-777a479a2b7d', N'eeee1111')
GO
INSERT [dbo].[AppModules] ([Id], [Name]) VALUES (N'0a7319a5-b2cd-4678-978b-d8fa08ab91d7', N'ModuleApp3')
GO
INSERT [dbo].[AppModules] ([Id], [Name]) VALUES (N'c36a6d7f-a7b7-43be-a505-ddd0ace35215', N'Module4444')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [Discriminator]) VALUES (N'0c39bbb6-836b-4b08-9c68-d29d8f250155', N'role44', N'AppRole')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [Discriminator]) VALUES (N'49a005b2-08e9-4465-8bc7-e020768dd5b1', N'rtret role', N'AppRole')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [Discriminator]) VALUES (N'7cbafc7f-1a39-4012-9679-d0059c06ef42', N'role2', N'AppRole')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [Discriminator]) VALUES (N'853c4a58-78b0-474a-8343-c5e90deeed9d', N'administrators', N'AppRole')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [Discriminator]) VALUES (N'9afaf9a1-c315-40a9-a92d-0fa679bc396f', N'5555', N'AppRole')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [Discriminator]) VALUES (N'bf9c92d5-3d77-4499-adcf-dcd4b446c1cd', N'fwefewf', N'AppRole')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [Discriminator]) VALUES (N'db8b4389-9b44-48a6-9edc-6bfddc94bea3', N'role3', N'AppRole')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [Discriminator]) VALUES (N'fa9b9ef1-aefd-422d-a754-d98293bdd00a', N'qwdqdqw', N'AppRole')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [Discriminator]) VALUES (N'fe83042e-c902-41b2-b004-15d46807eb8a', N'ghtrhrt', N'AppRole')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1985c610-7be6-443b-b58a-b2c9a64b7dce', N'0c39bbb6-836b-4b08-9c68-d29d8f250155')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1985c610-7be6-443b-b58a-b2c9a64b7dce', N'7cbafc7f-1a39-4012-9679-d0059c06ef42')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'70a56857-65c2-409d-9660-2d7831db3304', N'7cbafc7f-1a39-4012-9679-d0059c06ef42')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd0ab6889-8aee-4133-8393-bab9fa84c99e', N'7cbafc7f-1a39-4012-9679-d0059c06ef42')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1985c610-7be6-443b-b58a-b2c9a64b7dce', N'853c4a58-78b0-474a-8343-c5e90deeed9d')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd0ab6889-8aee-4133-8393-bab9fa84c99e', N'853c4a58-78b0-474a-8343-c5e90deeed9d')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'70a56857-65c2-409d-9660-2d7831db3304', N'db8b4389-9b44-48a6-9edc-6bfddc94bea3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd0ab6889-8aee-4133-8393-bab9fa84c99e', N'db8b4389-9b44-48a6-9edc-6bfddc94bea3')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1985c610-7be6-443b-b58a-b2c9a64b7dce', N'', 0, N'AMPJN6Lm8BaPbVs8e7eIiBkzWfOgETDWko8XUduCF5j8w95ggvcoTTHqQ2cb8TZytw==', N'4c81f543-6216-43b3-89c2-94f19de2cec9', N'', 0, 0, NULL, 0, 0, N'123456')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'70a56857-65c2-409d-9660-2d7831db3304', N'qwerty', 0, N'AEPaTTBZWnf6WDP11AfzzgYya/o/ix1aaOX8WodwwVMsX9X6QQqM59UpEHLa7e5r8w==', N'd11dd06c-49d4-4670-8cc0-2c76bf2e9006', N'', 0, 0, NULL, 0, 0, N'qwerty')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7ce437ba-8389-48e4-876e-90194a82d18a', N'test@test.com', 0, N'AOfU2Dc8GHlCX6hDd9BZxbWBBdx0gnW6k95+gSgN/+2EvHgP+/Rtdjjop3CJ8zDedg==', N'af6fae8c-a9e0-4908-8677-941a0bfc9fac', N'999998898', 0, 0, NULL, 1, 0, N'test@test.com')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'bca444c8-c272-47e8-90b5-5001dd804c49', N'rwrwe', 0, NULL, N'fe40cbe6-db06-4fe4-a14c-8ae6ac564af0', N'', 0, 0, NULL, 0, 0, N'rrrrr')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c96ad5ef-1be5-49de-a3a3-6984242b4dea', N'23432423', 0, N'AGkdg4/zKnm1/sE4DNjtVQHFr5OZPWt8yUkNW8xLPXC4X0sJBq1ATzrLnB/M0iOHUw==', N'1d10fec6-cb71-4816-92cb-f7cc0b1d9ab7', N'2131231', 0, 0, NULL, 0, 0, N'23432423')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd0ab6889-8aee-4133-8393-bab9fa84c99e', N'', 0, N'ANa319o9QzH8tmbq6v7JoXZfiNdp7oGH7vkToovgQPjY4prqh3xgfx7Nq2BQ21pBag==', N'16bf7475-abc5-487f-aa0f-16e16114d9fb', N'', 0, 0, NULL, 0, 0, N'dbContextRolesToList')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e8648e2f-6944-44c0-b63a-287b54d105d8', N'test11111@test.com', 0, N'AHWtgfPzuMiwd5tWFVXi0Quo59t6EkDZmxUIY3ZsjP52LhC/aO8muIImf6nXk4jC0A==', N'3d6aa3e0-219b-49b1-a9bf-89c562f126cf', NULL, 0, 0, NULL, 1, 0, N'test11111@test.com')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ef62a1c3-0d13-44e7-910d-2e44e5362f52', N'34543@rewew.com', 0, N'AF0j9+zwltPlwQddYEvIe/bzJU0IiudI8+7OH5vjHz0wMlsli/o1i66ZdRXq0xBGIw==', N'7b11edf2-799b-47c1-b077-921cc4c4c15a', N'fewfewfew', 0, 0, NULL, 0, 0, N'543543rterte')
GO
INSERT [dbo].[RoleModules] ([Role_Id], [Module_Id]) VALUES (N'0c39bbb6-836b-4b08-9c68-d29d8f250155', N'0218d2af-e920-45ac-88f7-173d93682e26')
GO
INSERT [dbo].[RoleModules] ([Role_Id], [Module_Id]) VALUES (N'0c39bbb6-836b-4b08-9c68-d29d8f250155', N'e912d4de-5c12-4f0d-b292-737095b5ae11')
GO
INSERT [dbo].[RoleModules] ([Role_Id], [Module_Id]) VALUES (N'49a005b2-08e9-4465-8bc7-e020768dd5b1', N'0218d2af-e920-45ac-88f7-173d93682e26')
GO
INSERT [dbo].[RoleModules] ([Role_Id], [Module_Id]) VALUES (N'49a005b2-08e9-4465-8bc7-e020768dd5b1', N'e912d4de-5c12-4f0d-b292-737095b5ae11')
GO
INSERT [dbo].[RoleModules] ([Role_Id], [Module_Id]) VALUES (N'49a005b2-08e9-4465-8bc7-e020768dd5b1', N'c7ced45d-1822-4403-80c5-777a479a2b7d')
GO
INSERT [dbo].[RoleModules] ([Role_Id], [Module_Id]) VALUES (N'49a005b2-08e9-4465-8bc7-e020768dd5b1', N'0a7319a5-b2cd-4678-978b-d8fa08ab91d7')
GO
INSERT [dbo].[RoleModules] ([Role_Id], [Module_Id]) VALUES (N'7cbafc7f-1a39-4012-9679-d0059c06ef42', N'e912d4de-5c12-4f0d-b292-737095b5ae11')
GO
INSERT [dbo].[RoleModules] ([Role_Id], [Module_Id]) VALUES (N'853c4a58-78b0-474a-8343-c5e90deeed9d', N'e912d4de-5c12-4f0d-b292-737095b5ae11')
GO
INSERT [dbo].[RoleModules] ([Role_Id], [Module_Id]) VALUES (N'853c4a58-78b0-474a-8343-c5e90deeed9d', N'c7ced45d-1822-4403-80c5-777a479a2b7d')
GO
INSERT [dbo].[RoleModules] ([Role_Id], [Module_Id]) VALUES (N'9afaf9a1-c315-40a9-a92d-0fa679bc396f', N'0218d2af-e920-45ac-88f7-173d93682e26')
GO
INSERT [dbo].[RoleModules] ([Role_Id], [Module_Id]) VALUES (N'9afaf9a1-c315-40a9-a92d-0fa679bc396f', N'e912d4de-5c12-4f0d-b292-737095b5ae11')
GO
INSERT [dbo].[RoleModules] ([Role_Id], [Module_Id]) VALUES (N'fe83042e-c902-41b2-b004-15d46807eb8a', N'e912d4de-5c12-4f0d-b292-737095b5ae11')
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 22.02.2016 6:22:26 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 22.02.2016 6:22:26 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 22.02.2016 6:22:26 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 22.02.2016 6:22:26 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 22.02.2016 6:22:26 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 22.02.2016 6:22:26 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[RoleModules]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RoleModules_dbo.AppModules_Module_Id] FOREIGN KEY([Module_Id])
REFERENCES [dbo].[AppModules] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleModules] CHECK CONSTRAINT [FK_dbo.RoleModules_dbo.AppModules_Module_Id]
GO
ALTER TABLE [dbo].[RoleModules]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RoleModules_dbo.AspNetRoles_Role_Id] FOREIGN KEY([Role_Id])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleModules] CHECK CONSTRAINT [FK_dbo.RoleModules_dbo.AspNetRoles_Role_Id]
GO
USE [master]
GO
ALTER DATABASE [Hira] SET  READ_WRITE 
GO
