class RoutesController < ApplicationController
before_action :authenticate_user_from_token!

  def show
    @route = Route.find(params[:id])
    @waypoints = Waypoint.where(route_id: @route.id).all
    if @route
      render json: {:route => @route, :waypoints => @waypoints}, status: :ok
    else
      render json: {:error => @route.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def my_routes
    @routes = Route.where(user_id: current_user.id).all
    if @routes.count
      render json: {:routes => @routes}, status: :ok
    else
      render json: {:error => @routes.errors.full_messages}, status: :unprocessable_entity
    end
  end


  def edit
    @route = Route.find(params[:id])
    if current_user == @route.user
      @route.update(route_params)
      if @route.save
        render json: {:route => @route}, status: :ok
      else
        render json: {:error => @route.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {:error => "You can't edit a route that isn't yours!"}, status: :forbidden
    end
  end

  def create
    # add points to user's stat tracker


    # so, first I'll have to check to see if there are any waypoints.
    # if there are. Create the route first.
    # if no errors, create the waypoints
    # if no errors, send back route and waypoints
    parameters = route_params
    @route = Route.new
    if parameters['waypoints']
      waypoints = parameters['waypoints']
      parameters.delete('waypoints')
    end
    @route.update(parameters)
    @route.username = current_user.username
    if @route.save
      if waypoints
        @waypoints = @route.create_waypoints(waypoints, @route.id)
      end
      if @route.save
        @route.add_to_user_route_count(current_user)
        if @waypoints
          render json: {:route => @route, :waypoints => @waypoints}, status: :created
        else
          render json: {:route => @route}, status: :created
        end
      else
        render json: {:error => @route.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {:error => @route.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @route = Route.find(params[:id])
    if current_user == @route.user
      if @route.destroy
        @route.subtract_from_user_route_count(current_user)
        render json: {:route => nil}, status: :ok
      else
        render json: {:error => @route.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {:error => "You can't destroy a route that isn't yours!"}, status: :forbidden
    end
  end

  def search
    # find all routes within X distance of user's current location
    @routes = Route.near([search_params[:current_lat], search_params[:current_long]], search_params[:search_radius])
    if @routes
      render json: {:routes => @routes}, status: :ok
    else
      render json: {:error => @routes.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def route_ratings
    @route = Route.find(params[:id])
    @ratings = @route.ratings
    if @ratings
      render json: {:route => @route, :ratings => @ratings}, status: :ok
    else
      render json: {:error => @ratings.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private

    def as_json(opts={})
      super(:only => [:id, :latitude, :longitude, :end_lat, :end_long, :name, :high_limit, :low_limit, :popularity, :user_id])
    end

    def search_params
      params.require(:search).permit(:current_lat, :current_long, :search_radius)
    end

    def route_params
      params.require(:route).permit(:id, :latitude, :longitude, :end_lat, :end_long, :name, :high_limit, :low_limit, :popularity, :user_id, 
                                    :waypoints => [:latitude, :longitude, :comment, :waypoint_order])
    end

end
