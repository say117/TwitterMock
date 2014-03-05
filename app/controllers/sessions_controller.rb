class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      #redirect_to root_url, :notice "Invalid combination of User / Password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Sign out'
  end
end
