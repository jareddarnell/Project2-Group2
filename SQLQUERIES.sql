/*
Assignment 2 - Group 2
Quin Dixon, Jared Darnell, Cole Smith
CS 3550
*/

/* This file is for the sql queries */

-- Insert statements for 2 new users of your system.
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
	('7','2','Tim','Taylor','801-123-4567','toolmantaylor@yahoo.com'); --Madison Campground

SET IDENTITY_INSERT [Users] OFF;

-- Insert statements for reservations by these two new people for 4 day stays at one of your campgrounds.
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
	('7','7','14','03-Jul-18','06-Jul-18','101.00'); --Madison Campground

SET IDENTITY_INSERT [Reservations] OFF;

--Query that returns all sites in a campground, with all amenities, and availability for each site

--Query that returns how many days each spot in the campground was reserved for in a given date range with a percentage of utlization

--Query that returns revenue generated for each campground by month for the months of: June, July, August, and September
