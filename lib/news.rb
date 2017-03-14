require "net/http"
require "json"
require "pry"
require 'dotenv'
Dotenv.load

class News
  attr_reader :news

  def initialize
    @news_data = get_news
  end

  def show_news
    count = 0
    news_snippets = []
    while count < 5
      news_snippets << snippet = @result["response"]["docs"][count]["snippet"]
      count += 1
    end
    news_snippets
  end


  def get_news
    key = ENV["NEWS_KEY"]
    uri = URI("https://api.nytimes.com/svc/search/v2/articlesearch.json")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    uri.query = URI.encode_www_form({
      "api-key" => key,
      "fq" => "news_desk:(\"Today\")",
      "glocations" => ("PHILADELPHIA"),
      })
      request = Net::HTTP::Get.new(uri.request_uri)
      @result = JSON.parse(http.request(request).body)
      puts @result.inspect
  end

end
