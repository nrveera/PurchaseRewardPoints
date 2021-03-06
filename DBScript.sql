USE [master]
GO
/****** Object:  Database [rewardpoints]    Script Date: 29-05-2022 18:08:16 ******/
CREATE DATABASE [rewardpoints]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'rewardpoints', FILENAME = N'D:\Interview\rewardpoints.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'rewardpoints_log', FILENAME = N'D:\Interview\rewardpoints_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [rewardpoints] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [rewardpoints].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [rewardpoints] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [rewardpoints] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [rewardpoints] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [rewardpoints] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [rewardpoints] SET ARITHABORT OFF 
GO
ALTER DATABASE [rewardpoints] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [rewardpoints] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [rewardpoints] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [rewardpoints] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [rewardpoints] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [rewardpoints] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [rewardpoints] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [rewardpoints] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [rewardpoints] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [rewardpoints] SET  DISABLE_BROKER 
GO
ALTER DATABASE [rewardpoints] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [rewardpoints] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [rewardpoints] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [rewardpoints] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [rewardpoints] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [rewardpoints] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [rewardpoints] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [rewardpoints] SET RECOVERY FULL 
GO
ALTER DATABASE [rewardpoints] SET  MULTI_USER 
GO
ALTER DATABASE [rewardpoints] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [rewardpoints] SET DB_CHAINING OFF 
GO
ALTER DATABASE [rewardpoints] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [rewardpoints] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [rewardpoints] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'rewardpoints', N'ON'
GO
ALTER DATABASE [rewardpoints] SET QUERY_STORE = OFF
GO
USE [rewardpoints]
GO
/****** Object:  Table [dbo].[dberrors]    Script Date: 29-05-2022 18:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dberrors](
	[ErrorID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NULL,
	[ErrorNumber] [int] NULL,
	[ErrorState] [int] NULL,
	[ErrorSeverity] [int] NULL,
	[ErrorLine] [int] NULL,
	[ErrorProcedure] [varchar](max) NULL,
	[ErrorMessage] [varchar](max) NULL,
	[ErrorDateTime] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rewardpoints]    Script Date: 29-05-2022 18:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rewardpoints](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[usermobile] [bigint] NULL,
	[purchaseamount] [decimal](18, 2) NULL,
	[rewardpoint] [int] NULL,
	[expirydate] [date] NULL,
	[createddate] [datetime] NULL,
 CONSTRAINT [PK_rewardpoints] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userdetails]    Script Date: 29-05-2022 18:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userdetails](
	[usermobile] [bigint] NOT NULL,
	[totalpurchase] [decimal](18, 2) NULL,
	[totalrewards] [int] NULL,
	[expiredrewards] [int] NULL,
	[activerewards] [int] NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
 CONSTRAINT [PK_userdetails] PRIMARY KEY CLUSTERED 
(
	[usermobile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[rewardpoints] ON 

INSERT [dbo].[rewardpoints] ([id], [usermobile], [purchaseamount], [rewardpoint], [expirydate], [createddate]) VALUES (4, 234, CAST(400.00 AS Decimal(18, 2)), 650, CAST(N'2023-05-24' AS Date), CAST(N'2022-05-29T17:46:29.050' AS DateTime))
INSERT [dbo].[rewardpoints] ([id], [usermobile], [purchaseamount], [rewardpoint], [expirydate], [createddate]) VALUES (5, 123, CAST(400.00 AS Decimal(18, 2)), 650, CAST(N'2023-05-24' AS Date), CAST(N'2022-05-29T17:48:03.813' AS DateTime))
INSERT [dbo].[rewardpoints] ([id], [usermobile], [purchaseamount], [rewardpoint], [expirydate], [createddate]) VALUES (6, 123, CAST(100.00 AS Decimal(18, 2)), 50, CAST(N'2023-05-24' AS Date), CAST(N'2022-05-29T17:48:30.080' AS DateTime))
SET IDENTITY_INSERT [dbo].[rewardpoints] OFF
GO
INSERT [dbo].[userdetails] ([usermobile], [totalpurchase], [totalrewards], [expiredrewards], [activerewards], [createddate], [updateddate]) VALUES (123, CAST(500.00 AS Decimal(18, 2)), 700, NULL, 700, CAST(N'2022-05-29T17:44:50.427' AS DateTime), CAST(N'2022-05-29T17:48:30.080' AS DateTime))
INSERT [dbo].[userdetails] ([usermobile], [totalpurchase], [totalrewards], [expiredrewards], [activerewards], [createddate], [updateddate]) VALUES (234, CAST(400.00 AS Decimal(18, 2)), 650, NULL, 650, CAST(N'2022-05-29T17:46:29.047' AS DateTime), CAST(N'2022-05-29T17:46:29.073' AS DateTime))
GO
/****** Object:  StoredProcedure [dbo].[sp_userrewards]    Script Date: 29-05-2022 18:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_userrewards](@ctype varchar(50),@usermobile varchar(20),@purchaseamount varchar(20))
AS

  BEGIN TRY
    BEGIN TRANSACTION
	DECLARE @reward AS int=0
		IF(@ctype='addpurchase')
			BEGIN
			IF NOT EXISTS(SELECT * FROM userdetails WITH(NOLOCK) WHERE usermobile=CONVERT(bigint,@usermobile))
			BEGIN
			INSERT INTO userdetails VALUES(CONVERT(bigint,@usermobile),0,0,0,0,GETDATE(),GETDATE())
			END
			SET @reward=IIF(CONVERT(decimal(18,2),@purchaseamount)>50,CONVERT(INT,(Floor(CONVERT(decimal(18,2),@purchaseamount))-50)*1),@reward )
			SET @reward=IIF(CONVERT(decimal(18,2),@purchaseamount)>100,@reward+CONVERT(INT,(Floor(CONVERT(decimal(18,2),@purchaseamount))-100)*1),@reward )
			INSERT INTO rewardpoints(usermobile,purchaseamount,rewardpoint,expirydate,createddate) VALUES(CONVERT(bigint,@usermobile),CONVERT(decimal(18,2),@purchaseamount),@reward,DATEADD(day,360,GETDATE()),GETDATE())
			UPDATE userdetails SET totalpurchase=(SELECT SUM(purchaseamount) FROM rewardpoints WITH(NOLOCK) WHERE usermobile=CONVERT(bigint,@usermobile)) WHERE usermobile=CONVERT(bigint,@usermobile) 
			UPDATE userdetails SET totalrewards=(SELECT SUM(rewardpoint) FROM rewardpoints WITH(NOLOCK) WHERE usermobile=CONVERT(bigint,@usermobile)) WHERE usermobile=CONVERT(bigint,@usermobile)
			UPDATE userdetails SET expiredrewards=(SELECT SUM(rewardpoint) FROM rewardpoints WITH(NOLOCK) WHERE usermobile=CONVERT(bigint,@usermobile) AND expirydate<GETDATE()) WHERE usermobile=CONVERT(bigint,@usermobile)
			UPDATE userdetails SET activerewards=(SELECT SUM(rewardpoint) FROM rewardpoints WITH(NOLOCK) WHERE usermobile=CONVERT(bigint,@usermobile) AND expirydate>=GETDATE()),updateddate=GETDATE() WHERE usermobile=CONVERT(bigint,@usermobile)
			SELECT usermobile,totalpurchase,totalrewards,expiredrewards,activerewards,@reward as currentreward from userdetails WITH(NOLOCK) WHERE usermobile=CONVERT(bigint,@usermobile)
			END
		ELSE IF(@ctype='getbymobile')
			BEGIN
				SELECT usermobile,totalpurchase,totalrewards,expiredrewards,activerewards,@reward as currentreward from userdetails WITH(NOLOCK) WHERE usermobile=CONVERT(bigint,@usermobile)
			
			END
		ELSE IF(@ctype='gethistorybymobile')
			BEGIN
				SELECT usermobile,purchaseamount,rewardpoint,expirydate,createddate FROM rewardpoints WITH(NOLOCK) WHERE usermobile=CONVERT(bigint,@usermobile) ORDER BY createddate DESC
			END
		
    COMMIT TRANSACTION
  END TRY
  BEGIN CATCH
    INSERT INTO dbo.dberrors
    VALUES
  (SUSER_SNAME(),
   ERROR_NUMBER(),
   ERROR_STATE(),
   ERROR_SEVERITY(),
   ERROR_LINE(),
   ERROR_PROCEDURE(),
   ERROR_MESSAGE(),
   GETDATE());
 
-- Transaction uncommittable
    IF (XACT_STATE()) = -1
      ROLLBACK TRANSACTION
 
-- Transaction committable
    IF (XACT_STATE()) = 1
      COMMIT TRANSACTION
  END CATCH
GO
USE [master]
GO
ALTER DATABASE [rewardpoints] SET  READ_WRITE 
GO
