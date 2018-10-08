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
	[Picture] VARBINARY(MAX), --https://www.c-sharpcorner.com/article/how-should-we-store-images-and-blob-files-in-sql-server/
	[Electricity] BIT NOT NULL DEFAULT 1,
	[PotableWater] BIT NOT NULL DEFAULT 1
);

CREATE TABLE [Holidays]
(
	[HolidayID] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[CampgroundID] INT NOT NULL,
	[Name] VARCHAR(50) NOT NULL,
	[StartDate] DATE NOT NULL,
	[EndDate] DATE NOT NULL
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
	[EndDate] DATE NOT NULL
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

ALTER TABLE [Holidays]
ADD FOREIGN KEY ([CampgroundID]) REFERENCES [Campgrounds]([CampgroundID])

ALTER TABLE [Users]
ADD FOREIGN KEY ([CampgroundID]) REFERENCES [Campgrounds]([CampgroundID])

ALTER TABLE [Reservations]
ADD FOREIGN KEY ([SiteID]) REFERENCES [Sites]([SiteID]),
	FOREIGN KEY ([UserID]) REFERENCES [Users]([UserID])

ALTER TABLE [Hosts]
ADD FOREIGN KEY ([CampgroundID]) REFERENCES [Campgrounds]([CampgroundID])


--Data Insertion

SET IDENTITY_INSERT [Activites] ON;

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
	('1','1','0','1','1','1','1','0','1'); -- Redfish Lake using ActivitiesID 1 and CampgroundID 1

SET IDENTITY_INSERT [Activites] OFF;

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
	('1','Redfish Lake Outlet Campground','44.141250, -114.911141','Subarctic','1','0','1','03-Mar-18','07-Oct-18'); -- Redfish Lake using CampgroundID 1

SET IDENTITY_INSERT [Campgrounds] OFF;

/*
Drop Tables
DROP TABLE [Activities]
DROP TABLE [Campgrounds]
DROP TABLE [Sites]
DROP TABLE [Holidays]
DROP TABLE [Users]
DROP TABLE [Reservations]
DROP TABLE [Hosts]
*/