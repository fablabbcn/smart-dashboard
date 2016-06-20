include Restful
include Smartcitizen

def get_data
  smartdata = get_device_data
end

SCHEDULER.every '10m', :first_in => 0 do |job|
  @smartdata = get_data

  if @smartdata
    send_event('smartcitizen', {
      name: @smartdata[:smartdata].doc["name"]
    })
    send_event('meter', {
      value: @smartdata[:smartdata].doc["data"]["sensors"][0]["value"]
    })
  end
end
