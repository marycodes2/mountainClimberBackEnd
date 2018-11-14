class Api::V1::ReviewsController < ApplicationController

  before_action :set_review, only: [:destroy, :update]

  def destroy
    @review.destroy
    render json: @review
  end

  def create
    @route = Route.find(params[:route_id])
    @review = @route.reviews.create(review_params)
    render json: @review
  end

  def update
    @review.update(review_params)
    render json: @review
  end

  private

  def review_params
    params.require(:review).permit(:comments, :reviewer, :rating, :route)
  end

  def set_review
    @review = Review.find(params[:id])
  end

end
