class InterestPointsController < ApplicationController

before_action :authenticate_user_from_token!



  def create
    parameters = interest_point_params
    @interest_point = InterestPoint.new(parameters)
    @interest_point.user_id = current_user.id
    if @interest_point.save
      render json: {:interest_point => @interest_point}, status: :created
    else
      render json: {:error => @interest_point.errors.full_messages}, status: :unprocessable_entity
    end
  end

    # PATCH /interest_point/:id
  def edit
    parameters = interest_point_params
    @interest_point = InterestPoint.find(params[:id])
    if current_user.id == @interest_point.user_id
      if @interest_point.update(parameters)
        render json: {:interest_point => @interest_point}, status: :created
      else
        render json: {:error => @interest_point.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {:error => "You're not allowed to do that!"}, status: :forbidden
    end
  end

  def destroy
    @interest_point = InterestPoint.find(params[:id])
    route = Route.find(@interest_point.route_id)
    route_creator = User.find(user_id)
    if current_user.id == @interest_point.user_id || current_user == route_creator
      if @interest_point.destroy
        render json: {:interest_point => nil}, status: :ok
      else
        render json: {:error => @interest_point.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {:error => "You're not allowed to do that!"}, status: :forbidden
    end
  end

  def route_points
    @route = Route.find(params[:id])
    @interest_points = @route.interest_points
    if @interest_points
      render json: {:interest_points => @interest_points}, status: :ok
    else
      render json: {:error => @interest_points.errors.full_messages}, status: :unprocessable_entity
    end
  end







  private

    def interest_point_params
      params.require(:interest_point).permit(:latitude, :longitude, :photo, :police, :hazard, :view, :comment, :route_id)
    end

    def as_json(opts={})
      super(:only => [:id, :latitude, :longitude, :photo, :police, :hazard, :view, :comment, :route_id])
    end

end