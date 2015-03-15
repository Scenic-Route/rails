class ProfilesController < ApplicationController
  before_action :authenticate_user_from_token!

  # def create(profile_params)
  #   @profile = Profile.new(profile_params)
  #   if @profile.save
  #     render json: {:profile => @profile}, status: :created
  #   else
  #     render json: {:error => @profile.errors.full_messages}, status: :unprocessable_entity
  #   end
  # end

  def show
    @profile = Profile.find(params[:id])
    @user = User.find(@profile.user_id)
    @stat_tracker = @user.stat_tracker
    if @profile
      render json: {:user => @user, :profile => @profile, :stat_tracker => @stat_tracker}, status: :ok
    else
      render json: {:error => @profile.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def edit
    @profile = current_user.profile
    @stat_tracker = @user.stat_tracker
    if current_user
      @profile.update(profile_params)
      if @profile.save
        render json: {:user => current_user, :profile => @profile, :stat_tracker => @stat_tracker}, status: :ok
      else
       render json: {:error => @profile.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {:error => 'You cannot edit a profile that is not yours!'}, status: :forbidden
    end
  end


  private

  def as_json(opts={})
    super(:only => [:location, :about_me, :vehicle_year, :vehicle_make, :vehicle_model, :vehicle_photo, :vehicle_link, :user_id])
  end

  def profile_params
    params.require(:profile).permit(:location, :about_me, :vehicle_year, :vehicle_make, :vehicle_model, :vehicle_photo, :vehicle_link, :user_id)
  end

end
