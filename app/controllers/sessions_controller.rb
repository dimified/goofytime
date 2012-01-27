class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully!"
      redirect_to root_url
    else
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out successfully!"
    redirect_to root_url
  end
end
