class Api::V1::ReviewsController < ApplicationController

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    render json: @review
  end

  def create
    @route = Route.find(params[:route_id])
    @review = @route.reviews.create(review_params)
    render json: @review
  end

  private

  def review_params
    params.require(:review).permit(:comments, :reviewer, :rating, :route)
  end

end
