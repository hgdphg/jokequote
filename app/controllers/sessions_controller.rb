class SessionsController < ApplicationController
  def new
    id = session[:user_id]
    if id
      redirect_to dashboard_path
    end
  end

  def create
    user = User.find_by(username: params[:username])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:username] = user.username
      redirect_to dashboard_path
    else
      redirect_to login_path, alert: "Invalid username or password"
    end
  end

  def destroy
    session[:user_id] = nil
    session[:username] = nil
    redirect_to home_page_path
  end
end
