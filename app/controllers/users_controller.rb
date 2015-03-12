class UserController < ApplicationController
  before_action :authenticate_user_from_token!


  def show # Read
    @user = User.find(params[:id])
    if @user
      render json: {:user => @user}, status: :ok
    else
      render json: {:error => @user.errors.full_messages}, status: :unprocessable_entity
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


  private

    def as_json(opts={})
      super(:only => [:id, :email, :username, :first_name, :last_name])
    end

    def user_params
      params.require(:user).permit(:email, :username, :first_name, :last_name)
    end

end
