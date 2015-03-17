class WaypointsController < ApplicationController

  before_action :authenticate_user_from_token!

    # GET /waypoints/:id
  def show
    @waypoint = Waypoint.find(params[:id])
    if @waypoint
      render json: {:waypoint => @waypoint}, status: :ok
    else
      render json: {:error => @waypoint.errors.full_messages}, status: :unprocessable_entity
    end
  end

    # POST /waypoints
  def create
    @waypoint = Waypoint.new(waypoint_params)
    if @waypoint.save
      render json: {:waypoint => @waypoint}, status: :ok
    else
      render json: {:error => @waypoint.errors.full_messages}, status: :unprocessable_entity
    end
  end

    # PATCH /waypoints/:id
  def edit
    @waypoint = Waypoint.find(params[:id])
    if @waypoint.update(waypoint_params)
      render json: {:waypoint => @waypoint}, status: :ok
    else
      render json: {:waypoint => @waypoint.errors.full_messages}, status: :unprocessable_entity
    end
  end

    # DELETE /waypoints/:id
  def destroy
    @waypoint = Waypoint.find(params[:id])
    if @waypoint.destroy
      render json: {:waypoint => nil}, status: :ok
    else
      render json: {:error => @waypoint.errors.full_messages}, status: :unprocessable_entity
    end
  end

    # GET /routes/:id/waypoints
  def route_waypoints
    @waypoints = Waypoint.where(route_id: params[:id]).all
    if @waypoints
      render json: {:waypoints => @waypoints}, status: :ok
    else
      render json: {:error => @waypoints.errors.full_messages}, status: :unprocessable_entity
    end
  end


  private

  def waypoint_params
    params.require(:waypoint).permit(:latitude, :longitude, :photo, :comment, :route_id, :user_id)
  end

  def as_json(opts={})
    super(:only => [:latitude, :longitude, :photo, :comment, :route_id, :user_id, :id])
  end

end