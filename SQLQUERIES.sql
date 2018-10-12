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
	('7','2','Tim','Taylor','801-123-4567','toolmantaylor@yahoo.com'), --Madison Campground
	('8','1','Yuu','Man','111-255-3827','yuuman@gmail.com'); --Redfish Lake - Outlet Campground

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
	('7','7','14','03-Jul-18','06-Jul-18','101.00'), --Madison Campground
	('8','8','10','17-May-18','27-May-18','166.70'); --Redfish Lake - Outlet Campground

SET IDENTITY_INSERT [Reservations] OFF;

--Query that returns all camp spots for one of your campgrounds, showing the amenities and availability for each.  Write this query to cover one of the reservations you created above.
DECLARE @StartDateRange DATE = '01-May-18'
DECLARE @EndDateRange DATE = '31-May-18'

SELECT
	C.[Name] AS [Campground],
	S.[SiteNumber],
	'Is available between ' + CAST(@StartDateRange AS VARCHAR) + ' - ' + CAST(@EndDateRange AS VARCHAR) AS [Availability],
	S.[Functional],
	S.[Price],
	S.[ParkingSpots],
	S.[Capacity],
	S.[Tent],
	S.[Trailer],
	S.[Firepit],
	S.[Table],
	S.[Covered],
	S.[Shade],
	S.[Electricity],
	S.[WaterAccess],
	S.[PotableWater]
FROM
	[Sites] AS S
	LEFT JOIN [Campgrounds] AS C ON C.[CampgroundID] = S.[CampgroundID]
	LEFT JOIN [Reservations] AS R ON R.[SiteID] = S.[SiteID]
WHERE
	C.[CampgroundID] = 1 --Redfish Lake
	AND
	(
		(
			R.[StartDate] NOT BETWEEN @StartDateRange AND @EndDateRange
			AND R.[EndDate] NOT BETWEEN @StartDateRange AND @EndDateRange
		)
		OR R.[StartDate] IS NULL
	)
	AND S.[Functional] = 1 --True
ORDER BY
	S.[SiteNumber]

--Query that shows how many days each spot for one of your campgrounds were reserved for a given date range.  Include the % utilization in this query (i.e. if the date range is 30 days and the spot was reserved for 15 days in that date range, utilization is 50%).

--Query that shows the revenue generated by each campground, broken out by month for June, July, August, and September.
SELECT 
	c.Name AS Campground,
	DATENAME(MONTH, r.StartDate) AS Month, 
	SUM(r.totalPrice) AS revenue 
FROM 
	Reservations r 
LEFT JOIN 
	Sites s
ON r.SiteID = s.SiteID 
LEFT JOIN 
	Campgrounds c 
ON s.CampgroundID = c.CampgroundID 
WHERE r.StartDate BETWEEN '2018-Jun-01' AND '2018-Sep-30'
GROUP BY DATENAME(MONTH, r.StartDate),c.Name
ORDER BY c.Name, Month;