require "net/http"
require "json"
require "pry"
require 'dotenv'
Dotenv.load

class Event
  attr_reader :event

  def initialize
    @event_data = get_event

  end

  def list_events
    events = @event_data["events"]
    ready_list = []
    events.each do |event|
     ready_list << event["title"]
   end
    ready_list
  end

  def get_event
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end

  def uri

    key = ENV["EVENT_KEY"]
    URI("https://api.seatgeek.com/2/events?venue.city=Philadelphia&client_id="+key)
  end

end
