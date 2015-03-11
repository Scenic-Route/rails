class RoutesController < ApplicationController

  def show

  end

  def edit

  end

  def create
    # add points to user's stat tracker

  end

  def destroy

  end

  def search

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
