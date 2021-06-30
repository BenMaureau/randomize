# results = YelpService.search("Lille, activity")

def scrap_yelp

  categories = {
    "musée"               => "Se divertir",
    "théâtre"             => "Se divertir",
    "massage"             => "Bien être",
    "Salles de sport"     => "Sport",
    # "Vie nocturne"        => "Sortir",
    "Parcs d'attraction"  => "Se divertir",
    "parcs & jardins"     => "Nature",
    "Promenade"           => "Nature",
    "monument"            => "Se divertir",
    "spa"                 => "Bien être",
    "Sauna & Hammam"      => "Bien être",
    "détente"             => "Bien être",
    "terrain sport"       => "Sport"
  }


  categories.keys.each do |key|
    puts key
    YelpService.search("Lille",key)["businesses"].each do |result|

      category = categories[key]
      # category = "Bien être"

      params = {
        name: result["name"],
        address: result["location"]["display_address"].join,
  # FORMAT de address: result["location"]
  #{"address1"=>"15 rue Fossés",
  #  "address2"=>"",
  #  "address3"=>"",
  #  "city"=>"Lille",
  #  "zip_code"=>"59000",
  #  "country"=>"FR",
  #  "state"=>"59",
  #  "display_address"=>["15 rue Fossés", "59000 Lille", "France"]}
  #FORMAT FINAL : "106 bis rue Saint-André59800 LilleFrance"
        # price_per_head: result["price"] unless result["price"].empty?,
        price_per_head: (result["price"].nil? || result["price"].to_i<1)  ? [10,12,15,18,20,24, 30].sample : result["price"].to_i,
  #FORMAT: "€€""
        activity_url: result["url"],
        category: category,
  #FORMAT result["categories"]
  #[{"alias"=>"french", "title"=>"French"}]
        indoor: category == "Nature" ? true : 0.75 > rand(),
        instructions: "Description indisponible"
      }
      activity = Activity.new(params)
      photo_url = result["image_url"]
      photo_url = "https://images.unsplash.com/photo-1443916568596-df5a58c445e9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2089&q=80" if photo_url.size.zero?
      activity.photos.attach(io: URI.open(photo_url), filename: 'X.jpg', content_type: 'image/jpg')
      
      if activity.valid?
        activity.save!
        puts "#{activity.valid?} > Added : #{params[:name]}"
      else
        puts "#{activity.valid?} > Error : #{params[:name]}"
      end
    end
  end
end
