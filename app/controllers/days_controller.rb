class DaysController < ApplicationController

  before_action :get_day, only: [:show, :edit]

  def index
    if params[:search]
      @days = Day.search(params["search"])
    else
      @days = Day.all
    end
  end

  def new
    @day = Day.new
  end

  def create
    @day = Day.create(day_params)
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

  private
  def day_params
    params.require(:day).permit(:name, :description, :location)
  end

  def get_day
    @day = Day.find(params[:id])
  end
end
