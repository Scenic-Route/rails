class RoutesController < ApplicationController

  def show
    @route = Route.find(params[:id])
    if @route
      render json: {:route => @route}, status: :ok
    else
      render json: {:error => @route.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def edit
    # TODO: set validation ensuring nobody can edit someone else's route
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
    @route = Route.new(route_params)
    if @route.save
      render json: {:route => @route}, status: :created
    else
      render json: {:error => @route.error.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @route = Route.find(params[:id])
    if current_user == @route.user
      if @route.destroy
        subtract_from_user_route_count(current_user)
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
  end

  private

    def as_json(opts={})
      super(:only => [:id, :start_lat, :start_long, :end_lat, :end_long, :name, :high_limit, :low_limit, :popularity, :user_id])
    end

    def search_params
      params.require(:search).permit(:current_lat, :current_long, :search_radius)
    end

    def route_params
      params.require(:route).permit(:id, :start_lat, :start_long, :end_lat, :end_long, :name, :high_limit, :low_limit, :popularity, :user_id)
    end

end
