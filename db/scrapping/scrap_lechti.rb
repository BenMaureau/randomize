require 'open-uri'
require 'nokogiri'

url = "https://lechti.com/manger"




require 'httparty'

# puts HTTParty.get(url)
puts HTTParty.post("https://lechti.com/wp-json/facetwp/v1/refresh", body: {
  action: "facetwp_refresh",
  
})
# sleep(2)
# html_file = URI.open(url).read
# html_doc = Nokogiri::HTML(html_file)
# html_doc.search('.card-place__wrapper').each do |element|
#   puts element.search('h3').text
# end
