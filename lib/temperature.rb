require "net/http"
require "json"
require "pry"
require 'dotenv'
Dotenv.load

class Temperature
  attr_reader :temperature

  def initialize
    @temp_data = get_temperature
  end

  def temperature
    @temp_data["currently"]["summary"]
  end

  def actual_temperature
    actual = @temp_data["currently"]["temperature"]
  end

  def feels_like_temperature
    feels_like = @temp_data["currently"]["apparentTemperature"]
  end

  def get_temperature
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end

  def uri
    key = ENV["WEATHER_KEY"]
    URI("https://api.darksky.net/forecast/" + key + "/39.9526,-75.1652")
  end

end
