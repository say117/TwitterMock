class UsersController < ApplicationController
  def new  
    @user = User.new
  end  
  
  def create
    @user = User.new(user_params)
    icon = params[:user][:icon]
    File.open("./public/icons/#{@user.name}.jpg", "wb") { |f| f.write(icon.read) }
    if @user.save
      redirect_to root_url, notice: "Your account is created!"  
    else  
      render "new"
    end  
  end

  private
    def user_params
      params.require(:user).permit(:name, :mail, :password, :password_confirmation)
    end
end
