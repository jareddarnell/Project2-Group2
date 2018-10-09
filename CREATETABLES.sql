/*
Assignment 2 - Group 2
Quin Dixon, Jared Darnell, Cole Smith
CS 3550
*/

/* This is the document for creating the tables and insert the sample data */

--Table Creation

CREATE TABLE [Activities]
(
	[ActivitiesID] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[CampgroundID] INT NOT NULL,
	[ATVRiding] BIT NOT NULL DEFAULT 0,
	[Fishing] BIT NOT NULL DEFAULT 0,
	[Hiking] BIT NOT NULL DEFAULT 0,
	[Boating] BIT NOT NULL DEFAULT 0,
	[Swimming] BIT NOT NULL DEFAULT 0,
	[Hunting] BIT NOT NULL DEFAULT 0,
	[HorseBackRiding] BIT NOT NULL DEFAULT 0
);

CREATE TABLE [Campgrounds]
(
	[CampgroundID] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Name] VARCHAR(50) NOT NULL,
	[Location] VARCHAR(50) NOT NULL,	--Lat-Long possibly use non-euclidian spatial data type
	[Climate] VARCHAR(20) NOT NULL,
	[ExtraParkingSpots] INT NOT NULL,
	[VaultToilets] BIT NOT NULL,
	[FlushToilets] BIT NOT NULL,
	[AvailableStartDate] DATE NOT NULL,
	[AvailableEndDate] DATE NOT NULL
);

CREATE TABLE [Sites]
(
	[SiteID] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[CampgroundID] INT NOT NULL,
	[SiteNumber] INT NOT NULL,
	[Functional] BIT NOT NULL DEFAULT 1,
	[Price] MONEY NOT NULL,
	[ParkingSpots] INT NOT NULL,
	[Capacity] INT NOT NULL,
	[Tent] BIT NOT NULL DEFAULT 0,
	[Trailer] BIT NOT NULL DEFAULT 0,
	[WaterAccess] BIT NOT NULL DEFAULT 0,
	[Firepit] BIT NOT NULL DEFAULT 0,
	[Table] BIT NOT NULL DEFAULT 0,
	[Covered] BIT NOT NULL DEFAULT 0,
	[Shade] BIT NOT NULL DEFAULT 0,
	[Picture] VARBINARY(MAX) NULL, --https://www.c-sharpcorner.com/article/how-should-we-store-images-and-blob-files-in-sql-server/
	[Electricity] BIT NOT NULL DEFAULT 1,
	[PotableWater] BIT NOT NULL DEFAULT 1
);

CREATE TABLE [Users]
(
	[UserID] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[CampgroundID] INT NOT NULL,
	[FirstName] VARCHAR(20) NOT NULL,
	[LastName] VARCHAR(20) NOT NULL,
	[CellPhoneNumber] VARCHAR(15) NOT NULL,
	[Email] VARCHAR(50) NOT NULL
);

CREATE TABLE [Reservations]
(
	[ReservationID] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[UserID] INT NOT NULL, 
	[SiteID] INT NOT NULL,
	[StartDate] DATE NOT NULL,
	[EndDate] DATE NOT NULL,
	[TotalPrice] MONEY NOT NULL
);

CREATE TABLE [Hosts]
(
	[HostID] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[CampgroundID] INT NOT NULL,
	[FirstName] VARCHAR(20) NOT NULL,
	[LastName] VARCHAR(20) NOT NULL,
	[CellPhoneNumber] VARCHAR(15) NOT NULL
);


--Table Alteration

ALTER TABLE [Activities]
ADD FOREIGN KEY ([CampgroundID]) REFERENCES [Campgrounds]([CampgroundID])

ALTER TABLE [Sites]
ADD FOREIGN KEY ([CampgroundID]) REFERENCES [Campgrounds]([CampgroundID])

ALTER TABLE [Users]
ADD FOREIGN KEY ([CampgroundID]) REFERENCES [Campgrounds]([CampgroundID])

ALTER TABLE [Reservations]
ADD FOREIGN KEY ([SiteID]) REFERENCES [Sites]([SiteID]),
	FOREIGN KEY ([UserID]) REFERENCES [Users]([UserID])

ALTER TABLE [Hosts]
ADD FOREIGN KEY ([CampgroundID]) REFERENCES [Campgrounds]([CampgroundID])


--Data Insertion

SET IDENTITY_INSERT [Campgrounds] ON;

INSERT INTO [Campgrounds]
(
	[CampgroundID],
	[Name],
	[Location],
	[Climate],
	[ExtraParkingSpots],
	[VaultToilets],
	[FlushToilets],
	[AvailableStartDate],
	[AvailableEndDate]
)
VALUES
	('1','Redfish Lake Outlet Campground','44.141250, -114.911141','Subarctic','1','0','1','03-Mar-18','07-Oct-18'), --Redfish Lake using CampgroundID 1
	('2','Madison Campground','38.725,51.687','Subarctic','0','0','1','27-Apr-18', '14-Oct-18'); --Madison Campground CampgroundID 2

SET IDENTITY_INSERT [Campgrounds] OFF;

SET IDENTITY_INSERT [Activities] ON;

INSERT INTO [Activities]
(
	[ActivitiesID],
	[CampgroundID],
	[ATVRiding],
	[Fishing],
	[Hiking],
	[Boating],
	[Swimming],
	[Hunting],
	[HorseBackRiding]
)
VALUES
	('1','1','0','1','1','1','1','0','1'), --Referencing Redfish Lake CampgroundID 1
	('2','2','0','1','1','0','0','0','1'); --Refrences Madison Campground CampgroundID 2

SET IDENTITY_INSERT [Activities] OFF;

SET IDENTITY_INSERT [Sites] ON;

INSERT INTO [Sites]
(
	[SiteID],
	[CampgroundID],
	[SiteNumber],
	[Functional],
	[Price], 
	[ParkingSpots],
	[Capacity],
	[Tent],
	[Trailer], 
	[WaterAccess], 
	[Firepit], 
	[Table],
	[Covered], 
	[Shade],
	[Electricity],
	[PotableWater],
	[Picture]
)
VALUES
	('1','1','2','1','33.33','2','16','1','1','1','1','1','0','1','0','1',NULL), --Referencing Redfish Lake CampgroundID 1
	('2','1','3','1','16.67','1','8','1','1','1','1','1','0','1','0','1',NULL), --Referencing Redfish Lake CampgroundID 1
	('3','1','4','1','16.67','1','8','1','1','1','1','1','0','1','0','1',NULL), --Referencing Redfish Lake CampgroundID 1
	('4','1','5','1','16.67','1','8','1','1','1','1','1','0','1','0','1',NULL), --Referencing Redfish Lake CampgroundID 1
	('5','1','6','1','16.67','1','8','1','1','1','1','1','0','1','0','1',NULL), --Referencing Redfish Lake CampgroundID 1
	('6','1','7','1','33.33','2','16','1','1','1','1','1','0','1','0','1',NULL), --Referencing Redfish Lake CampgroundID 1
	('7','1','8','1','16.67','1','8','1','1','1','1','1','0','1','0','1',NULL), --Referencing Redfish Lake CampgroundID 1
	('8','1','9','1','33.33','2','16','1','1','1','1','1','0','1','0','1',NULL), --Referencing Redfish Lake CampgroundID 1
	('9','1','10','1','16.67','1','8','1','1','1','1','1','0','1','0','1',NULL), --Referencing Redfish Lake CampgroundID 1
	('10','1','11','1','33.33','2','16','1','1','1','1','1','0','1','0','1',NULL), --Referencing Redfish Lake CampgroundID 1
	('11','2','1','0','25.25','2','6','1','0','1','1','0','0','1','0','1',NULL), --Referencing Madison Campground CampgroundID 2
    ('12','2','2','1','25.25','2','8','1','0','1','0','1','0','1','0','1',NULL), --Referencing Madison Campground CampgroundID 2
    ('13','2','3','0','25.25','4','16','1','1','1','0','0','0','1','1','1',NULL), --Referencing Madison Campground CampgroundID 2
    ('14','2','4','1','25.25','4','16','1','1','1','0','1','0','1','1','1',NULL), --Referencing Madison Campground CampgroundID 2
    ('15','2','5','1','25.25','4','18','1','1','1','0','1','0','1','1','1',NULL); --Referencing Madison Campground CampgroundID 2

SET IDENTITY_INSERT [Sites] OFF;

SET IDENTITY_INSERT [Users] ON;

INSERT INTO [Users]
(
	[UserID],
	[CampgroundID],
	[FirstName],
	[LastName],
	[CellPhoneNumber],
	[Email]
)
VALUES
	('1','1','Some','Guy','926-999-1248','someguy@guymail.com'), --Referencing Redfish Lake CampgroundID 1
	('2','1','Who','That','265-684-1325','whothat@newmail.com'), --Referencing Redfish Lake CampgroundID 1
	('3','1','Mary','Sue','213-364-3145','marysue@suemary.com'), --Referencing Redfish Lake CampgroundID 1
	('4','2','Jane','Hills','459-296-4895','jhills@gmail.com'), --Referencing Madison Campground CampgroundID 2
    ('5','2','Frank','Harris','212-515-6261','frankharris36@yahoo.com'), --Referencing Madison Campground CampgroundID 2
    ('6','2','Jack','Adams','841-149-1632','jackjadams@outlook.com'); --Referencing Madison Campground CampgroundID 2

SET IDENTITY_INSERT [Users] OFF;

SET IDENTITY_INSERT [Reservations] ON;

INSERT INTO [Reservations]
(
	[ReservationID],
	[UserID],
	[SiteID],
	[StartDate],
	[EndDate],
	[TotalPrice]
)
VALUES
	('1','1','1','01-Apr-18','08-Apr-18','266.64'),
	('2','2','3','18-Jun-18','25-Jun-18','133.36'),
	('3','3','6','23-Sep-18','25-Sep-18','99.99'),
	('4','4','15','9-Oct-18','11-Oct-18','75.75'),
    ('5','5','12','07-Oct-18','10-Oct-18','101.00'),
    ('6','6','13','08-Oct-18','10-Oct-18','75.75');

SET IDENTITY_INSERT [Reservations] OFF;

SET IDENTITY_INSERT [Hosts] ON;

INSERT INTO [Hosts]
(
	[HostID], 
	[CampgroundID],
	[FirstName],
	[LastName],
	[CellPhoneNumber]
)
VALUES
	('1','1','Joe','Bob','888-169-9973'), --Referencing Redfish Lake CampgroundID 1
	('2','2','Bill','Thompson', '801-616-3315'); --Referencing Madison Campground CampgroundID 2

SET IDENTITY_INSERT [Hosts] OFF;

/*
DROP TABLE [Hosts]
DROP TABLE [Reservations]
DROP TABLE [Users]
DROP TABLE [Sites]
DROP TABLE [Activities]
DROP TABLE [Campgrounds]
*/