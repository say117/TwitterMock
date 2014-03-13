class SessionsController < ApplicationController

  def create
    user = User.find_by_name(params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'You are signed in!'
    else
      redirect_to root_url, notice: 'Invalid UseName / Password'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'You are signed out!'
  end

end
