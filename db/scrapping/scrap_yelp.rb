# results = YelpService.search("Lille, activity")

def scrap_yelp

  YelpService.search("Lille")["businesses"].each do |activity|
    params = {
      name: activity["name"],
      address: activity["location"]["display_address"].join,
# FORMAT de address: activity["location"]
#{"address1"=>"15 rue Fossés",
#  "address2"=>"",
#  "address3"=>"",
#  "city"=>"Lille",
#  "zip_code"=>"59000",
#  "country"=>"FR",
#  "state"=>"59",
#  "display_address"=>["15 rue Fossés", "59000 Lille", "France"]}
#FORMAT FINAL : "106 bis rue Saint-André59800 LilleFrance"
      price_per_head: activity["price"],
#FORMAT: "€€""
      activity_url: activity["url"],
      category: activity["categories"].sample["alias"],
#FORMAT activity["categories"]
#[{"alias"=>"french", "title"=>"French"}]
      indoor: true,
      instructions: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt ac sem vitae faucibus. Pellentesque maximus leo gravida, iaculis velit pulvinar, tristique est. Donec in dui elit. Proin eget libero."
    }
    activity = Activity.new(params)
  end
end
