# 🌦️ Weather Dataset Analysis

## 📌Overview
This project involves analyzing a weather dataset to extract meaningful insights and visualize trends. The dataset contains meteorological data over a specific time period, including temperature, humidity, wind speed, and weather conditions. Various analytical and visualization techniques are applied to understand weather patterns and explore relationships between different variables.


## 📂Dataset Description
The dataset contains the following key columns:

* Date/Time: The timestamp of the observation.
* Temp_C: Temperature in degrees Celsius.
* Dew Point Temp_C: Dew point temperature in degrees Celsius.
* Rel Hum_%: Relative humidity as a percentage.
* Wind Speed_km/h: Wind speed in kilometers per hour.
* Visibility_km: Visibility in kilometers.
* Press_kPa: Atmospheric pressure in kilopascals.
* Weather: Weather condition (e.g., Clear, Fog, Rain, etc.).


### Additional Derived Column
* Day/Night: Categorizes observations as Day (6:00 AM to 5:59 PM) or Night (6:00 PM to 5:59 AM) based on the time of day.


## 📊 Analysis Performed
The following analyses were conducted on the dataset:

### 1. Temperature Analysis:
* Daily Average, Minimum, and Maximum Temperatures, Analyzed and visualized temperature trends over time.
### 2. Weather Condition Analysis:
* Frequency of specific weather conditions such as "Snow", "Rain", "Fog," etc.
### 3. Time-Based Analysis:
* Differences in weather patterns between day and night.
### 4. Relationships Between Variables:
* Correlation between dew point temperature and actual temperature.
### 5. Extreme Weather Events:
Identified days with extreme temperatures, low visibility, or high wind speeds.


## 🔍 Key Insights
* #### Night-time observations showed lower temperatures and higher humidity compared to daytime.
* #### The hottest and coldest days were identified using MAX(Temp_C) and MIN(Temp_C).
* #### Monthly analysis shows that colder months have more temperature variation, while warmer months are relatively stable.
* #### Some days had both freezing temperatures and poor visibility.
* #### Higher temperatures tend to correspond with lower relative humidity.
* #### Colder temperatures show higher humidity values.

## 🚀 Conclusion
* #### ✅ The dataset provides valuable insights into temperature, humidity, wind, and weather conditions over time.
* #### ✅ Seasonal trends and extreme weather events were identified, which can be used for forecasting.
* #### ✅ Correlation analysis helped understand how different variables interact with each other.
* #### ✅ Day vs. Night analysis showed clear distinctions in temperature, humidity, and visibility.

These insights can be useful for weather forecasting, climate research, and decision-making in fields like agriculture, aviation, and transportation.

## 🛠️ Technologies Used
* #### Python 🐍: Pandas, Matplotlib, Seaborn
* #### SQL 💾: MySQL 
* #### Jupyter Notebook 📓: For interactive analysis
* #### GitHub 🔗: For version control and sharing

## 🔮 Future Work
* ✅ Apply Machine Learning for weather prediction.
* ✅ Integrate real-time weather API to fetch live data.


