class WaypointsController < ApplicationController

  before_action :authenticate_user_from_token!


  def show

  end

  def create

  end

  def edit

  end

  def destroy

  end


  private

  def waypoint_params
    params.require(:waypoint).permit(:latitude, :longitude, :photo, :comment, :route_id, :user_id)
  end

  def as_json(opts={})
    super(:only => [:latitude, :longitude, :photo, :comment, :route_id, :user_id, :id])
  end

end