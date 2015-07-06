class ReviewsController < ApplicationController
  before_action :get_user, only: [:new, :create]
  before_action :get_day, only: [:new, :create]
  before_action :authenticate_user!

  def new
    @review = @day.reviews.new
    @review.user_id = @user.id
    @review.day_id = @day.id
  end

  def create
    @review = @day.reviews.create(review_params)
    if @review.save
      redirect_to day_path(@day)
    else
      render "new"
    end
  end

  def edit
  end

  def destroy
  end

  private
  def get_user
    @user = User.find(current_user.id)
  end

  def get_day
    @day = Day.find(params[:day_id])
  end

  def review_params
    params.require(:review).permit(:description, :rating, :user_id, :day_id)
  end

end
