/****** Object:  Database [test_proc]    Script Date: 24/02/2021 10:52:41 AM ******/
CREATE DATABASE [test_proc]  (EDITION = 'GeneralPurpose', SERVICE_OBJECTIVE = 'GP_Gen5_2', MAXSIZE = 32 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
GO
ALTER DATABASE [test_proc] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [test_proc] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [test_proc] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [test_proc] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [test_proc] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [test_proc] SET ARITHABORT OFF 
GO
ALTER DATABASE [test_proc] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [test_proc] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [test_proc] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [test_proc] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [test_proc] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [test_proc] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [test_proc] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [test_proc] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [test_proc] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [test_proc] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [test_proc] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [test_proc] SET  MULTI_USER 
GO
ALTER DATABASE [test_proc] SET ENCRYPTION ON
GO
ALTER DATABASE [test_proc] SET QUERY_STORE = ON
GO
ALTER DATABASE [test_proc] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO

/****** Object:  View [dbo].[Data_Tables_View]    Script Date: 24/02/2021 10:52:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Data_Tables_View](table_prefix)
AS
	select left(name,charindex('_',name)-1)
		from sys.tables
		where name like '%_Data_Table';
GO
/****** Object:  Table [dbo].[Binary_Data_Table]    Script Date: 24/02/2021 10:52:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Binary_Data_Table](
	[_ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Environment_Date_Map_Table]    Script Date: 24/02/2021 10:52:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Environment_Date_Map_Table](
	[TestEnvironmentName] [char](5) NOT NULL,
	[RealEnvironmentName] [char](10) NOT NULL,
	[DateFrom] [datetime] NOT NULL,
	[DateTo] [datetime] NULL,
 CONSTRAINT [PK_ENV] PRIMARY KEY CLUSTERED 
(
	[TestEnvironmentName] ASC,
	[RealEnvironmentName] ASC,
	[DateFrom] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Host_Environment_Url_Table]    Script Date: 24/02/2021 10:52:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Host_Environment_Url_Table](
	[RealEnvironmentName] [char](10) NOT NULL,
	[SystemName] [char](50) NOT NULL,
	[HostURL] [char](150) NOT NULL,
 CONSTRAINT [PK_ENV_SYS] PRIMARY KEY CLUSTERED 
(
	[RealEnvironmentName] ASC,
	[SystemName] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Host_Url_Resources_Table]    Script Date: 24/02/2021 10:52:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Host_Url_Resources_Table](
	[SystemName] [char](50) NOT NULL,
	[TestName] [char](20) NOT NULL,
	[ApiVersion] [char](5) NOT NULL,
	[DevName] [char](50) NULL,
	[UrlPath] [char](150) NOT NULL,
 CONSTRAINT [PK_RES] PRIMARY KEY CLUSTERED 
(
	[SystemName] ASC,
	[TestName] ASC,
	[ApiVersion] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Test_Data_Files_Table]    Script Date: 24/02/2021 10:52:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test_Data_Files_Table](
	[RealEnvironmentName] [char](10) NOT NULL,
	[SystemName] [char](50) NOT NULL,
	[TestName] [char](50) NOT NULL,
	[ApiVersion] [char](5) NOT NULL,
	[FileName] [char](50) NOT NULL,
	[TablePrefix] [char](6) NOT NULL,
	[DataFileID] [int] NULL,
 CONSTRAINT [PK_FILE] PRIMARY KEY CLUSTERED 
(
	[RealEnvironmentName] ASC,
	[SystemName] ASC,
	[TestName] ASC,
	[ApiVersion] ASC,
	[FileName] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Text_Data_Table]    Script Date: 24/02/2021 10:52:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Text_Data_Table](
	[_ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XML_Data_Table]    Script Date: 24/02/2021 10:52:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XML_Data_Table](
	[_ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [xml] NULL,
PRIMARY KEY CLUSTERED 
(
	[_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[getHostUrl]    Script Date: 24/02/2021 10:52:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getHostUrl](
	@TestEnvName CHAR(10),
	@SystemName CHAR(50),
	@TestName CHAR(50),
	@Version CHAR(5),
	@out char(250) OUT
	)
AS
Begin
	DECLARE @baseUrl char(100),
			@resource char(150)

	set @baseUrl = ( 
		select hostUrl
			from Host_Environment_Url_table
			where systemName = @SystemName
			and RealEnvironmentName = ( 
				select RealEnvironmentName
					from Environment_Date_Map_table
					where TestEnvironmentName = @TestEnvName
					and DateFrom <= CURRENT_TIMESTAMP
					and DateTo > CURRENT_TIMESTAMP )
	)

	set @resource = (
		select UrlPath
			from Host_Url_Resources_Table
			where SystemName = @SystemName
			and TestName = @TestName
			and ApiVersion = @Version

	)

	SET @out = CONCAT( TRIM(@baseUrl), TRIM(@resource))

END
GO
/****** Object:  StoredProcedure [dbo].[getTestData]    Script Date: 24/02/2021 10:52:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getTestData]
    @TestEnvName CHAR(10),
	@SystemName CHAR(50),
	@TestName CHAR(50),
	@Version CHAR(5),
	@Filename char(50) OUTPUT,
	@out varchar(MAX) OUTPUT
AS
BEGIN
	DECLARE @RealEnvName char(10)
			,@TablePrefix VARCHAR(30)
			,@ID CHAR(10); 

	set @RealEnvName = (
		select RealEnvironmentName
			from Environment_Date_Map_table
			where TestEnvironmentName = @TestEnvName
			and DateFrom <= CURRENT_TIMESTAMP
			and DateTo > CURRENT_TIMESTAMP 
	)

	set @Filename = (
		select FileName
			from Test_Data_Files_Table
			where SystemName = @SystemName
			and TestName = @TestName
			and ApiVersion = @Version
			and RealEnvironmentName = @RealEnvName
	)

	set @TablePrefix = (
		select TRIM(TablePrefix)
			from Test_Data_Files_Table
			where SystemName = @SystemName
			and TestName = @TestName
			and ApiVersion = @Version
			and RealEnvironmentName = @RealEnvName
	)

	set @ID = (
		select DataFileID
			from Test_Data_Files_Table
			where SystemName = @SystemName
			and TestName = @TestName
			and ApiVersion = @Version
			and RealEnvironmentName = @RealEnvName
	)

	if @TablePrefix = 'Text'
		set @out = ( select  Content 
						from  Text_Data_Table
						where _ID =  @ID
		)
	
	if @TablePrefix = 'Binary'
		set @out = ( select  Content 
						from  Binary_Data_Table
						where _ID =  @ID
		)
	
	if @TablePrefix = 'XML'
		set @out = ( select  CONVERT(VARCHAR(MAX),Content )
						from  XML_Data_Table
						where _ID =  @ID
		)	

END;
GO

EXEC sys.sp_addextendedproperty @name=N'microsoft_database_tools_support', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysdiagrams'
GO
ALTER DATABASE [test_proc] SET  READ_WRITE 
GO
