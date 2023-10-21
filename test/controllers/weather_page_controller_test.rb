require "test_helper"

class WeatherPageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get weather_page_index_url
    assert_response :success
  end
end
