class RegistrationsController < Devise::RegistrationsController

  def create
    @user = User.create(user_params)
    @user.profile = Profile.create
    @user.stat_tracker = StatTracker.create
    if @user.save && @user.profile && @user.stat_tracker
      render json: {:user => @user, :profile => @user.profile, :stat_tracker => @user.stat_tracker}, status: :created
    else
      render json: {:errors => [@user.errors.full_messages, @user.profile.errors.full_messages, @user.stat_tracker.errors.full_messages]},
             status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :username, :password, :first_name, :last_name)
    end

end