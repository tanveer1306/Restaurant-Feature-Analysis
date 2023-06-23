USE BUDT703_Project_0506_03;

BEGIN TRANSACTION;

/*Dropping the foreign key from the restaurant info table*/
ALTER TABLE [Project.RestaurantInfo]
	DROP CONSTRAINT IF EXISTS fk_RestaurantInfo_locationId
ALTER TABLE [Project.Location]
	DROP CONSTRAINT IF EXISTS fk_Location_restaurantId

/*Dropping the tables*/
DROP TABLE IF EXISTS [Project.SocialMediaPopularity]
DROP TABLE IF EXISTS [Project.RestaurantType]
DROP TABLE IF EXISTS [Project.Location]
DROP TABLE IF EXISTS [Project.RestaurantInfo]

/*Create restaurant info table*/
CREATE TABLE [Project.RestaurantInfo] ( 
restaurantId CHAR(2) NOT NULL, 
restaurantName VARCHAR(30), 
priceInfo VARCHAR(5) ,
popularDay VARCHAR(10), 
popularTime TIME, 
uberEatsRating DECIMAL(2,1), 
googleRating DECIMAL(2,1), 
tripadvisorRating DECIMAL(2,1), 
yelpRating DECIMAL(2,1), 
AvgRating DECIMAL(3,2), 
locationId CHAR(2),
CONSTRAINT pk_RestaurantInfo_restaurantId PRIMARY KEY (restaurantId));

/*Inserting values*/
INSERT INTO [Project.RestaurantInfo] VALUES

('1','The Hall CP','$$','Friday','6:00 PM',4.8,4.1,4.5,3.5,3.98,'1'),
('2','Starbucks','$','Friday','12:00 PM',4.7,4.3,NULL,2.5,4.27,'2'),
('3','Chipotle','$','Monday','12:00 PM',4.5,4.0,4.5,3.5,4.12,'3'),
('4','Cold Stone Creamery','$$','Sunday','7:00 PM',4.6,3.1,4.0,2.5,3.67,'4'),
('5','Cava','$','Thursday','12:00 PM',4.7,4.2,4.5,4.0,4.43,'5'),
('6','Playa Bowls','$$','Saturday','9:00 AM',4.9,4.6,NULL,3.5,4.54,'6'),
('7','Blaze Pizza','$','Friday','7:00 PM',4.6,4.5,4.0,4.0,4.42,'7'),
('8','Looney’s','$$','Friday','11:00 PM',NULL,4.2,4,3.5,4.06,'8'),
('9','Denny’s','$','Saturday','10:00 AM',4.5,4.0,4.0,2.5,4.02,'9'),
('10','Papa John’s','$','Thursday','9:00 PM',4.4,3.2,3.5,1.5,3.51,'10'),
('11','McDonalds','$','Wednesday','1:00 PM',4.3,3.4,NULL,1.5,3.55,'11'),
('12','Potbelly’s','$','Thursday','12:00 PM',4.8,4.1,4.0,3.5,4.13,'12'),
('13','Taco Bell','$','Thursday','1:00 PM',4.6,4.0,4.0,3.5,4.17,'13'),
('14','Bagels N Grinds','$','Sunday','10:00 AM',4.6,4.2,4.0,3.0,4.02,'14'),
('15','Potomac Pizza','$','Tuesday','5:00 PM',4.7,4.3,4.0,4.0,4.39,'15'),
('16','Board and Brew','$$','Friday','7:00 PM',4.7,4.6,4.5,4,4.48,'16'),
('17','Kung Fu Tea','$','Friday','7:00 PM',NULL,4.5,NULL,3.5,4.23,'17'),
('18','Jumbo Jumbo','$','Thursday','7:00 PM',4.8,4.3,2.5,3.5,4.32,'18'),
('19','iHop','$$','Sunday','11:00 AM',4.5,2.9,3.0,2.5,3.21,'19'),
('20','Dunkin’','$','Friday','8:00 AM',4.4,4.0,3.0,2,3.69,'20'),
('21','Mamma Lucia','$$$','Friday','6:00 PM',4.4,4.1,4.0,3.5,4.01,'21'),
('22','Dominos','$','Friday','6:00 PM',NULL,3.5,NULL,2.5,3.35,'22'),
('23','Pizza Hut','$','Saturday','8:00 PM',4.5,3.4,3.5,1.5,3.44,'23'),
('24','Ledo Pizza','$$$','Saturday','5:00 PM',NULL,4.2,4.0,NULL,4.14,'24'),
('25','Pho Thom','$$','Friday','7:00 PM',4.7,4.3,4.0,3.5,4.20,'25'),
('26','Taqueria Habanero','$$','Saturday','7:00 PM',4.4,4.5,NULL,4.0,4.28,'26'),
('27','Hanami Japanese Restaurant','$$$','Saturday','8:00 PM',4.7,4.2,NULL,3.5,4.02,'27'),
('28','The Kabob Joint','$$$','Friday','7:00 PM',NULL,4.4,NULL,NULL,4.40,'28'),
('29','Hard Times Cafe','$$','Thursday','6:00 PM',4.4,4.3,4.0,3.5,4.14,'29'),
('30','Seoul Spice','$$','Sunday','7:00 PM',4.8,4.5,4.0,4.5,4.67,'30'),
('31','The Spot Mini','$$','Friday','7:00 PM',4.8,4.7,NULL,4.0,4.73,'31'),
('32','NuVegan Cafe','$$','Saturday','6:00 PM',4.6,4.4,4.5,4.0,4.32,'32'),
('33','Vigilante','$','Saturday','11:00 PM',NULL,4.6,4.5,4.5,4.58,'33'),
('34','College Park Grill','$$','Friday','7:00 PM',NULL,4.2,4.0,3.5,3.97,'34')


/*Create restaurant location table*/
CREATE TABLE [Project.Location] ( 
locationId CHAR(2) NOT NULL, 
restaurantStreet VARCHAR(30), 
restaurantArea VARCHAR(30), 
distanceFromVMHmiles DECIMAL(2,1), 
northOrSouthCampus VARCHAR(30), 
longitute DECIMAL(12,10),
latitude DECIMAL(12,10),
restaurantId CHAR(2),
CONSTRAINT pk_Location_locationId PRIMARY KEY (locationId),
CONSTRAINT fk_Location_restaurantId FOREIGN KEY (restaurantId) 
	REFERENCES [Project.RestaurantInfo] (restaurantId) 
	ON DELETE NO ACTION ON UPDATE NO ACTION);

/*Insert into location table*/
INSERT INTO [Project.Location] VALUES

('1','4656 Hotel Dr','The Hotel',1.1,'North Campus',38.98689896,-76.93380112,'1'),
('2','7336 Baltimore Ave','College Park Shopping Center',0.6,'South Campus',38.98066406,-76.93892382,'2'),
('3','7332 Baltimore Ave','College Park Shopping Center',0.6,'South Campus',38.98054396,-76.93900102,'3'),
('4','7314 Baltimore Ave','College Park Shopping Center',0.6,'South Campus',38.98017408,-76.93869013,'4'),
('5','7350 Baltimore Ave','College Park Shopping Center',0.6,'South Campus',38.98099474,-76.93909399,'5'),
('6','7417 Baltimore Ave','Target Express',0.7,'South Campus',38.98168216,-76.93733657,'6'),
('7','7419 Baltimore Ave','Target Express',0.7,'South Campus',38.98184306,-76.93752927,'7'),
('8','8150 Baltimore Ave','View/Varsity',1.2,'North Campus',38.99105104,-76.93426413,'8'),
('9','8424 Baltimore Ave','View/Varsity',1.4,'North Campus',38.99416767,-76.93299699,'9'),
('10','4509 College Ave','Target Express',0.6,'South Campus',38.98208552,-76.93707453,'10'),
('11','8301 Baltimore Ave','View/Varsity',1.3,'North Campus',38.99231602,-76.93318692,'11'),
('12','7422 Baltimore Ave','Target Express',0.6,'South Campus',38.98188846,-76.93809136,'12'),
('13','8428 Baltimore Ave','View/Varsity',1.4,'North Campus',38.99450803,-76.9328946,'13'),
('14','7777 Baltimore Ave Suite A','The Hotel',0.9,'North Campus',38.98705785,-76.93588613,'14'),
('15','7777 Baltimore Ave','The Hotel',0.9,'North Campus',38.987665,-76.93533451,'15'),
('16','8150 Baltimore Ave','View/Varsity',1.2,'North Campus',38.99180376,-76.9337639,'16'),
('17','7313 Baltimore Ave Suite I','College Park Shopping Center',0.7,'South Campus',38.98033004,-76.93765915,'17'),
('18','3711 Campus Dr','Domain',0.2,'South Campus',38.98471383,-76.94952865,'18'),
('19','9680 Baltimore Ave','Best Buy',2.8,'North Campus',39.0143951,-76.92832043,'19'),
('20','4211 Knox Rd','Terrapin Row',0.4,'South Campus',38.98066158,-76.94220669,'20'),
('21','4734 Cherry Hill Rd','Best Buy',3.0,'North Campus',39.01634169,-76.92815666,'21'),
('22','7312 Baltimore Ave','College Park Shopping Center',0.6,'South Campus',38.98009046,-76.9386882,'22'),
('23','9015 Baltimore Ave','View/Varsity',1.8,'North Campus',38.99993873,-76.93088479,'23'),
('24','4509 Knox Rd','College Park Shopping Center',0.7,'South Campus',38.98072844,-76.93686563,'24'),
('25','7313 Baltimore Ave','College Park Shopping Center',0.7,'South Campus',38.9801291,-76.93772946,'25'),
('26','8145 Baltimore Ave Suite A&B','View/Varsity',1.3,'North Campus',38.9914801,-76.9324551,'26'),
('27','8145 Baltimore Ave #M','View/Varsity',1.2,'North Campus',38.99087786,-76.93285357,'27'),
('28','5110 Roanoke Pl #102','View/Varsity',2,'North Campus',38.99511887,-76.92268973,'28'),
('29','4738 Cherry Hill Rd','The Hotel',3,'North Campus',39.01618856,-76.92812157,'29'),
('30','4200 Guilford Dr','Terrapin Row',0.4,'South Campus',38.98053084,-76.9427006,'30'),
('31','4207 Knox Rd','Terrapin Row',0.3,'South Campus',38.98118548,-76.94247843,'31'),
('32','8150 Baltimore Ave','View/Varsity',1.2,'North Campus',38.99153738,-76.93389657,'32'),
('33','8200 Baltimore Ave','View/Varsity',1.3,'North Campus',38.99222751,-76.93388612,'33'),
('34','8321 Baltimore Ave Suite B','The Hotel',1.4,'North Campus',38.99332938,-76.93240495,'34')

/*Create restaurant type table*/
CREATE TABLE [Project.RestaurantType]( 
	restuarantTypeId CHAR(2) NOT NULL, 
    restaurantId CHAR(2), 
    locationId CHAR(2), 
    restaurantType VARCHAR(30), 
	cuisine VARCHAR(30), 
    deliveryAvlbl VARCHAR(3),
	dineIn VARCHAR(3), 
    pickUp VARCHAR(3), 
    driveThru VARCHAR(3)
	CONSTRAINT pk_RestaurantType_restuarantTypeId_restaurantId_locationId PRIMARY KEY (restuarantTypeId,restaurantId,locationId), 
	CONSTRAINT fk_RestaurantInfo_restaurantId FOREIGN KEY (restaurantId)
		REFERENCES [Project.RestaurantInfo] (restaurantId)
		ON DELETE NO ACTION ON UPDATE NO ACTION, 
	CONSTRAINT fk_Location_locationId  FOREIGN KEY (locationId)
		REFERENCES [Project.Location] (locationId)
		ON DELETE NO ACTION ON UPDATE NO ACTION );

/*Insert into the restaurant type table*/
INSERT INTO [Project.RestaurantType] VALUES

('1','1','1','Bar','American','Yes','Yes','No','No'),
('2','2','2','Cafe','Breakfast','Yes','Yes','Yes','No'),
('3','3','3','Casual Dining','Mexican','Yes','Yes','Yes','No'),
('4','4','4','Shop','Dessert','Yes','No','No','No'),
('5','5','5','Casual Dining','Mediterrian','Yes','Yes','No','No'),
('6','6','6','Cafe','Health Food','Yes','Yes','No','No'),
('7','7','7','Casual Dining','Fast Food','No','Yes','Yes','No'),
('8','8','8','Pub','Continental','Yes','Yes','No','No'),
('9','9','9','Diner','Breakfast','Yes','Yes','Yes','No'),
('10','10','10','Casual Dining','Fast Food','Yes','Yes','Yes','No'),
('11','11','11','Casual Dining','Fast Food','Yes','Yes','Yes','Yes'),
('12','12','12','Casual Dining','Sandwich','Yes','Yes','No','No'),
('13','13','13','Casual Dining','Mexican','Yes','Yes','No','Yes'),
('14','14','14','Fine Dining','Breakfast','Yes','Yes','Yes','No'),
('15','15','15','Fine Dining','Fast Food','Yes','Yes','No','No'),
('16','16','16','Casual Dining','Mexican','No','Yes','Yes','No'),
('17','17','17','Cafe','Bubble Tea','Yes','Yes','Yes','No'),
('18','18','18','Cafe','Chinese','Yes','Yes','Yes','No'),
('19','19','19','Cafe','American','Yes','Yes','Yes','No'),
('20','20','20','Cafe','American','Yes','Yes','Yes','No'),
('21','21','21','Diner','Italian','Yes','Yes','Yes','No'),
('22','22','22','Shop','Fast Food','Yes','No','Yes','No'),
('23','23','23','Shop','Fast Food','Yes','No','Yes','No'),
('24','24','24','Casual Dining','Italian','No','Yes','Yes','No'),
('25','25','25','Casual Dining','Vietnamese','Yes','Yes','Yes','No'),
('26','26','26','Casual Dining','Mexican','Yes','Yes','Yes','No'),
('27','27','27','Casual Dining','Japanese','Yes','Yes','Yes','No'),
('28','28','28','Shop','Pakistani','Yes','No','Yes','No'),
('29','29','29','Casual Dining','American','Yes','Yes','Yes','No'),
('30','30','30','Casual Dining','Korean','Yes','Yes','Yes','No'),
('31','31','31','Casual Dining','Japanese','Yes','Yes','Yes','No'),
('32','32','32','Casual Dining','Vegan','Yes','Yes','Yes','No'),
('33','33','33','Cafe','American','No','Yes','Yes','No'),
('34','34','34','Casual Dining','Continental','Yes','Yes','Yes','No')


/*Create social media popularity table*/
CREATE TABLE [Project.SocialMediaPopularity]( 
socialMediaIdId CHAR(2) NOT NULL, 
restaurantId CHAR(2),
fbPage VARCHAR(3), 
fbFollowers CHAR(10), 
instaPage VARCHAR(3),
instaFollowers CHAR(10), 
AvgRating DECIMAL(2,1), 
CONSTRAINT pk_SocialMediaPopularity_socialMediaIdId PRIMARY KEY (socialMediaIdId),
CONSTRAINT fk_SocialMediaPopularity_restaurantId FOREIGN KEY (restaurantId) 
	REFERENCES [Project.RestaurantInfo] (restaurantId) 
    ON DELETE NO ACTION ON UPDATE NO ACTION);


/*Insert into the social media table*/
INSERT INTO [Project.SocialMediaPopularity] VALUES

('1','1','Yes',781,'Yes',4000,4.0),
('2','2','Yes',186,'Yes',289,4.3),
('3','3','Yes',670,'No',NULL,4.1),
('4','4','Yes',353,'Yes',290,3.7),
('5','5','Yes',17,'No',NULL,4.4),
('6','6','Yes',1437,'Yes',1778,4.5),
('7','7','Yes',607,'No',NULL,4.4),
('8','8','Yes',9415,'Yes',5264,4.1),
('9','9','Yes',260,'No',NULL,4.0),
('10','10','Yes',5,'No',NULL,3.5),
('11','11','Yes',37,'No',NULL,3.6),
('12','12','Yes',14,'No',NULL,4.1),
('13','13','Yes',2,'No',NULL,4.2),
('14','14','Yes',2116,'Yes',3266,4.0),
('15','15','Yes',3256,'Yes',5211,4.4),
('16','16','Yes',4004,'Yes',1432,4.5),
('17','17','Yes',635,'Yes',430,4.2),
('18','18','Yes',435,'Yes',147,4.3),
('19','19','Yes',85,'Yes',8,3.2),
('20','20','Yes',221,'Yes',56,3.7),
('21','21','No',NULL,'Yes',2169,4.0),
('22','22','Yes',502,'No',NULL,3.3),
('23','23','Yes',37,'No',NULL,3.4),
('24','24','Yes',332,'Yes',376,4.1),
('25','25','Yes',94,'No',NULL,4.2),
('26','26','Yes',1090,'Yes',1626,4.3),
('27','27','Yes',873,'No',NULL,4.4),
('28','28','Yes',0,'Yes',190,4.1),
('29','29','Yes',713,'Yes',84,4.7),
('30','30','Yes',10,'No',NULL,4.7),
('31','31','Yes',107,'Yes',406,4.7),
('32','32','Yes',1297,'No',NULL,4.6),
('33','33','Yes',62,'Yes',927,4.3),
('34','34','Yes',997,'Yes',1674,4.0)

/*Adding the foreign key from the restaurant info table*/
ALTER TABLE [Project.RestaurantInfo]
	ADD CONSTRAINT fk_RestaurantInfo_locationId FOREIGN KEY (locationId)
		REFERENCES [Project.Location] (locationId) 
		ON DELETE NO ACTION ON UPDATE NO ACTION 

-- Mission Objectives

-- 1.What are the top 5 restaurants with the highest average rating in College Park Area
	SELECT TOP(5) i.restaurantName AS 'Restaurant Name',i.AvgRating AS 'Average Rating'
	FROM [Project.RestaurantInfo] i
	ORDER BY i.AvgRating DESC;

--2. Which are the locations which have the highest rated restaurants?
	SELECT TOP(5) i.restaurantName AS 'Restaurant Name', CONCAT(l.restaurantStreet,',' ,l.restaurantArea) AS 'Restaurant Address'
	FROM  [Project.RestaurantInfo] i, [Project.Location] l
	WHERE i.restaurantId = l.restaurantId
	ORDER BY  i.AvgRating  DESC


--3.What are the average rating of each type of Restaurant?
	SELECT t.restaurantType AS 'Type of Restaurant',AVG(i.AvgRating) AS 'Rating'
	FROM [Project.RestaurantType] t
	JOIN [Project.RestaurantInfo] i
	ON t.restaurantId=i.restaurantId
	GROUP BY t.restaurantType
	ORDER BY AVG(i.AvgRating) DESC

--4.What are the pricing ranges of the top 5 restaurants based on ratings?
	DROP VIEW IF EXISTS Top5RestaurantsPrices
	GO
	CREATE VIEW Top5RestaurantsPrices AS
		SELECT TOP (5) i.restaurantName AS 'Restaurant Name',i.priceInfo AS 'Price Info',i.AvgRating AS 'Average Rating'
		FROM [Project.RestaurantInfo] i
		ORDER BY i.AvgRating DESC

	WITH CHECK OPTION 
	SELECT *
	FROM Top5RestaurantsPrices

--4i.What are the pricing ranges of the all restaurants in college park ?
	Select i.priceInfo As 'Price Range' , count(i.priceInfo) As 'Number of Restaurants'
	FROM [Project.RestaurantInfo] i
	GROUP BY i.priceInfo
	

--5.-- What are the average distance from VMH of the top 5 highly-rated restaurants?
	SELECT AVG(d.distanceFromVMHmiles) AS 'Average Distance'
	FROM (SELECT TOP(5) l.distanceFromVMHmiles
		FROM [Project.Location] l, [Project.RestaurantInfo] i
		WHERE i.restaurantId = l.restaurantId
		ORDER BY i.AvgRating DESC) AS d


--6.What are the top 3 cuisines in College Park that are rated highly?
	SELECT TOP(3) t.cuisine as 'Cuisine Type', AVG(i.AvgRating) AS 'Average Rating'
	FROM [Project.RestaurantInfo] i, [Project.RestaurantType] t 
	WHERE i.restaurantId = t.restaurantId
	GROUP BY t.cuisine
	ORDER BY  AVG(i.AvgRating) DESC
	
--7.How the engagement on Social Media influences Ratings of restaurants?
	SELECT i.restaurantName AS 'Restaurant Type',i.AvgRating AS 'Average Rating',s.instaFollowers AS 'No. of Instagram Followers',
	s.fbFollowers AS 'No. of Facebook Followers'
	FROM [Project.RestaurantInfo] i, [Project.SocialMediaPopularity] s
	WHERE i.restaurantId=s.restaurantId AND s.instaFollowers IS NOT NULL AND s.fbFollowers IS NOT NULL
	ORDER BY i.AvgRating DESC


--8.--When is the popular day and time when people visit highly rated restaurant?(Highly Rated restauarnts have Average Rating geater than the Average of the entire group)
	SELECT i.restaurantName AS 'Restaurant Name',i.popularDay AS 'Popular Day',i.popularTime AS 'Ppular Time'
	FROM [Project.RestaurantInfo] i
	WHERE i.AvgRating>=
		(SELECT AVG(i.AvgRating)
		FROM [Project.RestaurantInfo] i)

--New Mission Objectives

--9.Which area has the highest average rating?
	SELECT TOP(1) l.restaurantArea AS 'Area', AVG(i.AvgRating) AS 'Rating'
	FROM [Project.RestaurantInfo] i, [Project.Location] l
	WHERE i.restaurantId = l.restaurantId
	GROUP BY l.restaurantArea
	ORDER BY AVG(i.AvgRating) DESC


-- 10.For the area that has the highest rating, when is the most popular time of all restaurants in that area?
	SELECT i.restaurantName AS 'Restaurant Name', i.popularDay AS 'Popular Day', i.popularTime AS 'Popular Time'
	FROM [Project.RestaurantInfo] i, [Project.Location] l
	WHERE i.restaurantId = l.restaurantId and l.restaurantArea IN (
		SELECT TOP(1) l.restaurantArea
		FROM [Project.RestaurantInfo] i, [Project.Location] l
		WHERE i.restaurantId = l.restaurantId
		GROUP BY l.restaurantArea
		ORDER BY AVG(i.AvgRating) DESC)


-- 11.What are the top 3 restaurant type in the area that has the highest avg.rating?
	SELECT TOP(3) rt.restaurantType AS 'Restaurant Type', i.restaurantName AS 'Restaurant Name'
	FROM [Project.RestaurantInfo] i, [Project.RestaurantType] rt, [Project.Location] l
	WHERE i.restaurantId = rt.restaurantId and  rt.restaurantId = l.restaurantId and l.restaurantArea IN (
		SELECT TOP(1) l.restaurantArea
		FROM [Project.RestaurantInfo] i, [Project.Location] l
		WHERE i.restaurantId = l.restaurantId
		GROUP BY l.restaurantArea
		ORDER BY AVG(i.AvgRating) DESC) 
	ORDER BY rt.restaurantType DESC

--12.What are count of various cuisines of Restaurants?
	SELECT t.cuisine AS 'Cuisine', COUNT(t.cuisine) AS 'No.of Restaurants'
	FROM [Project.RestaurantType] t
	GROUP BY t.cuisine