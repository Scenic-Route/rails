class UserController < ApplicationController
  before_action :authenticate_user_from_token!


  def show
    @user = User.find(params[:id])
    if @user
      render json: (:user => @user), status: :ok
    else
      render json: (:error => @user.error.full_messages), status: :unprocessable_entity
    end
  end

  def index
    @users = User.all
    if @users
      render json: (:users => @users), status: :ok
    else
      render json: (:error => @users.error.full_messages), status: :unprocessable_entity
    end
  end

  
end
