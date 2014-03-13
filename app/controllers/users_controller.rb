class UsersController < ApplicationController
  def new  
    @user = User.new
  end  
  
  def create
    @user = User.new(user_params)
    if @user.save
      user = User.find_by_name(@user.name)
      session[:user_id] = user.id
      icon = params[:user][:icon]
      File.open("./public/icons/#{user.id}.jpg", "wb") { |f| f.write(icon.read) }
      redirect_to root_url, notice: "Your account is created!"  
    else  
      render "new", notice: "Your account isn't created!"
    end  
  end

  private
    def user_params
      params.require(:user).permit(:name, :mail, :password, :password_confirmation)
    end
end
