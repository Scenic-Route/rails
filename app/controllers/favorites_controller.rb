class FavoritesController < ApplicationController
  before_action :authenticate_user_from_token!


    # GET /favorites
  def my_favorites
    @favorites = current_user.favorites
    if @favorites
      render json: {:favorites => @favorites}, status: :ok
    else
      render json: {:error => @favorites.errors.full_messages}, status: :unprocessable_entity
    end
  end

    # POST /favorites
  def create
    @favorite = Favorite.new(favorite_params)
    if @favorite.save
      Route.find(@favorite.route_id).add_to_popularity
      render json: {:favorite => @favorite}, status: :ok
    else
      render json: {:error => @favorite.errors.full_messages}, status: :unprocessable_entity
    end
  end

    # PATCH /favorites/:id
  def edit
    @favorite = Favorite.find(params[:id])
    if @favorite.user == current_user
      if @favorite.update!(favorite_params)
        render json: {:favorite => @favorite}, status: :ok
      else
        render json: {:error => @favorite.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {:error => "You can't edit a favorite that isn't yours!"}, status: :forbidden
    end
  end

    # DELETE /favorites/:id
  def destroy
    @favorite = Favorite.find(params[:id])
    if @favorite.user == current_user
      if @favorite.destroy
        @route = Route.find()
        render json: {:favorite => nil}, status: :ok
      else
        render json: {:error => @favorite.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {:error => "You can't delete a favorite that isn't yours!"}, status: :forbidden
    end
  end



  private


    def favorite_params
      params.require(:favorite).permit(:route_id, :user_id, :favorite_name)
    end

    def as_json(opts={})
      super(:only => [:id, :route_id, :user_id, :favorite_name])
    end
end
