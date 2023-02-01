USE [master]
GO
/****** Object:  Database [DCMS_BHS]    Script Date: 7/19/2022 9:08:34 AM ******/
CREATE DATABASE [DCMS_BHS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DCMS_BHS', FILENAME = N'D:\SQLData\DCMS_BHS.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DCMS_BHS_log', FILENAME = N'D:\SQLData\DCMS_BHS_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DCMS_BHS] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DCMS_BHS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DCMS_BHS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DCMS_BHS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DCMS_BHS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DCMS_BHS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DCMS_BHS] SET ARITHABORT OFF 
GO
ALTER DATABASE [DCMS_BHS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DCMS_BHS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DCMS_BHS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DCMS_BHS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DCMS_BHS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DCMS_BHS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DCMS_BHS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DCMS_BHS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DCMS_BHS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DCMS_BHS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DCMS_BHS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DCMS_BHS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DCMS_BHS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DCMS_BHS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DCMS_BHS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DCMS_BHS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DCMS_BHS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DCMS_BHS] SET RECOVERY FULL 
GO
ALTER DATABASE [DCMS_BHS] SET  MULTI_USER 
GO
ALTER DATABASE [DCMS_BHS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DCMS_BHS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DCMS_BHS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DCMS_BHS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DCMS_BHS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DCMS_BHS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DCMS_BHS] SET QUERY_STORE = OFF
GO
USE [DCMS_BHS]
GO
/****** Object:  User [DevelopmentUser]    Script Date: 7/19/2022 9:08:34 AM ******/
CREATE USER [DevelopmentUser] FOR LOGIN [DevelopmentUser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [DevelopmentUser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [DevelopmentUser]
GO
/****** Object:  UserDefinedTableType [dbo].[BaggageHandlingFlightSync]    Script Date: 7/19/2022 9:08:34 AM ******/
CREATE TYPE [dbo].[BaggageHandlingFlightSync] AS TABLE(
	[APPN_ROW_ID] [numeric](18, 0) NOT NULL,
	[FLT] [varchar](8) NULL,
	[FLC] [varchar](3) NULL,
	[FLN] [varchar](4) NULL,
	[ORG] [varchar](3) NULL,
	[STA] [datetime] NULL,
	[ATA] [datetime] NULL,
	[RCP] [varchar](3) NULL,
	[CAR] [varchar](8) NULL,
	[CPR] [varchar](8) NULL,
	[GAT] [varchar](8) NULL
)
GO
/****** Object:  Table [dbo].[CURRENT_ARRIVALS]    Script Date: 7/19/2022 9:08:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CURRENT_ARRIVALS](
	[ROW_CREATE_TIME] [datetime] NULL,
	[ROW_DATE_TIME] [datetime] NULL,
	[CUSER] [varchar](30) NULL,
	[MUSER] [varchar](30) NULL,
	[MTERM] [varchar](64) NULL,
	[SOURCE] [varchar](8) NULL,
	[TO_BE_ARCHIVED] [varchar](1) NULL,
	[APPN_ROW_ID] [numeric](18, 0) NOT NULL,
	[SYSTEM_ID] [numeric](4, 0) NOT NULL,
	[AID] [numeric](18, 0) NOT NULL,
	[LID] [numeric](18, 0) NULL,
	[FLC] [varchar](3) NOT NULL,
	[PID] [numeric](18, 0) NULL,
	[FLN] [varchar](4) NULL,
	[TID] [numeric](18, 0) NULL,
	[FLT] [varchar](8) NOT NULL,
	[TOW] [varchar](1) NULL,
	[FLR] [numeric](2, 0) NOT NULL,
	[VID] [numeric](18, 0) NULL,
	[ACM] [varchar](3) NULL,
	[SDT] [datetime] NOT NULL,
	[CAN] [varchar](1) NULL,
	[SDP] [datetime] NULL,
	[DVA] [varchar](3) NULL,
	[LKF] [varchar](8) NULL,
	[LKS] [datetime] NULL,
	[STA] [datetime] NOT NULL,
	[EET] [numeric](4, 0) NULL,
	[LKR] [numeric](2, 0) NULL,
	[FID] [numeric](18, 0) NULL,
	[STP] [datetime] NULL,
	[EDP] [datetime] NULL,
	[SST] [varchar](2) NOT NULL,
	[ABP] [datetime] NULL,
	[MFF] [varchar](8) NULL,
	[ETA] [datetime] NULL,
	[MFR] [numeric](2, 0) NULL,
	[LTA] [datetime] NULL,
	[ORG] [varchar](3) NOT NULL,
	[LAX] [varchar](1) NULL,
	[VI1] [varchar](3) NULL,
	[TDT] [datetime] NULL,
	[VI2] [varchar](3) NULL,
	[ATA] [datetime] NULL,
	[VI3] [varchar](3) NULL,
	[PTA] [datetime] NULL,
	[VI4] [varchar](3) NULL,
	[IR1] [varchar](4) NULL,
	[VI5] [varchar](3) NULL,
	[IR2] [varchar](4) NULL,
	[TOF] [varchar](1) NOT NULL,
	[DL1] [numeric](4, 0) NULL,
	[NAT] [varchar](3) NOT NULL,
	[DL2] [numeric](4, 0) NULL,
	[HDL] [varchar](3) NULL,
	[HD1] [varchar](3) NULL,
	[REG] [varchar](10) NULL,
	[CAP] [numeric](3, 0) NULL,
	[HD2] [varchar](3) NULL,
	[CRW] [numeric](3, 0) NULL,
	[HD3] [varchar](3) NULL,
	[CGA] [numeric](6, 0) NULL,
	[HD4] [varchar](3) NULL,
	[HD5] [varchar](3) NULL,
	[MLA] [numeric](6, 0) NULL,
	[DDL] [numeric](7, 0) NULL,
	[ROS] [varchar](1) NULL,
	[ROP] [varchar](1) NULL,
	[TER] [varchar](8) NULL,
	[ROB] [varchar](1) NULL,
	[TAR] [varchar](8) NULL,
	[RCG] [varchar](3) NULL,
	[SPL] [varchar](10) NOT NULL,
	[RCS] [varchar](3) NULL,
	[TAS] [varchar](1) NULL,
	[RCB] [varchar](3) NULL,
	[TAL] [varchar](10) NOT NULL,
	[RCP] [varchar](3) NULL,
	[PAX] [numeric](3, 0) NULL,
	[RWY] [varchar](8) NULL,
	[PX1] [numeric](3, 0) NULL,
	[TYS] [varchar](3) NOT NULL,
	[NIT] [datetime] NULL,
	[PX2] [numeric](3, 0) NULL,
	[EA1] [datetime] NULL,
	[PX3] [numeric](3, 0) NULL,
	[EA2] [datetime] NULL,
	[PX4] [numeric](3, 0) NULL,
	[EA3] [datetime] NULL,
	[PX5] [numeric](3, 0) NULL,
	[PLT] [varchar](8) NOT NULL,
	[PLC] [varchar](3) NOT NULL,
	[CAR] [varchar](8) NULL,
	[CR2] [varchar](8) NULL,
	[FBT] [datetime] NULL,
	[LBT] [datetime] NULL,
	[TEF] [varchar](8) NOT NULL,
	[GAT] [varchar](8) NULL,
	[GT2] [varchar](8) NULL,
	[GAL] [varchar](10) NULL,
	[FST] [varchar](1) NOT NULL,
	[SIT] [varchar](512) NULL,
	[BUS] [varchar](1) NULL,
	[TRA] [varchar](1) NULL,
	[XD1] [datetime] NULL,
	[XD3] [datetime] NULL,
	[XD2] [datetime] NULL,
	[XD4] [datetime] NULL,
	[XN1] [numeric](18, 0) NULL,
	[XN3] [numeric](18, 0) NULL,
	[XN2] [numeric](18, 0) NULL,
	[XN4] [numeric](18, 0) NULL,
	[XV1] [varchar](40) NULL,
	[XV3] [varchar](40) NULL,
	[XV2] [varchar](40) NULL,
	[XV4] [varchar](40) NULL,
	[AA1] [datetime] NULL,
	[AA2] [datetime] NULL,
	[WCH] [numeric](2, 0) NULL,
	[AA3] [datetime] NULL,
	[RM1] [varchar](40) NULL,
	[UCT] [varchar](1) NULL,
	[RM2] [varchar](80) NULL,
	[CTY] [varchar](30) NULL,
	[CT1] [varchar](30) NULL,
	[CT2] [varchar](30) NULL,
	[CT3] [varchar](30) NULL,
	[CT4] [varchar](30) NULL,
	[CT5] [varchar](30) NULL,
	[RO1] [datetime] NULL,
	[RC1] [datetime] NULL,
	[RO2] [datetime] NULL,
	[RC2] [datetime] NULL,
	[SEC] [varchar](1) NULL,
	[TFI] [varchar](180) NULL,
	[BG2] [numeric](6, 0) NULL,
	[GOT] [datetime] NULL,
	[GVF] [varchar](1) NULL,
	[GCT] [datetime] NULL,
	[GAS] [varchar](1) NULL,
	[SIG] [varchar](1) NULL,
	[FLX] [varchar](1) NULL,
	[IFC] [varchar](3) NULL,
	[IFF] [varchar](8) NULL,
	[ILC] [varchar](3) NULL,
	[ILF] [varchar](8) NULL,
	[IMC] [varchar](3) NULL,
	[IMF] [varchar](8) NULL,
	[LKC] [varchar](3) NULL,
	[LKN] [varchar](4) NULL,
	[LKX] [varchar](1) NULL,
	[MFC] [varchar](3) NULL,
	[MFN] [varchar](4) NULL,
	[MFX] [varchar](1) NULL,
	[PGT] [varchar](1) NULL,
	[BTG] [varchar](8) NULL,
	[CPR] [varchar](8) NULL,
 CONSTRAINT [CURRENT_ARRIVALS_PK] PRIMARY KEY CLUSTERED 
(
	[APPN_ROW_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAirline]    Script Date: 7/19/2022 9:08:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAirline](
	[RecordID] [int] NOT NULL,
	[Airline_Code] [varchar](3) NULL,
	[ICAO] [varchar](255) NULL,
	[CarrierName] [varchar](255) NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_tblCarrier] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblApiKey]    Script Date: 7/19/2022 9:08:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblApiKey](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[ApiKey] [varchar](128) NOT NULL,
	[FeatureFlags] [varchar](20) NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tblApiKey] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCarousel]    Script Date: 7/19/2022 9:08:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCarousel](
	[CarouselID] [varchar](8) NOT NULL,
	[Terminal] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_tblCarousel] PRIMARY KEY CLUSTERED 
(
	[CarouselID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEventLog]    Script Date: 7/19/2022 9:08:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEventLog](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[FlightRecordID] [int] NULL,
	[EventTypeID] [int] NULL,
	[DeviceID] [varchar](50) NULL,
	[UserID] [varchar](50) NULL,
	[CurrentCarousel] [varchar](2) NULL,
	[NewCarousel] [varchar](2) NULL,
	[EventMessage] [varchar](max) NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_tblEventLog] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEventType]    Script Date: 7/19/2022 9:08:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEventType](
	[EventTypeID] [int] IDENTITY(1,1) NOT NULL,
	[EventName] [varchar](50) NOT NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_tblEventType] PRIMARY KEY CLUSTERED 
(
	[EventTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFlights]    Script Date: 7/19/2022 9:08:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFlights](
	[FlightRecordID] [int] IDENTITY(1,1) NOT NULL,
	[APPN_ROW_ID] [numeric](18, 0) NOT NULL,
	[FLT] [varchar](8) NULL,
	[FLC] [varchar](3) NULL,
	[FLN] [varchar](4) NULL,
	[ORG] [varchar](3) NULL,
	[STA] [datetime] NULL,
	[ATA] [datetime] NULL,
	[FirstBag] [datetime] NULL,
	[LastBag] [datetime] NULL,
	[RCP] [varchar](3) NULL,
	[CAR] [varchar](8) NULL,
	[CPR] [varchar](8) NULL,
	[GAT] [varchar](8) NULL,
	[LastModifiedDate] [datetime] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_tblFlights] PRIMARY KEY CLUSTERED 
(
	[FlightRecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFlightStatus]    Script Date: 7/19/2022 9:08:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFlightStatus](
	[StatusID] [varchar](3) NOT NULL,
	[StatusName] [varchar](50) NOT NULL,
	[IsLanded] [bit] NOT NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_tblFlightStatus] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLocation]    Script Date: 7/19/2022 9:08:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLocation](
	[IATA_CODE] [varchar](255) NOT NULL,
	[ICAO_CODE] [varchar](255) NULL,
	[NAME] [varchar](255) NULL,
	[COUNTRY] [varchar](255) NULL,
	[COUNTRY_SYMBOL] [varchar](255) NULL,
	[FLIGHT_SECTOR] [varchar](255) NULL,
	[ALT_LANGUAGE] [float] NULL,
	[ELAPSED_TIME_JET] [varchar](255) NULL,
	[ELAPSED_TIME_PROP] [varchar](255) NULL,
	[DESCRIPTION] [varchar](255) NULL,
	[MAXFLTS] [varchar](255) NULL,
	[LATITUDE] [float] NULL,
	[LONGITUDE] [float] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_tblLocation] PRIMARY KEY CLUSTERED 
(
	[IATA_CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_tblAirline]    Script Date: 7/19/2022 9:08:34 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblAirline] ON [dbo].[tblAirline]
(
	[Airline_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_tblFlights]    Script Date: 7/19/2022 9:08:34 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblFlights] ON [dbo].[tblFlights]
(
	[APPN_ROW_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CURRENT_ARRIVALS] ADD  DEFAULT ((0)) FOR [SYSTEM_ID]
GO
ALTER TABLE [dbo].[CURRENT_ARRIVALS] ADD  DEFAULT ((0)) FOR [FLR]
GO
ALTER TABLE [dbo].[CURRENT_ARRIVALS] ADD  DEFAULT ((0)) FOR [LKR]
GO
ALTER TABLE [dbo].[CURRENT_ARRIVALS] ADD  DEFAULT ('00') FOR [SST]
GO
ALTER TABLE [dbo].[CURRENT_ARRIVALS] ADD  DEFAULT ((0)) FOR [MFR]
GO
ALTER TABLE [dbo].[CURRENT_ARRIVALS] ADD  DEFAULT ('Active') FOR [SPL]
GO
ALTER TABLE [dbo].[CURRENT_ARRIVALS] ADD  DEFAULT ('Active') FOR [TAL]
GO
ALTER TABLE [dbo].[CURRENT_ARRIVALS] ADD  DEFAULT ('Active') FOR [GAL]
GO
ALTER TABLE [dbo].[tblAirline] ADD  CONSTRAINT [DF_tblAirline_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[tblApiKey] ADD  CONSTRAINT [DF_tblApiKey_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[tblCarousel] ADD  CONSTRAINT [DF_tblCarousel_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[tblEventLog] ADD  CONSTRAINT [DF_tblEventLog_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[tblEventType] ADD  CONSTRAINT [DF_tblEventType_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[tblFlights] ADD  CONSTRAINT [DF_tblTugData_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[tblFlightStatus] ADD  CONSTRAINT [DF_tblFlightStatus_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[tblLocation] ADD  CONSTRAINT [DF_tblLocation_CreatDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[tblEventLog]  WITH CHECK ADD  CONSTRAINT [FK_tblEventLog_tblEventType] FOREIGN KEY([EventTypeID])
REFERENCES [dbo].[tblEventType] ([EventTypeID])
GO
ALTER TABLE [dbo].[tblEventLog] CHECK CONSTRAINT [FK_tblEventLog_tblEventType]
GO
ALTER TABLE [dbo].[tblFlights]  WITH CHECK ADD  CONSTRAINT [FK_tblFlights_tblAirline] FOREIGN KEY([FLC])
REFERENCES [dbo].[tblAirline] ([Airline_Code])
GO
ALTER TABLE [dbo].[tblFlights] CHECK CONSTRAINT [FK_tblFlights_tblAirline]
GO
ALTER TABLE [dbo].[tblFlights]  WITH CHECK ADD  CONSTRAINT [FK_tblFlights_tblCarousel] FOREIGN KEY([CAR])
REFERENCES [dbo].[tblCarousel] ([CarouselID])
GO
ALTER TABLE [dbo].[tblFlights] CHECK CONSTRAINT [FK_tblFlights_tblCarousel]
GO
ALTER TABLE [dbo].[tblFlights]  WITH CHECK ADD  CONSTRAINT [FK_tblFlights_tblFlightStatus] FOREIGN KEY([RCP])
REFERENCES [dbo].[tblFlightStatus] ([StatusID])
GO
ALTER TABLE [dbo].[tblFlights] CHECK CONSTRAINT [FK_tblFlights_tblFlightStatus]
GO
USE [master]
GO
ALTER DATABASE [DCMS_BHS] SET  READ_WRITE 
GO
