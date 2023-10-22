# Weather Forecast App

This is a simple weather forecast application developed using Ruby on Rails. It allows users to input an address, retrieve weather forecast data for the provided location (based on the zip code), and display the forecast details. The application also caches forecast details for 30 minutes to improve performance and displays an indicator if the result is pulled from the cache.

## Requirements

- Ruby on Rails: The application is implemented using the Ruby on Rails framework.
- Address Input: Users can input an address, and the application will extract the zip code for weather forecast retrieval.
- Weather Forecast Data: The application retrieves at least the current temperature, and it provides a bonus feature to retrieve high/low and extended forecasts.
- Display: The requested weather forecast details are displayed to the user.
- Caching: Forecast details are cached for 30 minutes for all subsequent requests by zip codes. An indicator is displayed when the result is pulled from the cache.

## Usage

1. Input an address to retrieve weather forecast data.
2. View the forecast details, including current temperature, high/low forecast, and extended forecast 6 days past today's date.
3. The application will cache forecast data for 30 minutes to enhance performance and reduce redundant requests.
4. If a result is obtained from the cache, an indicator will be displayed to notify the user above the daily weather.

## Setup

To run this application locally, follow these steps:

1. Clone the repository: `git clone https://github.com/icourtneyjo/WeatherApp.git`
2. Navigate to the project directory: `cd WeatherApp`
3. Install dependencies: `bundle install`
4. Run the application: `rails server`
5. Access the application in your web browser at stated url in terminal 

