/*
Run this Script on your Engage Database
You are recommended to back up your database before running this script
Script created by SQL Compare version 14.7.8.21163 from Red Gate Software Ltd at 11/2/2022 10:25:41 AM
*/
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL Serializable
GO
BEGIN TRANSACTION
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating types'
GO
CREATE TYPE [dbo].[ZoomSync4] AS TABLE
(
[RoomID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ZoomStatus] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ZoomSyncTime] [datetime] NULL,
[UCIPAddress] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ZoomRoomID] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ZoomHealth] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
CREATE TYPE [dbo].[ZoomSync3] AS TABLE
(
[RoomID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ZoomStatus] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ZoomSyncTime] [datetime] NULL,
[UCIPAddress] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ZoomRoomID] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
CREATE TYPE [dbo].[ZoomSync2] AS TABLE
(
[RoomID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ZoomStatus] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ZoomSyncTime] [datetime] NULL,
[UCIPAddress] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
CREATE TYPE [dbo].[ServiceNowSyncV2] AS TABLE
(
[Id] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Number] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[RoomId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Building] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Opened_at] [datetime] NULL,
[Closed_at] [datetime] NULL,
[LastUpdated] [datetime] NULL,
[Short_Description] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Category] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Contact_Type] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Priority] [int] NULL,
[Severity] [int] NULL,
[Urgency] [int] NULL,
[Incident_State] [int] NULL,
[InteractionCount] [int] NULL,
[Close_Notes] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Requester_Name] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Requester_Title] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Requester_Email] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Assigned_Name] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Assigned_Title] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Assigned_Email] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
CREATE TYPE [dbo].[MyFacilitiesSync9] AS TABLE
(
[Room] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RoomName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SiteCode] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SiteDesc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BuildingCode] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BuildingDesc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Floor] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SpaceType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SpaceTypeDesc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RoomType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Capacity] [float] NULL,
[Reservable] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OutlookName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AVEquip] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COVID_CONF] [bit] NULL,
[EngageType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RSRVRSTRCT] [bit] NULL,
[RSRVRSTRC2] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EngageEnabled] [bit] NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
CREATE TYPE [dbo].[MyFacilitiesSync8] AS TABLE
(
[Room] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RoomName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SiteCode] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SiteDesc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BuildingCode] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BuildingDesc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Floor] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SpaceType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SpaceTypeDesc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RoomType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Capacity] [float] NULL,
[Reservable] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OutlookName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AVEquip] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COVID_CONF] [bit] NULL,
[RSRVRSTRCT] [bit] NULL,
[RSRVRSTRC2] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EngageEnabled] [bit] NULL,
[EngageType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
CREATE TYPE [dbo].[MyFacilitiesSync7] AS TABLE
(
[Room] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RoomName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SiteCode] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SiteDesc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BuildingCode] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BuildingDesc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Floor] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SpaceType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SpaceTypeDesc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RoomType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Capacity] [float] NULL,
[Reservable] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OutlookName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AVEquip] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COVID_CONF] [bit] NULL,
[EngageType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
CREATE TYPE [dbo].[MyFacilitiesSync6] AS TABLE
(
[Room] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RoomName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SiteCode] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SiteDesc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BuildingCode] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BuildingDesc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Floor] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SpaceType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SpaceTypeDesc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RoomType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Capacity] [float] NULL,
[Reservable] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OutlookName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AVEquip] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COVID_CONF] [bit] NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
CREATE TYPE [dbo].[MyFacilitiesSync5] AS TABLE
(
[Room] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RoomName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SiteCode] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SiteDesc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BuildingCode] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BuildingDesc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Floor] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SpaceType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SpaceTypeDesc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RoomType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Capacity] [float] NULL,
[Reservable] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OutlookName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AVEquip] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COVID_CONF] [bit] NULL,
[RSRVRSTRCT] [bit] NULL,
[RSRVRSTRC2] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EngageEnabled] [bit] NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
CREATE TYPE [dbo].[MyFacilitiesSync4] AS TABLE
(
[Room] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RoomName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SiteCode] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SiteDesc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BuildingCode] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BuildingDesc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Floor] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SpaceType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SpaceTypeDesc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RoomType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Capacity] [float] NULL,
[Reservable] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OutlookName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AVEquip] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COVID_CONF] [bit] NULL,
[EngageEnabled] [bit] NULL,
[RSRVRSTRCT] [bit] NULL,
[RSRVRSTRC2] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
CREATE TYPE [dbo].[MyFacilitiesSync3] AS TABLE
(
[Room] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RoomName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SiteCode] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SiteDesc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BuildingCode] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BuildingDesc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Floor] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SpaceType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SpaceTypeDesc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RoomType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Capacity] [float] NULL,
[Reservable] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OutlookName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AVEquip] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COVID_CONF] [bit] NULL,
[EngageEnabled] [bit] NULL,
[RSRVRSTRCT] [bit] NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
CREATE TYPE [dbo].[MyFacilitiesSync2] AS TABLE
(
[Room] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RoomName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SiteCode] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SiteDesc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BuildingCode] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BuildingDesc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Floor] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SpaceType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SpaceTypeDesc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RoomType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Capacity] [float] NULL,
[Reservable] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OutlookName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AVEquip] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COVID_CONF] [bit] NULL,
[EngageEnabled] [bit] NULL,
[RSRVRSTRCT] [bit] NULL,
[RSRVRSTRC2] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[tblMonitorItem]'
GO
CREATE TABLE [dbo].[tblMonitorItem]
(
[MonitorItemID] [int] NOT NULL,
[Description] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MonitorTypeID] [int] NULL,
[DeviceTypeID] [int] NULL,
[DLLVersion] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DefaultFrequency] [int] NULL,
[Alert] [bit] NOT NULL CONSTRAINT [DF_tblMonitoritem_Alert] DEFAULT ((1)),
[AlertFrequency] [int] NOT NULL CONSTRAINT [DF_tblMonitoritem_AlertFrequency] DEFAULT ((0)),
[MonitorType] [int] NULL,
[ItemTypeID] [int] NULL,
[CompareTypeID] [int] NULL,
[ErrorValue] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ErrorDescription] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreateDate] [datetime] NULL CONSTRAINT [DF_tblMonitoritem_CreateDate] DEFAULT (getdate()),
[LastEditUser] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastEditDate] [datetime] NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_tblMonitor] on [dbo].[tblMonitorItem]'
GO
ALTER TABLE [dbo].[tblMonitorItem] ADD CONSTRAINT [PK_tblMonitor] PRIMARY KEY CLUSTERED ([MonitorItemID])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[tblAlert]'
GO
CREATE TABLE [dbo].[tblAlert]
(
[RecordID] [int] NOT NULL IDENTITY(1, 1),
[MessageID] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomerID] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DeviceID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AlertHeartbeat] [datetime] NULL,
[MonitorItemID] [int] NOT NULL,
[ValueVarchar] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ErrorLevel] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CurrentAlertState] [int] NULL CONSTRAINT [DF_tblAlert_DataSyncSent1] DEFAULT ((1)),
[NotifyEmail] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ActiveEvent] [bit] NOT NULL CONSTRAINT [DF_tblAlert_ActiveEvent_1] DEFAULT ((0)),
[AlertNotificationSentTime] [datetime] NULL,
[AlertResolveTime] [datetime] NULL,
[ResolveNotificationSentTime] [datetime] NULL,
[LastEditDate] [datetime] NULL CONSTRAINT [DF_tblAlert_LastModified_1] DEFAULT (getutcdate()),
[LastEditUser] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreateDate] [datetime] NULL CONSTRAINT [DF_tblAlert_LogDate1] DEFAULT (getutcdate())
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_tblAlert] on [dbo].[tblAlert]'
GO
ALTER TABLE [dbo].[tblAlert] ADD CONSTRAINT [PK_tblAlert] PRIMARY KEY CLUSTERED ([RecordID])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[tblDeviceType]'
GO
CREATE TABLE [dbo].[tblDeviceType]
(
[DeviceTypeID] [int] NOT NULL,
[Description] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_tblDeviceType] on [dbo].[tblDeviceType]'
GO
ALTER TABLE [dbo].[tblDeviceType] ADD CONSTRAINT [PK_tblDeviceType] PRIMARY KEY CLUSTERED ([DeviceTypeID])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[tblCompareType]'
GO
CREATE TABLE [dbo].[tblCompareType]
(
[CompareTypeID] [int] NOT NULL IDENTITY(1, 1),
[Operator] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LastEditUser] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastEditDate] [datetime] NULL,
[CreateDate] [datetime] NULL CONSTRAINT [DF_tblCompareType_CreateDate] DEFAULT (getdate())
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_tblCompareType] on [dbo].[tblCompareType]'
GO
ALTER TABLE [dbo].[tblCompareType] ADD CONSTRAINT [PK_tblCompareType] PRIMARY KEY CLUSTERED ([CompareTypeID])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[tblMonitorItemType]'
GO
CREATE TABLE [dbo].[tblMonitorItemType]
(
[ItemTypeID] [int] NOT NULL IDENTITY(1, 1),
[Description] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreateDate] [datetime] NULL CONSTRAINT [DF_tblMonitorItemType_CreateDate] DEFAULT (getdate()),
[LastEditUser] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastEditDate] [datetime] NULL,
[ErrorLevel] [int] NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_tblItemType] on [dbo].[tblMonitorItemType]'
GO
ALTER TABLE [dbo].[tblMonitorItemType] ADD CONSTRAINT [PK_tblItemType] PRIMARY KEY CLUSTERED ([ItemTypeID])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[tblMonitorType]'
GO
CREATE TABLE [dbo].[tblMonitorType]
(
[MonitorTypeID] [int] NOT NULL,
[Description] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreateDate] [datetime] NULL CONSTRAINT [DF_tblMonitorType_CreateDate] DEFAULT (getdate()),
[LastEditUser] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastEditDate] [datetime] NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_tblMonitorType] on [dbo].[tblMonitorType]'
GO
ALTER TABLE [dbo].[tblMonitorType] ADD CONSTRAINT [PK_tblMonitorType] PRIMARY KEY CLUSTERED ([MonitorTypeID])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[tblErrorLevel]'
GO
CREATE TABLE [dbo].[tblErrorLevel]
(
[ErrorLevel] [int] NOT NULL,
[Description] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreateDate] [datetime] NULL CONSTRAINT [DF_tblErrorLevel_CreateDate] DEFAULT (getdate()),
[LastEditUser] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastEditDate] [datetime] NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_tblErrorLevel] on [dbo].[tblErrorLevel]'
GO
ALTER TABLE [dbo].[tblErrorLevel] ADD CONSTRAINT [PK_tblErrorLevel] PRIMARY KEY CLUSTERED ([ErrorLevel])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[tblScriptLog]'
GO
CREATE TABLE [dbo].[tblScriptLog]
(
[RecordID] [int] NOT NULL IDENTITY(1, 1),
[DeviceID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomerID] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LogTime] [datetime] NULL,
[ScriptName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ReturnValue] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Frequency] [int] NULL,
[ErrorLevel] [int] NULL,
[CreateDate] [datetime] NULL CONSTRAINT [DF_tblScriptLog_CreateDate] DEFAULT (getdate())
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_tblScriptLog] on [dbo].[tblScriptLog]'
GO
ALTER TABLE [dbo].[tblScriptLog] ADD CONSTRAINT [PK_tblScriptLog] PRIMARY KEY CLUSTERED ([RecordID])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[View_RoomCalendarSyncTime]'
GO
CREATE VIEW [dbo].[View_RoomCalendarSyncTime]
AS
SELECT        TOP (100) PERCENT dbo.tblDevice.DeviceID, dbo.tblRoom.RoomName, dbo.tblDevice.Description, dbo.tblDevice.SyncStatus, dbo.tblDevice.SyncTime, dbo.tblRoom.CalendarSyncTime
FROM            dbo.tblDevice LEFT OUTER JOIN
                         dbo.tblRoom ON dbo.tblDevice.RoomID = dbo.tblRoom.RoomID
ORDER BY dbo.tblDevice.SyncTime DESC
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[fun_FriendlierDateFull]'
GO


CREATE FUNCTION  [dbo].[fun_FriendlierDateFull] (@minutes int)
RETURNS nvarchar(100)
AS
BEGIN
   return CASE 
    when @minutes < 60 then cast( @minutes as varchar(10)) + ' minutes'
    when @minutes < 1440 then cast(@minutes/60 as varchar(10)) + ' hours ' + cast(@minutes%60 as varchar(10)) + ' minutes'
    else cast(@minutes/(1440 ) as varchar(10)) + ' days ' + cast((@minutes%1440 )/60 as varchar(10)) + ' hours ' + cast(((@minutes%1440 )%60) as varchar(10)) + ' minutes'
    END
END
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[View_KPI_AllOpenTickets]'
GO
CREATE VIEW [dbo].[View_KPI_AllOpenTickets]
AS
SELECT        dbo.tblServiceNow.Id, dbo.tblServiceNow.Number, dbo.tblServiceNow.RoomID, dbo.tblServiceNow.Building, dbo.tblServiceNow.Opened_At, DATEDIFF(mi, dbo.tblServiceNow.Opened_At, GETDATE()) AS OpenMinutes, 
                         dbo.fun_FriendlierDateFull(DATEDIFF(mi, dbo.tblServiceNow.Opened_At, GETDATE())) AS FriendlyDate, dbo.tblServiceNow.LastUpdated, dbo.tblServiceNow.Short_Description, dbo.tblServiceNow.Description, 
                         dbo.tblServiceNow.Category, dbo.tblServiceNow.Contact_Type, dbo.tblServiceNow.Priority, dbo.tblServiceNow.Severity, dbo.tblServiceNow.Urgency, dbo.tblSeviceNowIncidentState.Description AS Incident_State, 
                         dbo.tblServiceNow.InteractionCount, dbo.tblServiceNow.Close_Notes, dbo.tblServiceNow.Requester_Name, dbo.tblServiceNow.Requester_Title, dbo.tblServiceNow.Requester_Email, dbo.tblServiceNow.Assigned_Name, 
                         dbo.tblServiceNow.Assigned_Title, dbo.tblServiceNow.Assigned_Email, dbo.tblServiceNow.CreateDate
FROM            dbo.tblServiceNow LEFT OUTER JOIN
                         dbo.tblSeviceNowIncidentState ON dbo.tblServiceNow.Incident_State = dbo.tblSeviceNowIncidentState.Incident_State
WHERE        (dbo.tblServiceNow.Incident_State <> 7)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[fun_FriendlyDate]'
GO

CREATE FUNCTION  [dbo].[fun_FriendlyDate] (@minutes int)
RETURNS nvarchar(100)
AS
BEGIN
   return CASE 
    when @minutes < 60 then cast( @minutes as varchar(10)) + 'm'
    when @minutes < 1440 then cast(@minutes/60 as varchar(10)) + 'h ' + cast(@minutes%60 as varchar(10)) + 'm'
    else cast(@minutes/(1440 ) as varchar(10)) + 'd ' + cast((@minutes%1440 )/60 as varchar(10)) + 'h ' + cast(((@minutes%1440 )%60) as varchar(10)) + 'm'
    END
END
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[View_KPI_AllClosedTickets]'
GO
CREATE VIEW [dbo].[View_KPI_AllClosedTickets]
AS
SELECT        Id, Number, RoomID, Building, Opened_At, Closed_At, DATEDIFF(mi, Opened_At, Closed_At) AS TimeToClose, dbo.fun_FriendlyDate(DATEDIFF(mi, Opened_At, Closed_At)) AS FriendlyDate, LastUpdated, Short_Description, 
                         Description, Category, Contact_Type, Priority, Severity, Urgency, Incident_State, InteractionCount, Close_Notes, Requester_Title, Requester_Email, Requester_Name, Assigned_Name, Assigned_Title, Assigned_Email, 
                         CreateDate
FROM            dbo.tblServiceNow
WHERE        (Incident_State = 7)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[View_KPI_AvgCloseTimeLast30Days]'
GO
CREATE VIEW [dbo].[View_KPI_AvgCloseTimeLast30Days]
AS
SELECT        COUNT(TimeToClose) AS ClosedCount, AVG(TimeToClose) AS AvgTimeToClose
FROM            dbo.View_KPI_AllClosedTickets
WHERE        (Closed_At BETWEEN GETDATE() - 30 AND GETDATE())
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[View_KPI_IncidentsByState]'
GO
CREATE VIEW [dbo].[View_KPI_IncidentsByState]
AS
SELECT        dbo.tblServiceNow.Incident_State, dbo.tblSeviceNowIncidentState.Description AS IncidentStateDescription, COUNT(dbo.tblServiceNow.Number) AS Count
FROM            dbo.tblServiceNow INNER JOIN
                         dbo.tblSeviceNowIncidentState ON dbo.tblServiceNow.Incident_State = dbo.tblSeviceNowIncidentState.Incident_State
GROUP BY dbo.tblServiceNow.Incident_State, dbo.tblSeviceNowIncidentState.Description
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[View_KPI_OldestTicketByState]'
GO
CREATE VIEW [dbo].[View_KPI_OldestTicketByState]
AS
SELECT        MIN(dbo.tblServiceNow.Opened_At) AS OldestIncidentDate, dbo.tblServiceNow.Incident_State, dbo.tblSeviceNowIncidentState.Description AS IncidentStateDescription
FROM            dbo.tblServiceNow INNER JOIN
                         dbo.tblSeviceNowIncidentState ON dbo.tblServiceNow.Incident_State = dbo.tblSeviceNowIncidentState.Incident_State
WHERE        (dbo.tblServiceNow.Incident_State <> 6)
GROUP BY dbo.tblServiceNow.Incident_State, dbo.tblSeviceNowIncidentState.Description
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[View_KPI_Downtime]'
GO
CREATE VIEW [dbo].[View_KPI_Downtime]
AS
SELECT        dbo.tblAlert.DeviceID, dbo.tblDevice.Description, dbo.tblDevice.DeviceTypeID, dbo.tblDeviceType.Description AS DeviceTypeDesc, CONVERT(VARCHAR(10), dbo.tblAlert.AlertHeartbeat, 101) AS DownDate, 
                         dbo.tblAlert.AlertHeartbeat, CASE WHEN dbo.tblAlert.AlertResolveTime IS NULL THEN getDate() ELSE dbo.tblAlert.AlertResolveTime END AS ResolveTime, DATEDIFF(s, dbo.tblAlert.AlertHeartbeat, 
                         CASE WHEN dbo.tblAlert.AlertResolveTime IS NULL THEN getDate() ELSE dbo.tblAlert.AlertResolveTime END) AS Downtime
FROM            dbo.tblDeviceType RIGHT OUTER JOIN
                         dbo.tblDevice ON dbo.tblDeviceType.DeviceTypeID = dbo.tblDevice.DeviceTypeID RIGHT OUTER JOIN
                         dbo.tblAlert ON dbo.tblDevice.DeviceID = dbo.tblAlert.DeviceID
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[View_KPI_OldestTicket]'
GO
CREATE VIEW [dbo].[View_KPI_OldestTicket]
AS
SELECT        dbo.tblServiceNow.Number, dbo.tblServiceNow.RoomID, dbo.tblServiceNow.Building, dbo.tblServiceNow.Opened_At, dbo.tblServiceNow.LastUpdated, dbo.tblServiceNow.Short_Description, dbo.tblServiceNow.Description, 
                         dbo.tblServiceNow.Category, dbo.tblServiceNow.Contact_Type, 'P' + CAST(dbo.tblServiceNow.Priority AS varchar) AS Priority, dbo.tblServiceNow.Severity, dbo.tblServiceNow.Urgency, dbo.tblServiceNow.Incident_State, 
                         dbo.tblSeviceNowIncidentState.Description AS IncidentStateDescription, dbo.tblServiceNow.InteractionCount, dbo.tblServiceNow.Close_Notes, dbo.tblServiceNow.Requester_Name, dbo.tblServiceNow.Requester_Title, 
                         dbo.tblServiceNow.Requester_Email, dbo.tblServiceNow.Assigned_Name, dbo.tblServiceNow.Assigned_Title, dbo.tblServiceNow.Assigned_Email, dbo.tblServiceNow.CreateDate, dbo.tblServiceNow.Id
FROM            dbo.tblServiceNow INNER JOIN
                         dbo.tblSeviceNowIncidentState ON dbo.tblServiceNow.Incident_State = dbo.tblSeviceNowIncidentState.Incident_State
WHERE        (dbo.tblServiceNow.Opened_At =
                             (SELECT        MIN(Opened_At) AS Expr1
                               FROM            dbo.tblServiceNow AS tblServiceNow_1)) AND (dbo.tblServiceNow.Incident_State <> 7)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[View_KPI_UptimeByDevice]'
GO
CREATE VIEW [dbo].[View_KPI_UptimeByDevice]
AS
SELECT        dbo.tblDevice.DeviceID, dbo.tblDevice.Description, dbo.tblDevice.CustomerID, dbo.View_KPI_Downtime.DownDate, dbo.View_KPI_Downtime.Downtime AS DowntimeSeconds
FROM            dbo.tblDevice LEFT OUTER JOIN
                         dbo.View_KPI_Downtime ON dbo.tblDevice.DeviceID = dbo.View_KPI_Downtime.DeviceID
WHERE        (dbo.tblDevice.Monitor = 1) AND (dbo.tblDevice.CustomerID = 'RAD')
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[View_KPI_OldestTicketByStateDetail]'
GO
CREATE VIEW [dbo].[View_KPI_OldestTicketByStateDetail]
AS
SELECT        dbo.tblServiceNow.Number, dbo.tblServiceNow.RoomID, dbo.tblServiceNow.Building, dbo.tblServiceNow.Opened_At, dbo.tblServiceNow.LastUpdated, dbo.tblServiceNow.Short_Description, dbo.tblServiceNow.Description, 
                         dbo.tblServiceNow.Category, dbo.tblServiceNow.Contact_Type, dbo.tblServiceNow.Priority, dbo.tblServiceNow.Severity, dbo.tblServiceNow.Urgency, dbo.tblServiceNow.Incident_State, 
                         dbo.tblSeviceNowIncidentState.Description AS IncidentStateDescription, dbo.tblServiceNow.InteractionCount, dbo.tblServiceNow.Close_Notes, dbo.tblServiceNow.Requester_Name, dbo.tblServiceNow.Requester_Title, 
                         dbo.tblServiceNow.Requester_Email, dbo.tblServiceNow.Assigned_Name, dbo.tblServiceNow.Assigned_Title, dbo.tblServiceNow.Assigned_Email, dbo.tblServiceNow.CreateDate, dbo.tblServiceNow.Id
FROM            dbo.tblServiceNow INNER JOIN
                         dbo.View_KPI_OldestTicketByState ON dbo.tblServiceNow.Opened_At = dbo.View_KPI_OldestTicketByState.OldestIncidentDate AND 
                         dbo.tblServiceNow.Incident_State = dbo.View_KPI_OldestTicketByState.Incident_State INNER JOIN
                         dbo.tblSeviceNowIncidentState ON dbo.tblServiceNow.Incident_State = dbo.tblSeviceNowIncidentState.Incident_State
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[View_AvailableRooms]'
GO
CREATE VIEW [dbo].[View_AvailableRooms]
AS
SELECT        RoomID, CustomerID, RoomName, RoomDescription, RoomNumber, RoomFloor, Building, SpaceID, SpaceTypeID, RoomType, RoomCapacity, BookingAllowed, RoomUPN, RoomEmail, EWSURL, TimeZone, RoomImagePath, 
                         ScreensaverPath, ScheduleID, CapabilityID, StyleTemplateID, WayfindingMapPoint, NextMeetingTime, EngageEnabled, WayfindingEnabled, RoomAvailable, CurrentMeetingEnd, StatusSyncTime, CapacityLimit, MappedInID, 
                         CurrentSignsOfLife, CurrentPeopleCount, CurrentMotionDetected, ReservationRestricted, EngageType, RoomMemo, CalendarSyncTime, ZoomSyncTime, LastUCRebootTrigger, ZoomStatus, ZoomRoomID, ZoomHealth, 
                         UCIPAddress, UCUsername, UCPassword, LastEditUser, LastEditDate, CreateDate
FROM            dbo.tblRoom
WHERE        (ZoomStatus <> 'Offline') AND (ZoomHealth <> 'noissues') OR
                         (ZoomStatus <> 'UnderConstruction')
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[View_KPI_PercentUpTimeByDeviceType]'
GO
CREATE VIEW [dbo].[View_KPI_PercentUpTimeByDeviceType]
AS
SELECT        dbo.View_KPI_Downtime.DeviceTypeID, dbo.tblDeviceType.Description, COUNT(dbo.View_KPI_Downtime.DeviceID) AS CountOfDevices, DATEDIFF(second, GETDATE() - 30, GETDATE()) 
                         * COUNT(dbo.View_KPI_Downtime.DeviceID) AS TotalSecondsInPeriod, SUM(dbo.View_KPI_Downtime.Downtime) AS TotalMinDown, 1 - CAST(SUM(dbo.View_KPI_Downtime.Downtime) AS Numeric) / CAST(DATEDIFF(second, 
                         GETDATE() - 30, GETDATE()) * COUNT(dbo.View_KPI_Downtime.DeviceID) AS Numeric) AS PercentageUp
FROM            dbo.View_KPI_Downtime INNER JOIN
                         dbo.tblDeviceType ON dbo.View_KPI_Downtime.DeviceTypeID = dbo.tblDeviceType.DeviceTypeID
WHERE        (dbo.View_KPI_Downtime.DownDate BETWEEN GETDATE() - 30 AND GETDATE())
GROUP BY dbo.View_KPI_Downtime.DeviceTypeID, dbo.tblDeviceType.Description
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[sp_KPI_Uptime_Report]'
GO
-- =============================================
-- Author:		Matt Weiland
-- Create date: 9/14/2022
-- Description:	Calculates Update based on date 
-- range
-- =============================================
CREATE PROCEDURE [dbo].[sp_KPI_Uptime_Report]  @DateFrom datetime = Null , @DateTo datetime = Null


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Print @DateFrom
	Print @DateTo

	SET @DateFrom = CAST(Getdate()-30 As Date)
	SET @DateTo = CAST(Getdate() As Date)
    
		SELECT    * From    View_KPI_PercentUpTimeByDeviceType


END
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[View_KPI_RoomCountByType]'
GO
CREATE VIEW [dbo].[View_KPI_RoomCountByType]
AS
SELECT        TOP (100) PERCENT dbo.tblRoom.SpaceTypeID, dbo.tblSpaceType.Description, dbo.tblRoom.EngageEnabled, COUNT(dbo.tblRoom.RoomID) AS NoOfRooms
FROM            dbo.tblRoom LEFT OUTER JOIN
                         dbo.tblSpaceType ON dbo.tblRoom.SpaceTypeID = dbo.tblSpaceType.SpaceTypeID
GROUP BY dbo.tblRoom.SpaceTypeID, dbo.tblSpaceType.Description, dbo.tblRoom.EngageEnabled
HAVING        (dbo.tblRoom.EngageEnabled = 1)
ORDER BY NoOfRooms DESC
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[tblZoomRoom]'
GO
CREATE TABLE [dbo].[tblZoomRoom]
(
[ID] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Room_ID] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Status] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Health] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LocationID] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreateDate] [datetime] NOT NULL CONSTRAINT [DF_tblZoomRoom_CreateDate] DEFAULT (getdate())
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_tblZoomRoom] on [dbo].[tblZoomRoom]'
GO
ALTER TABLE [dbo].[tblZoomRoom] ADD CONSTRAINT [PK_tblZoomRoom] PRIMARY KEY CLUSTERED ([ID])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[View_Get_Engage_LocationTree]'
GO
CREATE VIEW [dbo].[View_Get_Engage_LocationTree]
AS
SELECT        dbo.tblRoom.RoomID, dbo.tblRoom.CustomerID, dbo.tblRoom.RoomName, dbo.tblRoom.RoomDescription, dbo.tblRoom.ZoomStatus, dbo.tblRoom.ZoomHealth, dbo.tblRoom.ZoomRoomID, dbo.tblRoom.CurrentSignsOfLife, 
                         dbo.tblRoom.CurrentPeopleCount, dbo.tblRoom.CurrentMotionDetected, dbo.tblRoom.ReservationRestricted, dbo.tblZoomRoom.LocationID, dbo.tblRoom.EngageType, dbo.tblRoom.RoomMemo, dbo.tblRoom.CalendarSyncTime, 
                         dbo.tblRoom.ZoomSyncTime, dbo.tblRoom.RoomAvailable, dbo.tblRoom.CurrentMeetingEnd, dbo.tblRoom.NextMeetingTime, dbo.tblRoom.EngageEnabled, dbo.tblRoom.WayfindingEnabled, dbo.tblRoom.StatusSyncTime, 
                         dbo.tblRoom.BookingAllowed
FROM            dbo.tblRoom INNER JOIN
                         dbo.tblZoomRoom ON dbo.tblRoom.ZoomRoomID = dbo.tblZoomRoom.ID
WHERE        (dbo.tblRoom.ZoomRoomID IS NOT NULL)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[View_KPI_Top10OldestOpenTickets]'
GO
CREATE VIEW [dbo].[View_KPI_Top10OldestOpenTickets]
AS
SELECT        TOP (10) dbo.tblServiceNow.Number, dbo.tblServiceNow.RoomID, dbo.tblServiceNow.Building, dbo.tblServiceNow.Opened_At, dbo.tblServiceNow.Short_Description, dbo.tblServiceNow.Incident_State, 
                         dbo.tblSeviceNowIncidentState.Description AS IncidentStateDescription, DATEDIFF(d, dbo.tblServiceNow.Opened_At, GETDATE()) AS DaysOpen
FROM            dbo.tblServiceNow INNER JOIN
                         dbo.tblSeviceNowIncidentState ON dbo.tblServiceNow.Incident_State = dbo.tblSeviceNowIncidentState.Incident_State
WHERE        (dbo.tblServiceNow.Incident_State <> 6)
ORDER BY dbo.tblServiceNow.Opened_At
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[View_KPI_PercentUptimeByDeviceTypeAll]'
GO
CREATE VIEW [dbo].[View_KPI_PercentUptimeByDeviceTypeAll]
AS
SELECT        dbo.tblDeviceType.DeviceTypeID, dbo.tblDeviceType.Description, dbo.View_KPI_PercentUpTimeByDeviceType.CountOfDevices, CASE WHEN View_KPI_PercentUpTimeByDeviceType.TotalSecondsInPeriod IS NULL 
                         THEN 2592000 ELSE View_KPI_PercentUpTimeByDeviceType.TotalSecondsInPeriod END AS TotalSecondsInPeriod, CASE WHEN View_KPI_PercentUpTimeByDeviceType.TotalMinDown IS NULL 
                         THEN 0 ELSE View_KPI_PercentUpTimeByDeviceType.TotalMinDown END AS TotalMinDown, CASE WHEN View_KPI_PercentUpTimeByDeviceType.PercentageUp IS NULL 
                         THEN 1 ELSE View_KPI_PercentUpTimeByDeviceType.PercentageUp END AS PercentageUp
FROM            dbo.tblDeviceType LEFT OUTER JOIN
                         dbo.View_KPI_PercentUpTimeByDeviceType ON dbo.tblDeviceType.DeviceTypeID = dbo.View_KPI_PercentUpTimeByDeviceType.DeviceTypeID
WHERE        (dbo.tblDeviceType.DeviceTypeID IN (1, 6, 8))
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[View_KPI_ClosedByMonth]'
GO
CREATE VIEW [dbo].[View_KPI_ClosedByMonth]
AS
SELECT        TOP (100) PERCENT DATEPART(yy, Closed_At) AS Year, DATEPART(mm, Closed_At) AS Month, CONVERT(char(3), Closed_At, 0) AS MonthName, COUNT(Closed_At) AS ClosedCount
FROM            dbo.View_KPI_AllClosedTickets
GROUP BY DATEPART(mm, Closed_At), DATEPART(yy, Closed_At), CONVERT(char(3), Closed_At, 0)
ORDER BY Year, Month
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[View_KPI_MTTR_By_Month]'
GO
CREATE VIEW [dbo].[View_KPI_MTTR_By_Month]
AS
SELECT        TOP (100) PERCENT DATEPART(yy, Closed_At) AS Year, DATEPART(mm, Closed_At) AS Month, CONVERT(char(3), Closed_At, 0) AS MonthName, COUNT(TimeToClose) AS NumberClosed, SUM(TimeToClose) AS TotalTimeToClose, 
                         SUM(TimeToClose) / COUNT(TimeToClose) AS MTTR, dbo.fun_FriendlierDateFull(SUM(TimeToClose) / COUNT(TimeToClose)) AS MTTRFreindly
FROM            dbo.View_KPI_AllClosedTickets
GROUP BY DATEPART(yy, Closed_At), CONVERT(char(3), Closed_At, 0), DATEPART(mm, Closed_At)
ORDER BY Year, Month
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[View_KPI_ZoomRoomStatus]'
GO
CREATE VIEW [dbo].[View_KPI_ZoomRoomStatus]
AS
SELECT        TOP (100) PERCENT Status, COUNT(Status) AS Count
FROM            dbo.tblZoomRoom
GROUP BY Status
ORDER BY Status
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[View_KPI_ZoomRoomHealth]'
GO
CREATE VIEW [dbo].[View_KPI_ZoomRoomHealth]
AS
SELECT        Health, COUNT(Health) AS Count
FROM            dbo.tblZoomRoom
GROUP BY Health
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[View_KPI_EngagePanelCount]'
GO
CREATE VIEW [dbo].[View_KPI_EngagePanelCount]
AS
SELECT        dbo.tblDevice.DeviceTypeID, dbo.tblDeviceType.Description, COUNT(dbo.tblDevice.DeviceID) AS TotalDevices
FROM            dbo.tblDevice INNER JOIN
                         dbo.tblDeviceType ON dbo.tblDevice.DeviceTypeID = dbo.tblDeviceType.DeviceTypeID
WHERE        (dbo.tblDevice.Monitor = 1)
GROUP BY dbo.tblDevice.DeviceTypeID, dbo.tblDeviceType.Description
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[View_KPI_CountStatusByType]'
GO
CREATE VIEW [dbo].[View_KPI_CountStatusByType]
AS
SELECT        'Engage' AS Type, Health, COUNT(DeviceID) AS Count
FROM            tblDevice
WHERE        (DeviceTypeID = 8)
GROUP BY Health, DeviceTypeID
UNION All
SELECT        'Signage' AS Type, Health, COUNT(DeviceID) AS Count
FROM            tblDevice
WHERE        (DeviceTypeID = 1)
GROUP BY Health, DeviceTypeID
UNION All
SELECT        'ZoomRoom' ,Health, COUNT(Room_ID) AS Count
FROM            dbo.tblZoomRoom
GROUP BY Health           
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[fun_FriendlierDate]'
GO


CREATE FUNCTION  [dbo].[fun_FriendlierDate] (@minutes int)
RETURNS nvarchar(100)
AS
BEGIN
   return CASE 
    when @minutes < 60 then cast( @minutes as varchar(10)) + 'minutes'
    when @minutes < 1440 then cast(@minutes/60 as varchar(10)) + 'hours ' + cast(@minutes%60 as varchar(10)) + 'minutes'
    else cast(@minutes/(1440 ) as varchar(10)) + 'days ' + cast((@minutes%1440 )/60 as varchar(10)) + 'hours ' + cast(((@minutes%1440 )%60) as varchar(10)) + 'minutes'
    END
END
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[tblZoomLocation]'
GO
CREATE TABLE [dbo].[tblZoomLocation]
(
[ID] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Name] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Parent_Location_ID] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Type] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreateDate] [datetime] NOT NULL CONSTRAINT [DF_tblZoomLocation_CreateDate] DEFAULT (getdate())
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_tblZoomLocation] on [dbo].[tblZoomLocation]'
GO
ALTER TABLE [dbo].[tblZoomLocation] ADD CONSTRAINT [PK_tblZoomLocation] PRIMARY KEY CLUSTERED ([ID])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[tblAlert]'
GO
ALTER TABLE [dbo].[tblAlert] ADD CONSTRAINT [FK_tblAlert_tblMonitoritem] FOREIGN KEY ([MonitorItemID]) REFERENCES [dbo].[tblMonitorItem] ([MonitorItemID])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[tblMonitorItem]'
GO
ALTER TABLE [dbo].[tblMonitorItem] ADD CONSTRAINT [FK_tblMonitoritem_tblCompareType] FOREIGN KEY ([CompareTypeID]) REFERENCES [dbo].[tblCompareType] ([CompareTypeID])
GO
ALTER TABLE [dbo].[tblMonitorItem] ADD CONSTRAINT [FK_tblMonitoritem_tblDeviceType] FOREIGN KEY ([DeviceTypeID]) REFERENCES [dbo].[tblDeviceType] ([DeviceTypeID]) ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblMonitorItem] ADD CONSTRAINT [FK_tblMonitoritem_tblItemType] FOREIGN KEY ([ItemTypeID]) REFERENCES [dbo].[tblMonitorItemType] ([ItemTypeID]) ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblMonitorItem] ADD CONSTRAINT [FK_tblMonitoritem_tblMonitorType] FOREIGN KEY ([MonitorTypeID]) REFERENCES [dbo].[tblMonitorType] ([MonitorTypeID])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[tblMonitorItemType]'
GO
ALTER TABLE [dbo].[tblMonitorItemType] ADD CONSTRAINT [FK_tblMonitorItemType_tblErrorLevel] FOREIGN KEY ([ErrorLevel]) REFERENCES [dbo].[tblErrorLevel] ([ErrorLevel]) ON UPDATE CASCADE
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[tblScriptLog]'
GO
ALTER TABLE [dbo].[tblScriptLog] ADD CONSTRAINT [FK_tblScriptLog_tblErrorLevel] FOREIGN KEY ([ErrorLevel]) REFERENCES [dbo].[tblErrorLevel] ([ErrorLevel]) ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblScriptLog] ADD CONSTRAINT [FK_tblScriptLog_tblCustomer] FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[tblCustomer] ([CustomerID]) ON UPDATE CASCADE
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
COMMIT TRANSACTION
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
-- This statement writes to the SQL Server Log so SQL Monitor can show this deployment.
IF HAS_PERMS_BY_NAME(N'sys.xp_logevent', N'OBJECT', N'EXECUTE') = 1
BEGIN
    DECLARE @databaseName AS nvarchar(2048), @eventMessage AS nvarchar(2048)
    SET @databaseName = REPLACE(REPLACE(DB_NAME(), N'\', N'\\'), N'"', N'\"')
    SET @eventMessage = N'Redgate SQL Compare: { "deployment": { "description": "Redgate SQL Compare deployed to ' + @databaseName + N'", "database": "' + @databaseName + N'" }}'
    EXECUTE sys.xp_logevent 55000, @eventMessage
END
GO
DECLARE @Success AS BIT
SET @Success = 1
SET NOEXEC OFF
IF (@Success = 1) PRINT 'The database update succeeded'
ELSE BEGIN
	IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION
	PRINT 'The database update failed'
END
GO
