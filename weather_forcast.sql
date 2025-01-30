#Retrieve all Records
SELECT * FROM shree.`weather data`;
use shree;

#Rename table
RENAME TABLE `weather data` TO weather_data;

select * from weather_data;

#Rename column Weather
alter table weather_data
rename column Weather to Weather_Conditions;

#Count of all records
select count(*) from weather_data;

#distinct weather conditions
select distinct Weather_Conditions from weather_data;

# Diff weather conditions and their count
select Weather_Conditions ,count(*) as conditions_count from weather_data
group by Weather_Conditions  ;


# Number of fog count and snow count
SELECT 
    SUM(CASE WHEN Weather_Conditions LIKE '%Fog%' THEN 1 ELSE 0 END) AS Fog_Count,
    SUM(CASE WHEN Weather_Conditions LIKE '%Snow%' THEN 1 ELSE 0 END) AS Snow_Count
FROM weather_data;

# average Temperature
select avg(Temp_C) as Average_Temperature
from weather_data;

# minimum and maximum temperature
select min(Temp_C) as Min_Temperature,
 max(Temp_C) as max_Temperature
 from weather_data;

# change datatype of DateTime column
SET SQL_SAFE_UPDATES = 0;

update weather_data
set `Date/Time`= str_to_date(`Date/Time`, '%m/%d/%Y %H:%i');

alter table weather_data
CHANGE COLUMN date_time Datetime DATETIME;

DESCRIBE weather_data;

SET SQL_SAFE_UPDATES = 1;

# most humid day
SELECT `DateTime`, `Rel Hum_%`
FROM weather_data
ORDER BY `Rel Hum_%` DESC;

# pressure trend over time
SELECT DateTime, Press_kPa FROM weather_data
ORDER BY DateTime;

# days with freezing temperatures
select * from weather_data
where Temp_C <= 0;

# wind speed by datetime
select `DateTime` ,`Wind speed_km/h` 
from weather_data
order by `Wind speed_km/h` desc ;

# average pressure by date
SELECT DATE(DateTime) AS Date, AVG(Press_kPa) AS Avg_Pressure
FROM weather_data
GROUP BY DATE(DateTime)
ORDER BY Date;

# average visibility
select avg(Visibility_km) as avg_visibility
from weather_data;

#Hourly Temperature Analysis with Day/Night Classification
SELECT @@sql_mode;

SET sql_mode = 'STRICT_TRANS_TABLES';

SELECT 
      Hour(DateTime) as hour, 
      avg(Temp_C) as avg_Temperature,
    CASE
        WHEN
            HOUR(`DateTime`) >= 18
                OR HOUR(`DateTime`) < 6
        THEN
            'Night'
        ELSE 'Day'
    END AS `DateNight`
FROM
    weather_data
group by Hour(`DateTime`);   

SET sql_mode = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


# days with Freezing Temperatures
SELECT 
    DATE(DateTime) AS Freezing_Day,
    COUNT(*) AS Freezing_Observations
FROM 
    weather_data
WHERE 
    Temp_C <= 0
GROUP BY 
    DATE(DateTime)
ORDER BY 
    Freezing_Day;
    
# days with Low Visibility (< 1 km):
SELECT 
    DATE(`DateTime`) AS Low_visibility_day,
    COUNT(*) AS Low_visibility_observations
FROM
    weather_data
WHERE
    Visibility_km < 1
GROUP BY DATE(`DateTime`)
ORDER BY Low_visibility_day;

# maximum wind speed recorded per day
SELECT 
    DATE(`DateTime`) AS Observation_day,
    MAX(`Wind speed_km/h`) AS Max_wind_speed
FROM
    weather_data
GROUP BY DATE(`DateTime`)
ORDER BY Observation_day;

#Average temperature by season
SELECT 
    CASE
        WHEN MONTH(`DateTime`) IN (12 , 1, 2) THEN 'Winter'
        WHEN MONTH(`DateTime`) IN (3 , 4, 5) THEN 'Spring'
        WHEN MONTH(`DateTime`) IN (6 , 7, 8) THEN 'Summer'
        WHEN MONTH(`DateTime`) IN (9 , 10, 11) THEN 'Autumn'
    END AS Season,
    AVG(Temp_C) AS avg_Temperature
FROM
    weather_data
GROUP BY Season
ORDER BY FIELD(Season,
        'Winter',
        'Spring',
        'Summer',
        'Autumn');
        
# average visibility for different humidity levels (groups the humidity values into bins of 10% intervals)
select floor(`Rel Hum_%`/ 10)*10 as Humidity_bin,
avg(Visibility_km) as avg_visibility
from weather_data
group by Humidity_bin
order by Humidity_bin;