# results = YelpService.search("Lille, activity")

def scrap_yelp

  categories = {
    "musée"               => "Se divertir",
    "théâtre"             => "Se divertir",
    "massage"             => "Bien être",
    "Salles de sport"     => "Sport",
    "Vie nocturne"        => "Sortir",
    "Parcs d'attraction"  => "Se divertir",
    "parcs & jardins"     => "Nature",
    "Promenade"           => "Nature",
    "monument"            => "Se divertir",
    "spa"                 => "Bien être",
    "Sauna & Hammam"      => "Bien être",
    "détente"             => "Bien être",
    "terrain sport"       => "Sport"
  }


  categories.keys.each do |path|

    YelpService.search("Lille","#{path}")["businesses"].each do |result|

      category = categories[path]

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
        price_per_head: result["price"].nil? ? [10,12,15,18,20,24, 30].sample : result["price"],
  #FORMAT: "€€""
        activity_url: result["url"],
        category: category,
  #FORMAT result["categories"]
  #[{"alias"=>"french", "title"=>"French"}]
        indoor: true,
        instructions: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt ac sem vitae faucibus. Pellentesque maximus leo gravida, iaculis velit pulvinar, tristique est. Donec in dui elit. Proin eget libero."
      }
      activity = Activity.new(params)
      photo_url = result["image_url"]
      activity.photos.attach(io: URI.open(photo_url), filename: 'X.jpg', content_type: 'image/jpg')
      puts activity.valid?
      activity.save!
      p activity
    end
  end
end
