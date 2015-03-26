class CheckinsController < ApplicationController

  before_action :authenticate_user_from_token!

  def create
    route_id = checkin_params[:route_id]
    coordinates = [checkin_params[:latitude], checkin_params[:longitude]]
    @route = Route.find(route_id)
    if within_checkin_distance([@route.latitude, @route.longitude], coordinates)
      @checkin = Checkin.new(checkin_params)
      if @checkin.save
        @checkin.add_to_user_checkin_count(current_user)
        Route.find(@checkin.route_id).add_to_popularity
        render json: {:checkin => nil}, status: :created
      else
        render json: {:error => @checkin.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {:error => "You must be within a mile of a route to check in!"}, status: :forbidden
    end
  end

  def my_checkins
    @checkins = Checkin.where(user_id: current_user.id).all
    if @checkins
      render json: {:checkins => @checkins}, status: :ok
    else
      render json: {:error => @checkins.errors.full_messages}, status: :unprocessable_entity
    end
  end


  private

    def checkin_params
      params.require(:checkin).permit(:user_id, :route_id, :latitude, :longitude)
    end

    def as_json(opts={})
      super(:only => [:user_id, :route_id, :id, :created_at])
    end

    def within_checkin_distance(route, coordinates)
      if Geocoder::Calculations.distance_between(route, coordinates) <= 3
        return true
      else
        return false
      end
    end

end