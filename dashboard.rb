require "./lib/geolocation"
require "sinatra/base"
require "pry"
require "./lib/temperature"
require "./lib/event"
require "./lib/news"


require "dotenv"
Dotenv.load

class Dashboard < Sinatra::Base
  get("/") do
    @ip = "50.207.238.51"
    @geolocation = Geolocation.new(@ip)
    erb :dashboard
  end

  get "/weather" do
    @temperature = Temperature.new
    erb :weather
  end

  get"/events" do
    @event = Event.new
    erb :events
  end

  get "/news" do
  @news = News.new
  erb :news
  end
end
