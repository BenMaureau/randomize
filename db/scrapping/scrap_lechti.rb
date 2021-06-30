require 'open-uri'
require 'nokogiri'

require 'rest-client'

def scrap_lechti
  categories = ["Manger", "Sortir", "Se divertir", "Nature", "Sport", "Bien être"]

  base_url = "https://lechti.com/"
  paths = ["manger", "sortir", "se-divertir"]

  paths.each do |path|
    category = "Manger" if path == "manger"
    category = "Sortir" if path == "sortir"
    category = "Se divertir" if path == "se-divertir"

    url = "#{base_url}#{path}"
    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML(html_file)
    puts "Scrapping path >>> #{path}"
    html_doc.search('.card-place').each do |card|
      link_to_card_show = card.attribute('href').value

      html_file = URI.open(link_to_card_show).read
      html_doc = Nokogiri::HTML(html_file)

      activity_url =  html_doc.search('.info-place__websites-link').attribute('href').value unless html_doc.search('.info-place__websites-link').empty?
      params = {
        name: html_doc.search('h1').text,
        address: html_doc.search('.info-place__address-text').text,
        price_per_head: (1..40).to_a.sample,
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

def scrap_lechti_v2
  categories = ["Manger", "Sortir", "Se divertir", "Nature", "Sport", "Bien être"]
  base_url = "https://lechti.com/wp-json/facetwp/v1/refresh"
  paths = ["manger", "sortir", "se-divertir"]


  paths.each do |path|
    puts "################# #{path} ##############"
    category = "Manger" if path == "manger"
    category = "Sortir" if path == "sortir"
    category = "Se divertir" if path == "se-divertir"

    current_page = 1
    while current_page <= 1 do
      r = RestClient.post(base_url, {
        :action => 'facetwp_refresh',
        "data[facets]".to_sym => "{\"place-type\":[],\"eat\":[],\"average-price\":[],\"specific-criteria\":[],\"localisation\":[],\"chti-criteria\":[],\"chti-label\":[],\"paged\":#{current_page}}",
        "data[http_params][uri]".to_sym => path,
        "data[paged]".to_sym =>	"#{current_page}"
      })
      r_parsed = JSON.parse(r.body)
      puts "############ Page #{current_page}"

      html_file = r_parsed["template"]
      html_doc = Nokogiri::HTML(html_file)
      html_doc.search('.card-list__item > a').each do |card|
        link_to_card_show = card.attribute('href').value

        html_file = URI.open(link_to_card_show).read
        html_doc = Nokogiri::HTML(html_file)

        activity_url =  html_doc.search('.info-place__websites-link').attribute('href').value unless html_doc.search('.info-place__websites-link').empty?

        params = {
          name: html_doc.search('h1').text,
          address: html_doc.search('.info-place__address-text').text,
          price_per_head: [10,12,15,18,20,24, 30].sample,
          activity_url: activity_url,
          category: category,
          indoor: 0.75 > rand(),
          instructions: html_doc.search('.redac-chti__content-text').text.strip
        }

        activity = Activity.new(params)

        photo_url = html_doc.search('.header-place__photos-large img').attribute('data-src')
        activity.photos.attach(io: URI.open(photo_url), filename: 'X.jpg', content_type: 'image/jpg')
        if activity.valid?
          activity.save!
          puts "#{activity.valid?} > Added : #{params[:name]}"
        else
          puts "#{activity.valid?} > Error : #{params[:name]}"
        end

      end
      current_page += 1
    end
  end

end
