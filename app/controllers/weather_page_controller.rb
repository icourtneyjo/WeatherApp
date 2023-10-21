require 'httparty'
class WeatherPageController < ApplicationController
  include HTTParty
  def index
   
  end
  def get_weather
    address = params[:address]
    result = Geocoder.search(address)
    
    if result
      lat = result.first.latitude
      lng = result.first.longitude
      location_city = result.first.city
      location_state = result.first.state
      api_key = '90b6d1ad01738c2fd922e3bf61fbae1d'
      url = "https://api.openweathermap.org/data/2.5/forecast?lat=#{lat}&lon=#{lng}&cnt=40&appid=#{api_key}&units=imperial"
      
      #url = https://api.open-meteo.com/v1/forecast?latitude=#{lat}&longitude=#{lng}&hourly=apparent_temperature&temperature_unit=fahrenheit&windspeed_unit=mph&precipitation_unit=inch
      responseContent = self.class.get(url) 
      
      
      response = JSON.parse(responseContent.body)
      ##puts weather_data
      @location_city = location_city
      @location_state = location_state
      @temperature = response ['list'][0]['main']['temp']
      @temp_max = response ['list'][0]['main']['temp_max']
      @temp_min = response ['list'][0]['main']['temp_min']
      @weeklyForecast = response
 
      @description =  response ['list'][0]['weather'].first['description']
    
    else
      flash[:alert] = 'Invalid address. Please try again.'
      redirect_to '/weather'
    end
  end
end
