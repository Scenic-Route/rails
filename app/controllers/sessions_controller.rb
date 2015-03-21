class SessionsController < Devise::SessionsController

  def create
    self.resource = warden.authenticate(auth_options)
    binding.pry
    if self.resource
      sign_in(resource_name, resource)
      render json: {:user => current_user, :profile => current_user.profile, :stat_tracker => current_user.stat_tracker}, status: :ok
    else
      render json: {:error => "Authentication Failure!"}, status: :unauthenticated
    end
  end


  # def facebook_create
  #   user_info = env['omniauth.auth']
  #   binding.pry
  #   user_uid = user_info['uid']
  #   @user = User.find_by_uid(user_uid)
  #   if @user
  #     sign_in(:user, @user)
  #     render json: {:user => current_user, :profile => current_user.profile, :stat_tracker => current_user.stat_tracker}, status: :ok
  #   else
  #     create_user(user_info)
  #   end
  # end


  # private

  # def create_user(info)
  #   @user = User.new
  #   @user.email = info['info']['email']
  #   @user.username = info['info']['email']
  #   @user.first_name = info['info']['first_name']
  #   @user.last_name = info['info']['last_name']
  #   @user.uid = info['uid']
  #   @user.provider = info['provider']
  #   if @user.save
  #     @user.profile = Profile.create
  #     @user.stat_tracker = StatTracker.create
  #     ScenicRouteMailer.creation_email(@user).deliver_now
  #     render json: {:user => @user, :profile => @user.profile, :stat_tracker => @user.stat_tracker}, status: :created
  #   else
  #     render json: {:error => @user.errors.full_messages}, status: :unprocessable_entity
  #   end
  # end





# SO. First, I need to see if a user exists with that UID. 


#   def create_user
#     @user = User.create(user_params)
#     # add obscenity gem to make sure people don't put curse words in their usernames
#     if Obscenity.profane?(@user.username) || Obscenity.profane?(@user.first_name) || Obscenity.profane?(@user.last_name)
#       render json: {:error => "You cannot have profanity in your user information. YA JACKASS!"}
#     else
#       @user.save
#       @user.profile = Profile.create
#       @user.stat_tracker = StatTracker.create
#       if @user.save && @user.profile && @user.stat_tracker
#         ScenicRouteMailer.creation_email(@user).deliver_now
#         render json: {:user => @user, :profile => @user.profile, :stat_tracker => @user.stat_tracker}, status: :created
#       else
#         render json: {:error => [@user.errors.full_messages, @user.profile.errors.full_messages, @user.stat_tracker.errors.full_messages]},
#              status: :unprocessable_entity
#       end
#     end
#   end

# end