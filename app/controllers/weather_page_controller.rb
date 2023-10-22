require 'httparty'
class WeatherPageController < ApplicationController
  include HTTParty
  def index
   
  end
  def get_weather
    address = params[:address]
    result = Geocoder.search(address)
    
    if !result.first.nil? && result.first.city.present?
      cache_key = result.first.city 

    # Check if data is already cached
    cached_data = Rails.cache.read(cache_key)

    if cached_data.nil?
      # Data is not cached, fetch and store it
      lat = result.first.latitude
        lng = result.first.longitude
        location_city = result.first.city
        location_state = result.first.state
        api_key = '90b6d1ad01738c2fd922e3bf61fbae1d'
        url = "https://api.openweathermap.org/data/2.5/forecast?lat=#{lat}&lon=#{lng}&cnt=40&appid=#{api_key}&units=imperial"
        
    
        responseContent = self.class.get(url) 
        
        
        response = JSON.parse(responseContent.body)
      
        @location_city = location_city
        @location_state = location_state
        @temperature = response ['list'][0]['main']['temp']
        @temp_max = response ['list'][0]['main']['temp_max']
        @temp_min = response ['list'][0]['main']['temp_min']
        @weeklyForecast = response
        @cached = 'No'
        @description =  response ['list'][0]['weather'].first['description']
        data = response

      # Cache the data for 30 minutes
      Rails.cache.write(cache_key, data, expires_in: 30.minutes)

    else
      @cached = 'Yes'
      response = cached_data
      @location_city = cache_key
      @location_state = cached_data['city']['country']
      @temperature = response ['list'][0]['main']['temp']
      @temp_max = response ['list'][0]['main']['temp_max']
      @temp_min = response ['list'][0]['main']['temp_min']
      @weeklyForecast = response
      
      @description =  response ['list'][0]['weather'].first['description']
      data = response
    
    end
    else
      respond_to do |format|
        format.js { render js: "alertError('This is an error message from Rails!');" }
      end
    end
  end
end
