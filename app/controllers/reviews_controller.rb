class ReviewsController < ApplicationController
  def new
    @bar = Bar.find(params[:bar_id])
    @review = Review.new
  end

  def create
   @bar = Bar.find(params[:bar_id])
   @review = @bar.reviews.create(review_params)
   redirect_to bar_path(@bar)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
