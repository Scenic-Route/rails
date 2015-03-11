class StatTrackersController < ApplicationController
  before_action :authenticate_user_from_token!

  # def create
  #   @stat_tracker = StatTracker.new(stat_tracker_params)
  #   if @stat_tracker.save
  #     render json: {nil}, status: :created
  #   else
  #     render json: {:error => @stat_tracker.errors.full_messages}, status: :unprocessable_entity
  #   end
  # end

  def show
    @stat_tracker = current_user.stat_tracker
    if @stat_tracker
      render json: {:user => current_user, :stat_tracker => @stat_tracker}, status: :ok
    else
      render json: {:error => [current_user.errors.full_messages, @stat_tracker.errors.full_messages]}, status: :unprocessable_entity
    end
  end


  def edit
    @stat_tracker.update_attributes(stat_tracker_params)
    if @stat_tracker.save
      render json: {:stat_tracker => @stat_tracker}, status: :ok
    else
      render json: {:error => @stat_tracker.errors.full_messages}, status: :unprocessable_entity
    end
  end




  private

  def as_json(opts={})
    super(:only => [:route_total, :rating_total, :comment_total, :checkin_total, :user_id])
  end

  def stat_tracker_params
    params.require(:stat_tracker).permit(:user_id, :route_total, :rating_total, :comment_total, )
  end

end
