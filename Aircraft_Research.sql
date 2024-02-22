USE aircraft;

-- See all records from the aircraft table
SELECT * FROM aircraft_table;

-- Q : How many aircraft model in the dataset ?
-- A : 10 models of aircraft are in the dataset.
SELECT  COUNT(DISTINCT Aircraft_Model)  as Total_Model
FROM aircraft_table;

-- Q : What is the model of the 10 aircraft in the dataset ?
-- A : Airbus A320, Airbus A380, Beechcraft King Air 350, Boeing 737-800, Boeing 747-8, Boeing 777, Bombardier Global 6000, Cessna 172, Embraer E190, Gulfstream G650
SELECT DISTINCT(Aircraft_Model) 
FROM aircraft_table;

-- Q : What is the average weight of a plane without passengers and goods in cargo, just the plane's body ?
-- A : The average weight of a plane when empty is 150,550 kilograms or 150 tons
SELECT AVG(Empty_Weight) FROM aircraft_table;

-- Q : Which plane can carry the most weight at takeoff ?
-- A : Boeing 737-800, With the maximum weight can carry when takeoff is 1.498.139 kg
SELECT Aircraft_Model, Maximum_Takeoff_Weight
FROM aircraft_table
ORDER BY Maximum_Takeoff_Weight DESC
LIMIT 5;

-- Q : What aircraft capable of taking off with a weight greater than 500,000 kg ?
-- A : 9479 total aircraft that can carry a weight > 500.000 kg
SELECT Aircraft_Model
FROM aircraft_table
WHERE Maximum_Takeoff_Weight > 500000;

-- Q : Which aircraft model has the maximum fuel capacity ?
-- A : Cesna 172 has a 499.953-liter fuel capacity.
 SELECT Aircraft_Model, Fuel_Capacity
 FROM aircraft_table
 ORDER BY Fuel_Capacity DESC
 LIMIT 5;
 
 -- Q : How many engine types do the aircraft use ?
 -- A : There are three engine types in the dataset. Turboprop use by 8.415 aircraft, Turbofan use by 8.381 aircraft, and Piston use by 8204 aircraft
SELECT Engine_Type, COUNT(*) as Total
FROM aircraft_table
GROUP BY Engine_Type;

-- Q : Which aircraft can fly at the maximum altitude ?
-- A : Boeing 747-8 can fly at 60.000 Feet (18.288 Meters)
SELECT Aircraft_Model, Maximum_Altitude
FROM aircraft_table
ORDER BY Maximum_Altitude DESC;

-- Q : How many total aircraft has the highest speed ?
-- A : The maximum speed aircraft can reach is 700 knots, there are 79 aircraft that can reach 700 knots
SELECT Maximum_Speed, COUNT(*) as Total
FROM aircraft_table
GROUP BY Maximum_Speed
ORDER BY Maximum_Speed DESC;

-- Q : What average wing loading for each engine type ?
-- Wing loading is an indicator that measures the capability of an aircraft to accept a load. Higher wing loading means aircraft can support more load
-- A : Turbofan has 599 kg/m2 wing loading, Turboprop has 597 kg/m2 wing loading, and Turbofan has 598 kg/m2 wing loading
SELECT Engine_Type, AVG(Wing_Loading) 
FROM aircraft_table
GROUP BY Engine_Type;

-- Q : What aircraft model has the highest ratio of maximum speed to empty weight?
-- This metric shows how effective it is for an aircraft to reach a maximum speed concerning its empty weight.
-- A : Airbus A320 has the highest ratio for this metric.
SELECT Aircraft_Model, MAX(Maximum_Speed / Empty_Weight) AS Ratio FROM aircraft_table;

-- Q : What plane can carry more than 400 passengers ?
-- A : 5.507 of 25.000 aircraft have more than 100 passenger seats 
SELECT Aircraft_Model, Maximum_Passengers
FROM aircraft_table
WHERE Maximum_Passengers > 400;

-- Q : Which company produces most aircraft ?
-- A : Boeing is the company that produces the most aircraft with a total of 7.544, while Airbus comes in second with 5046.
SELECT SUBSTRING_INDEX(Aircraft_Model, ' ', 1) AS Company_Name , COUNT(*) as Total
from aircraft_table
GROUP BY Company_Name
order by Total desc;

-- Q : How many total for each aircraft model with maximal passenger > 400 
-- A : Each aircraft model has a similar value to other aircraft. around 500 for each aircraft
SELECT Aircraft_Model, COUNT(*) as Total
FROM aircraft_table
WHERE Maximum_Passengers > 400
GROUP BY Aircraft_Model
ORDER BY Total DESC;

-- Q : How many total for each aircraft model with maximal passenger <= 100 ?
-- A : Each aircraft model has a similar value to other aircraft. range from 517 to 591.
SELECT Aircraft_Model, COUNT(*) as Total
FROM aircraft_table
WHERE Maximum_Passengers <= 100
GROUP BY Aircraft_Model
ORDER BY Total DESC;

-- Aircraft type based on the maximum number of passengers
-- Condition : <=100 Seats --> SMALL, 101 - 200 seats --> MEDIUM, 201 - 400 seats --> LARGE, 401-500 seats --> SUPER LARGE
SELECT Aircraft_Model, Maximum_Passengers, 
	CASE WHEN Maximum_Passengers <= 100 THEN 'Small' -- I used CASE WHEN
		 WHEN Maximum_Passengers > 100 AND Maximum_Passengers < 201 THEN 'Medium'
		 WHEN Maximum_Passengers > 200 AND Maximum_Passengers < 401 THEN 'Large'
		 ELSE 'Super Large'
	END as Aircraft_Type
FROM aircraft_table;

-- Add a new column 'Aircraft_Type'
-- I use ALTER TABLE to make a new column, and then use UPDATE to update the row for this column based on the condition above.
ALTER TABLE aircraft_table
ADD Aircraft_Type VARCHAR(20);

UPDATE aircraft_table
SET Aircraft_Type = 
	CASE WHEN Maximum_Passengers <= 100 THEN 'Small' -- I used CASE WHEN
		 WHEN Maximum_Passengers > 100 AND Maximum_Passengers < 201 THEN 'Medium'
		 WHEN Maximum_Passengers > 200 AND Maximum_Passengers < 401 THEN 'Large'
		 ELSE 'Super Large'
	END;

-- Q : How average is an aircraft based on its type? Does small aircraft have a higher average than others ?
-- A : Super large aircraft have the highest average maximum speed, that is 551 knots; large and medium aircraft have 550 knots; and small aircraft have 549 knots
SELECT Aircraft_Type, AVG(Maximum_Speed)
FROM aircraft_table
GROUP BY Aircraft_Type;

