# WeatherForecasting

Temp - Means temperature ***

This Project is about displaying the Temp-Min, Temp-Max, windSpeed and Weather-Description.
This contains the 3 mains files in MasterFolder 
	1.WeatherForecasting.xcodeproj
	2.WeatherForecasting
	3.WeatherForecastingTests

Steps to open, build and run the project
Note: you need Mac system to open the project

Please clone the project and open `WeatherForecasting.xcodeproj`

click Product->Build to build the project
Click product->Run to run the project ..

When you run the project, you can see title as "Weather Forecasting"

1.Screen contains one Textfield where you have to enter the city name(I could work only with single city name in the given time limits)
And click on submit

Result- You should see "Temp-Min, Temp-Max, windSpeed and Weather-Description" for the particular city

2.Click on current Location Button, it will ask the pop-up to fetch the current location, give ok. You will be navigating into new screen where the current location data of 5days 3 hours are displayed for current location.


I had written the test case for getting the city name from lat Lon ... I could write more if more use cases are there.

You can get the test report in the folder "/Users/username/Library/Developer/Xcode/DerivedData/projectname/Logs/Test/.plist" after running the test command from Xcode ..

