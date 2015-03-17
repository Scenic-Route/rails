class RegistrationsController < Devise::RegistrationsController


  def create
    @user = User.create(user_params)
    # add obscenity gem to make sure people don't put curse words in their usernames
    if Obscenity.profane?(@user.username) || Obscenity.profane?(@user.first_name) || Obscenity.profane?(@user.last_name)
      render json: {:error => "You cannot have profanity in your user information. YA JACKASS!"}
    else
      @user.save
      @user.profile = Profile.create
      @user.stat_tracker = StatTracker.create
      if @user.save && @user.profile && @user.stat_tracker
        #ScenicRouteMailer.creation_email(@user).deliver_now
        render json: {:user => @user, :profile => @user.profile, :stat_tracker => @user.stat_tracker}, status: :created
      else
        render json: {:error => [@user.errors.full_messages, @user.profile.errors.full_messages, @user.stat_tracker.errors.full_messages]},
             status: :unprocessable_entity
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :username, :password, :first_name, :last_name)
    end


end