class RatingsController < ApplicationController
before_action :authenticate_user_from_token!

  def create

    # insert some kind of validation to make sure a user was either the creator of the route or has checked in at the route
    @rating = Rating.new(rating_params)
    @route = Route.find(@rating.route_id)
    @user = User.find(@rating.user_id)
    if @user == current_user && (@user.id == @route.user_id || @user.checkins.where(route_id: @rating.route_id))
      if @rating.save
        # If rating saves, update user's stat tracker
        @rating.add_to_user_rating_count(current_user)

        @route = Route.find(@rating.route_id)
        @route.add_to_popularity
        @route.calculate_ratings
        render json: {:rating => @rating, :route => @rating.route}, status: :created
      else
        render json: {:error => @rating.errors.full_messages}, status: :unprocessable_entity
      end
    end
  end

  def show
    @rating = Rating.find(params[:id])
    if @rating
      render json: {:rating => @rating}, status: :ok
    else
      render json: {:error => @rating.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def edit
    @rating = Rating.find(params[:id])
    @rating.update(rating_params)
    if @rating.save
      render json: {:rating => @rating}, status: :ok
    else
      render json: {:error => @rating.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @rating = Rating.find(params[:id])
    @route = Route.find(@rating.route_id)
    if current_user != @rating.user
      render json: {:error => 'You cannot delete a rating that is not yours!'}, status: :forbidden
    else
      if @rating.destroy
        @rating.subtract_from_user_rating_count(current_user)
        @route.subtract_from_popularity
        render json: {:rating => nil}, status: :ok
      else
        render json: {:error => @rating.errors.full_messages}, status: :unprocessable_entity
      end
    end
  end

  private

    def as_json(opts={})
      super(:only => [:id, :user_id, :route_id, :twist_rating, :quality_rating, :traffic_rating, :comments])
    end

    def rating_params
      params.require(:rating).permit(:user_id, :route_id, :twist_rating, :quality_rating, :traffic_rating, :comments)
    end
end
