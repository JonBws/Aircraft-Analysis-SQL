# Aircraft-Analysis-SQL 

## Overview 
This is my SQL project on the aircraft dataset; the dataset was obtained from Kaggle. This dataset consists of information about aircraft such as aircraft model, empty weight (kg), Takeoff Weight (kg),Maximum Landing Weight (kg),Center of Gravity Limits,Wing Loading (kg/m²),Tail Loading (kg/m²),Fuel Capacity (liters),Number of Passengers,Cargo Capacity (kg),Maximum Altitude (ft),Maximum Speed (knots),Engine Type,and Fuselage Length (m). In this project, I am importing the CSV data from Python to MySQL using Sqlalchemy and then answering questions about the data for analysis. I use basic statements and functions in SQL, such as SELECT, WHERE, GROUP BY, ORDER BY, LIMIT, ALTER TABLE, UPDATE TABLE, DESC, AVG(), COUNT(), SUBSTRING_INDEX(), and MAX().

## Data Analysis 
The first step that I take in this project is to load the data in Python using Pandas, then explore the data to learn more about the data, like the missing value, duplicate value, and statistic information (mean, median, and mode). I remove columns that I do not want to use and fix column names before importing into the MySql database. After importing the data into MySql, I answered the following question based on the data: 
1. How many aircraft models are in the dataset?
2. What is the model of the aircraft in the dataset?
3. What is the average weight of a plane without passengers and goods in cargo, just the plane's body?
4. Which plane can carry the most weight at takeoff?
5. What aircraft is capable of taking off with a weight greater than 500,000 kg?
6. Which aircraft model has the maximum fuel capacity ?
7. How many engine types do the aircraft use?
8. Which aircraft can fly at the maximum altitude?
9. How many total aircraft have the highest speed?
10. What is the average wing loading for each engine type?
11. What aircraft model has the highest ratio of maximum speed to empty weight?
12. What plane can carry more than 400 passengers?
13. How many total for each aircraft model with a maximum passenger capacity greater than 400?
14. Which company produces the most aircraft?
15. How many total for each aircraft model with maximal passenger <= 100?
16. How average is an aircraft based on its type? Does small aircraft have a higher average than others?
