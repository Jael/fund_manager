class SessionsController < ApplicationController
  def create
    user = User.from_auth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    flash[:notice] = "Welcome #{user.nickname}"
    redirect_to root_path
  end
end
