class Api::V1::LocationsController < ApplicationController

  def index
    @locations = Location.all
    @states = State.all
    render json: @states, include:['locations', 'locations.routes', 'locations.routes.reviews']
    # render json: @states, include:['locations', 'locations.routes', 'routes.reviews']
  end

end
