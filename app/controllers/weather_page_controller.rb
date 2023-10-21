require 'httparty'
class WeatherPageController < ApplicationController
  include HTTParty
  def index
   
  end
  def get_weather
    address = params[:address]
    result = Geocoder.search(address).first
    if result
      lat = result.latitude
      lng = result.longitude
      location = result.display_name
      api_key = '90b6d1ad01738c2fd922e3bf61fbae1d'
      url = "https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lng}&appid=#{api_key}"
      
      #url = https://api.open-meteo.com/v1/forecast?latitude=#{lat}&longitude=#{lng}&hourly=apparent_temperature&temperature_unit=fahrenheit&windspeed_unit=mph&precipitation_unit=inch
      responseContent = self.class.get(url) 
      
      
      response = JSON.parse(responseContent.body)
      ##puts weather_data
      @location = location
      @temperature = response ['main']['temp']
      @description = response ['weather'].first['description']
    
    else
      flash[:alert] = 'Invalid address. Please try again.'
      redirect_to '/weather'
    end
  end
end
