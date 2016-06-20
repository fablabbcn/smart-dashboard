require 'net/http'
require 'json'

module Weather
    WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?"

    def get_weather(lat, lon)
      forecast = {
        forecast: send_request("#{WEATHER_URL}lat=#{lat}&lon=#{lon}&appid=#{"98210a47f68e2d34011163076dd967c1"}")
      }
    end

end
