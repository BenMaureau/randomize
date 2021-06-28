# require "json"
require "rest-client"

class YelpService
  API_HOST = "https://api.yelp.com"
  SEARCH_PATH = "/v3/businesses/search"
  BUSINESS_PATH = "/v3/businesses/"
  DEFAULT_BUSINESS_ID = "yelp-lille"
  DEFAULT_TERM = "Burger"
  SEARCH_LIMIT = 25

  API_KEY = ENV["YELP_API_KEY"]

  def self.search(location)
    url = "#{API_HOST}#{SEARCH_PATH}"
    params = {
      # term: term,
      location: location,
      limit: SEARCH_LIMIT
    }
    bear_token = "Bearer #{API_KEY}"
    response = RestClient.get(url, { Authorization: bear_token, params: params })
    data = JSON.parse(response.body)
  end
end
