class SessionsController < Devise::SessionsController

  def create
    self.resource = warden.authenticate(auth_options)
    binding.pry
    if self.resource
      sign_in(resource_name, resource)
      render json: {:user => current_user}, status: :ok
    else
      render json: {:error => "Authentication Failure!"}, status: :unauthenticated
    end
  end

end