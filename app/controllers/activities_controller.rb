class ActivitiesController < ApplicationController

  before_action :get_day, only: [:new, :create, :edit, :update, :destroy]
  before_action :authenticate_user!

  def new
    @activity = @day.activities.new
    @activity.day_id = @day.id
  end

  def create
    @activity = @day.activities.create(activity_params)
    if @activity.save
      redirect_to day_path(@day)
    else
      render "new"
    end
  end

  def edit
    @activity = get_activity
  end

  def update
    @activity = get_activity
    if @activity.update_attributes(activity_params)
      redirect_to day_path(@day), notice: "Activity was updated"
    else
      render "edit"
    end
  end

  def destroy
    @activity = get_activity
    @activity.destroy
    flash.notice = "Activity was deleted"
    redirect_to(:back)
  end

  private
  def get_day
      @day = Day.find(params[:day_id])
  end

  def get_activity
    @day.activities.find(params[:id])
  end

  def activity_params
    params
      .require(:activity)
      .permit(:name, :description, :address, :time, :cost, :hardness, :duration, :day_id)
  end
end
