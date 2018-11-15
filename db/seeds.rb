# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

washington = State.find_or_create_by(name: "Washington")
seattle = washington.locations.create(name: "Seattle and Seattle Eastside")
waterTower = seattle.routes.create(
  name: "Volunteer Park Water Tower",
  imgMedium: "https://cdn-files.apstatic.com/climb/106517600_medium_1494116429.jpg",
  latitude: 47.6294,
  longitude: -122.3147,
  mpid: 106515697,
  pitches: 1,
  rating: "5.9+",
  route_type: "TR"
  )

reviews = waterTower.reviews.create([{comments: "Gorgeous views", rating: 5, reviewer: "Bert Harris"}, {comments: "I don't like climbing metal", rating: 2, reviewer: "Charlotte Murphy"}])

#Add coordinates below to add locations to db
coordinates = {
  :vegas => [36.1699, -115.1398],
  :coopers => [39.6556, -79.7878],
  :new_river => [38.0690, -81.0827],
  :moab => [38.5733, -109.5498],
  :seatle => [47.6062, -122.3321],
  :dc => [38.9072, -77.0369]

}

# Add API KEY HERE (eventually set up secrets)
# key = 

api_accessor = MountainProjectScraper.new
api_accessor.run_code(coordinates, key)


