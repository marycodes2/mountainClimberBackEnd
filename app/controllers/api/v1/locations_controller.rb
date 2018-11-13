class Api::V1::LocationsController < ApplicationController

  def index
    @states = State.all
    render json: @states, include:['locations', 'locations.routes', 'locations.routes.reviews']
  end

end
