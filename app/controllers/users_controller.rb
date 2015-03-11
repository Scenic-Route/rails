class UserController < ApplicationController
  before_action :authenticate_user_from_token!


  def show
    @user = User.find(params[:id])
    if @user
      render json: {:user => @user}, status: :ok
    else
      render json: {:error => @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def index
    @users = User.all
    if @users
      render json: {:users => @users}, status: :ok
    else
      render json: {:error => @users.errors.full_messages}, status: :unprocessable_entity
    end
  end


  private

    def as_json(opts={})
      super(:only => [:id, :email, :username, :first_name, :last_name])
    end


end
