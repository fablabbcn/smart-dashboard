require 'net/http'
require 'json'

module Smartcitizen
    DEVICE_URL = "https://api.smartcitizen.me/v0/devices/3301"

    def get_device_data
      smartdata = {
        smartdata: send_request(DEVICE_URL)
      }
    end

end
