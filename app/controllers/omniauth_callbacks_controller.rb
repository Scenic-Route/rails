class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def all
    user_info = env['omniauth.auth']
    user_uid = user_info['uid']
    @user = User.find_by_uid(user_uid)
    if @user
      sign_in(:user, @user)
      render json: {:user => current_user, :profile => current_user.profile, :stat_tracker => current_user.stat_tracker}, status: :ok
    else
      create_user(user_info)
    end
  end


  private

  def create_user(info)
    @user = User.new
    @user.email = info['info']['email']
    @user.username = info['info']['email']
    @user.first_name = info['info']['first_name']
    @user.last_name = info['info']['last_name']
    @user.uid = info['uid']
    @user.provider = info['provider']
    @user.can_edit_username = true
    if @user.save
      @user.profile = Profile.create
      @user.stat_tracker = StatTracker.create
      ScenicRouteMailer.creation_email(@user).deliver_now
      render json: {:user => @user, :profile => @user.profile, :stat_tracker => @user.stat_tracker}, status: :created
    else
      render json: {:error => @user.errors.full_messages}, status: :unprocessable_entity
    end
  end
  alias_method :facebook, :all
end