class ReviewsController < ApplicationController

  def create
    @product = Product.find params[:product_id]
    @review = @product.review.new(review_params)
    @review.user_id = current_user.id

    if @review.save
      redirect_to [:products]
    else
      redirect_to :back
    end
  end

  def destroy
    @review = Review.find params[:id]

    if @review.destroy
      redirect_to [:products]
    else
      redirect_to :back
    end

  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end

end
