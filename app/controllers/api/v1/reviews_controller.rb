class Api::V1::ReviewsController < ApplicationController

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    render json: @review
  end

end
