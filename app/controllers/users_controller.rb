class UsersController < ApplicationController
  before_action :authenticate_user_from_token!


  def show # Read
    if current_user
      render json: {:user => current_user}, status: :ok
    else
      render json: {:error => current_user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def index
    @users = User.all
    if @users.count > 0
      render json: {:users => @users}, status: :ok
    else
      render json: {:error => @users.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def edit(user_params) # Update
    @user = current_user
    @user.update(user_params)
    if @user.save
      render json: {:user => @user}, status: :ok
    else
      render json: {:error => @user.errors.full_messages}, status: :unprocessable_entity
    end
  end


  def destroy # Delete
    @user = current_user
    if @user.destroy
      render json: {:user => nil}, status: :ok
    else
      render json: {:error => @user.errors.full_messages}, status: :unprocessable_entity
    end
  end



  def edit_username
    if current_user.can_edit_username == true
      current_user.username = user_params[:username]
      if current_user.save
        current_user.can_edit_username = false
        current_user.save
        render json: {:user => current_user, :profile => current_user.profile, :stat_tracker => current_user.stat_tracker}, status: :ok
      else
        render json: {:error => current_user.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {:error => "You're not allowed to edit your username."}, status: :forbidden
    end
  end


  private

    def as_json(opts={})
      super(:only => [:id, :email, :username, :first_name, :last_name])
    end

    def user_params
      params.require(:user).permit(:email, :username, :first_name, :last_name)
    end

end
