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
    @profile = current_user.profile
    if @profile
      render json: {:profile => @profile}, status: :ok
    else
      render json: {:error => @profile.errors.full_messages}, status: :unprocessable_entity
    end

  end

  def edit(profile_params)
    @profile = current_user.profile
    @profile.update_attributes(profile_params)
    if @profile.save
      render json: {:profile => @profile}, status: :ok
    else
      render json: {:error => @profile.errors.full_messages}, status: :unprocessable_entity
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
