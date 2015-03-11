class RatingsController < ApplicationController

  def create

  end

  def show

  end

  def edit

  end

  def destroy

  end

  private

    def as_json(opts={})
      super(:only => [:id, :user_id, :route_id, :police_rating, :quality_rating, :traffic_rating, :comments])
    end

    def rating_params
      params.require(:rating).permit(:user_id, :route_id, :police_rating, :quality_rating, :traffic_rating, :comments)
    end
end
