require 'rest-client'

class MountainProjectScraper < ApplicationRecord

  #creates full api URLs for each location in the coordinates hash
  def create_api_urls(coordinates, key)
      full_api_urls = coordinates.map do |location_name, coordinates|
        lat = coordinates[0]
        long = coordinates[1]
        api_url = "https://www.mountainproject.com/data/get-routes-for-lat-lon?lat=#{lat}&lon=#{long}&maxDistance=200&minDiff=5.0&maxDiff=5.15&key=#{key}"
      end
    return full_api_urls
  end

  #sends API request for an individual API
  def send_request_to_api(url)
    response_string = RestClient.get(url)
    response_hash = JSON.parse(response_string)
    all_routes_at_location = response_hash
    return all_routes_at_location
    # return all_routes_at_location.class = hash
  end

  def create_state_instance(all_routes_at_location)
    states = all_routes_at_location.values[0].each do |route_hash|
      state_name = route_hash["location"][0]
      state = State.find_or_create_by(:name => state_name)
      create_location_instance(route_hash, state)
    end
  end

  def create_location_instance(route_hash, state)
    location_name = route_hash["location"][2]
    location = Location.find_or_create_by(:name => location_name)
    state.locations << location
    create_route_instance(route_hash, location)
  end

  def create_route_instance(route_hash, location)
    route_data = {name: route_hash["name"], route_type: route_hash["type"], rating: route_hash["rating"], pitches: route_hash["pitches"], imgMedium: route_hash["imgMedium"], longitude: route_hash["longitude"], latitude: route_hash["latitude"], mpid: route_hash["id"]}
    if Route.exists?(mpid: route_hash["id"])
      route = Route.find_by(mpid: route_hash["id"])
    else
    route = Route.new(route_data)
    end
    location.routes << route
  end

  def run_code(coordinates, key)
    api_urls = create_api_urls(coordinates, key)
    api_urls.each do |url|
      location_hash = send_request_to_api(url)
      create_state_instance(location_hash)
    end
  end

end
