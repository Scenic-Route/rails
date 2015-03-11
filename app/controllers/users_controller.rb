class UserController < ApplicationController
  before_action :authenticate_user_from_token!
  
end
