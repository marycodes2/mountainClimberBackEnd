# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


washington = State.create(name: "Washington")
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
