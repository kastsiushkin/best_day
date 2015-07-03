class DaysController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit]
  before_action :get_user, only: [:new, :create, :edit]
  before_action :get_day, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      @days = Day.search(params["search"])
    else
      @days = Day.all
    end
  end

  def new
    @day = @user.days.new
    @day.user_id = @user.id
  end

  def create
    @day = @user.days.create(day_params)
    if @day.save
      redirect_to day_path(@day)
    else
      render "new"
    end
  end

  def show
    @activities = @day.activities.order(:time)
  end

  def edit
  end

  def update
    if @day.update_attributes(day_params)
      redirect_to day_path(@day), notice: "Day was updated"
    else
      render "edit"
    end
  end

  def destroy
    @day.destroy
    flash.notice = "Day was deleted"
    redirect_to days_path
  end

  def owner?
    current_user.id == self.user.id
  end

  private
  def day_params
    params.require(:day).permit(:name, :description, :location, :user_id)
  end

  def get_user
    @user = User.find(current_user.id)
  end

  def get_day
    @day = Day.find(params[:id])
  end
end
