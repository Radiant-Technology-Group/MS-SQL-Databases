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
PRINT N'Dropping foreign keys from [dbo].[Room]'
GO
ALTER TABLE [dbo].[Room] DROP CONSTRAINT [FK_Room_SpaceType]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping constraints from [dbo].[tblSpaceType]'
GO
ALTER TABLE [dbo].[tblSpaceType] DROP CONSTRAINT [PK_SpaceType]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping constraints from [dbo].[tblWayfinder]'
GO
ALTER TABLE [dbo].[tblWayfinder] DROP CONSTRAINT [PK_tblWayfinder]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping constraints from [dbo].[tblWayfinder]'
GO
ALTER TABLE [dbo].[tblWayfinder] DROP CONSTRAINT [DF_tblWayfinder_PointColor]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping types'
GO
DROP TYPE [dbo].[ZoomSync]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating types'
GO
CREATE TYPE [dbo].[ZoomSync] AS TABLE
(
[RoomID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ZoomStatus] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ZoomSyncTime] [datetime] NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[Room]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Room] ADD
[COVID_CON] [bit] NOT NULL CONSTRAINT [DF_Room_COVID_CON] DEFAULT ((0)),
[CreateDate] [datetime] NULL CONSTRAINT [DF_Room_CreateDate] DEFAULT (getdate())
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_rename N'[dbo].[Room].[Outlook_Name]', N'OutlookName', N'COLUMN'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_rename N'[dbo].[Room].[Reservation Description]', N'ReservationDescription', N'COLUMN'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[Room]'
GO
ALTER TABLE [dbo].[Room] ADD CONSTRAINT [DF_Room_Zoom_Room] DEFAULT ((0)) FOR [Zoom_Room]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Room] ADD CONSTRAINT [DF_Room_TV] DEFAULT ((0)) FOR [TV]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Room] ADD CONSTRAINT [DF_Room_Conf_Phone] DEFAULT ((0)) FOR [Conf_Phone]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Room] ADD CONSTRAINT [DF_Room_WhiteBoard] DEFAULT ((0)) FOR [WhiteBoard]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Room] ADD CONSTRAINT [DF_Room_Projector] DEFAULT ((0)) FOR [Projector]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Room] ADD CONSTRAINT [DF_Room_Scrn_Conf] DEFAULT ((0)) FOR [Scrn_Conf]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Room] ADD CONSTRAINT [DF_Room_Laptop_Con] DEFAULT ((0)) FOR [Laptop_Con]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[tblDevice]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[tblDevice] ADD
[Status] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Health] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[View_NHQ]'
GO
ALTER VIEW [dbo].[View_NHQ]
AS
SELECT        dbo.tblRoom.RoomID, dbo.tblRoom.CustomerID, dbo.tblRoom.RoomName, dbo.tblRoom.Building, dbo.tblRoom.RoomFloor, dbo.tblRoom.SpaceID, dbo.tblRoom.SpaceTypeID, 
                         dbo.tblSpaceType.Description AS SpaceTypeDescription, dbo.tblRoom.RoomCapacity, dbo.tblRoom.BookingAllowed, dbo.tblRoom.RoomUPN, dbo.tblRoom.RoomEmail, dbo.tblRoom.EWSURL, dbo.tblRoom.TimeZone, 
                         dbo.tblRoom.RoomImagePath, dbo.tblRoom.ScheduleID, dbo.tblRoom.CapabilityID, dbo.tblRoom.EngageEnabled, dbo.tblRoom.WayfindingEnabled, dbo.tblRoom.CapacityLimit
FROM            dbo.tblRoom LEFT OUTER JOIN
                         dbo.tblSpaceType ON dbo.tblRoom.SpaceTypeID = dbo.tblSpaceType.SpaceTypeID
WHERE        (dbo.tblRoom.SpaceTypeID = 'S-CONF' OR
                         dbo.tblRoom.SpaceTypeID = 'S-CONF-DP' OR
                         dbo.tblRoom.SpaceTypeID = 'S-FLEX' OR
                         dbo.tblRoom.SpaceTypeID = 'S-FLEX-S') AND (dbo.tblRoom.Building = N'NHQ')
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[View_NHQ_Amenities]'
GO
ALTER VIEW [dbo].[View_NHQ_Amenities]
AS
SELECT        TOP (100) PERCENT dbo.tblRoom.RoomID, dbo.tblRoom.RoomName, dbo.tblRoom.Building, dbo.tblRoom.RoomFloor, dbo.tblRoom.SpaceTypeID, dbo.tblSpaceType.Description AS SpaceTypeDescription, 
                         dbo.tblRoom.EngageEnabled, dbo.tblRoom.WayfindingEnabled, dbo.tblSpaceType.IsAmenity
FROM            dbo.tblRoom LEFT OUTER JOIN
                         dbo.tblSpaceType ON dbo.tblRoom.SpaceTypeID = dbo.tblSpaceType.SpaceTypeID
WHERE        (dbo.tblSpaceType.IsAmenity = 1) AND (dbo.tblRoom.WayfindingEnabled = 1) AND (dbo.tblRoom.Building IN ('NHQ'))
ORDER BY dbo.tblRoom.Building, dbo.tblRoom.RoomFloor
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[View_NGHB]'
GO
ALTER VIEW [dbo].[View_NGHB]
AS
SELECT        dbo.tblRoom.RoomID, dbo.tblRoom.CustomerID, dbo.tblRoom.RoomName, dbo.tblRoom.Building, dbo.tblRoom.RoomFloor, dbo.tblRoom.SpaceID, dbo.tblRoom.SpaceTypeID, 
                         dbo.tblSpaceType.Description AS SpaceTypeDescription, dbo.tblRoom.RoomCapacity, dbo.tblRoom.BookingAllowed, dbo.tblRoom.RoomUPN, dbo.tblRoom.RoomEmail, dbo.tblRoom.EWSURL, dbo.tblRoom.TimeZone, 
                         dbo.tblRoom.RoomImagePath, dbo.tblRoom.ScheduleID, dbo.tblRoom.CapabilityID, dbo.tblRoom.EngageEnabled, dbo.tblRoom.WayfindingEnabled, dbo.tblRoom.CapacityLimit
FROM            dbo.tblRoom LEFT OUTER JOIN
                         dbo.tblSpaceType ON dbo.tblRoom.SpaceTypeID = dbo.tblSpaceType.SpaceTypeID
WHERE        (dbo.tblRoom.SpaceTypeID IN ('S-CONF', 'S-CONF-DP', 'S-FLEX', 'S-FLEX-S', 'S-BUS', 'P-OFFC', 'P-OFFC-EX', 'P-WKS', 'S-PROJ')) AND (dbo.tblRoom.Building = 'NGHB') AND (dbo.tblRoom.WayfindingEnabled = '1')
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_tblSpaceType] on [dbo].[tblSpaceType]'
GO
ALTER TABLE [dbo].[tblSpaceType] ADD CONSTRAINT [PK_tblSpaceType] PRIMARY KEY CLUSTERED ([SpaceTypeID])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_tblWayfind] on [dbo].[tblWayfinder]'
GO
ALTER TABLE [dbo].[tblWayfinder] ADD CONSTRAINT [PK_tblWayfind] PRIMARY KEY CLUSTERED ([DeviceID], [CustomerID])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[Room]'
GO
ALTER TABLE [dbo].[Room] ADD CONSTRAINT [FK_Room_tblSpaceType] FOREIGN KEY ([SpaceType]) REFERENCES [dbo].[tblSpaceType] ([SpaceTypeID])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[tblWayfinder]'
GO
ALTER TABLE [dbo].[tblWayfinder] ADD CONSTRAINT [DF_tblWayfinder_PointColor] DEFAULT ('#FF00FFFF') FOR [PointColor]
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
