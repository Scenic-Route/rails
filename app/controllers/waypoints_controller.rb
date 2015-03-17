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
    # insert some kind of validation here that makes sure a user has checked in at a route
    @waypoint = Waypoint.new(waypoint_params)
    @route = Route.find(@waypoint.route_id)
    if current_user.checkins.where(route_id: @waypoint.route_id) || @route.user == current_user
      if @waypoint.save
        @route.add_to_popularity
        render json: {:waypoint => @waypoint}, status: :ok
      else
        render json: {:error => @waypoint.errors.full_messages}, status: :unprocessable_entity
      end
    end
  end

    # PATCH /waypoints/:id
  def edit
    @waypoint = Waypoint.find(params[:id])
    if current_user == @waypoint.user
      if @waypoint.update(waypoint_params)
        render json: {:waypoint => @waypoint}, status: :ok
      else
        render json: {:waypoint => @waypoint.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {:error => "You can't edit a waypoint you didn't create!"}, status: :forbidden
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

    # GET /waypoints
  def my_waypoints
    @waypoints = current_user.waypoints
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