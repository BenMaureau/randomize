require 'open-uri'
require 'nokogiri'





require 'httparty'

# puts HTTParty.get(url)
# puts HTTParty.post("https://lechti.com/wp-json/facetwp/v1/refresh", body: {action: "facetwp_refresh"})
# sleep(2)


# paths.each do |path| 
#   url = "#{base_url}#{path}"
#   html_file = URI.open(url).read
#   html_doc = Nokogiri::HTML(html_file)
#   puts "Scrapping path >>> #{path}"
#   html_doc.search('.card-place__wrapper').each do |element|
#     puts element.search('h3').text
#   end
# end

def scrap_lechti
  categories = ["Sport", "Social", "Culture", "Nature", "Bien-être", "Sensation"]
  base_url = "https://lechti.com/"
  paths = ["manger", "sortir", "se-divertir"]

  paths.each do |path|
    url = "#{base_url}#{path}"
    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML(html_file)
    puts "Scrapping path >>> #{path}"
    html_doc.search('.card-place').each do |card|
      link_to_card_show = card.attribute('href').value
  
      html_file = URI.open(link_to_card_show).read
      html_doc = Nokogiri::HTML(html_file)
  
      # puts "result: #{html_doc.search('.info-place__websites-link')}"
      # puts "empty: #{html_doc.search('.info-place__websites-link').empty?}"
      # puts "nil: #{html_doc.search('.info-place__websites-link').nil?}"
      activity_url =  html_doc.search('.info-place__websites-link').attribute('href').value unless html_doc.search('.info-place__websites-link').empty?
      category = path == "se-divertir" ? categories[0] : categories[1]
      params = {
        name: html_doc.search('h1').text,
        address: html_doc.search('.info-place__address-text').text,
        price_per_head: [10,12,15,18,20,24, 30].sample,
        activity_url: activity_url,
        category: category,
        indoor: path != "se-divertir",
        instructions: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt ac sem vitae faucibus. Pellentesque maximus leo gravida, iaculis velit pulvinar, tristique est. Donec in dui elit. Proin eget libero."
      }
  
      activity = Activity.new(params)
  
      photo_url = html_doc.search('.header-place__photos-large img').attribute('data-src')
      activity.photos.attach(io: URI.open(photo_url), filename: 'X.jpg', content_type: 'image/jpg')
      puts activity.valid?
      activity.save!
    end
  end
end



# validates :name, :address, :price_per_head, :activity_url, :longitude, :latitude, presence: true
# name = first.search('h3').text
# address = first.search()
# price_per_head = 
# activity_url = 
