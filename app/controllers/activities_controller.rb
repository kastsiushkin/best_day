class ActivitiesController < ApplicationController
  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.create(activity_params)
    if @activity.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit
  end

  def delete
  end

  private
  def activity_params
    params
      .require(:activity)
      .permit(:name, :description, :address, :time, :cost, :hardness, :duration, :day_id)
  end
end
