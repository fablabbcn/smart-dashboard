include Restful
include Weather

LOCATION = ["41.3862036", "2.175894"]

def make_forecast(latitude, longitude)
  forecast = get_weather(latitude,longitude)
end

SCHEDULER.every '10m', :first_in => 0 do |job|

  @forecast = make_forecast(LOCATION[0], LOCATION[1])

  if @forecast
    send_event('weather', {
        name: @forecast[:forecast].doc["name"],
        country: @forecast[:forecast].doc["sys"]["country"],
        coord: @forecast[:forecast].doc["coord"],
        icon: @forecast[:forecast].doc["weather"][0]["icon"],
        main: @forecast[:forecast].doc["weather"][0]["main"],
        description: @forecast[:forecast].doc["weather"][0]["description"],
        temp: @forecast[:forecast].doc["main"]["temp"],
        humidity: @forecast[:forecast].doc["main"]["humidity"],
        temp_min: @forecast[:forecast].doc["main"]["temp_min"],
        temp_max: @forecast[:forecast].doc["main"]["temp_max"]
      })

  end
end
