#ページングが出来てない
class BweetsController < ApplicationController
  def index
    @user = User.find_by_id(session[:user_id])
    #session[:bweet_page] == nil ? session[:bweet_page] = 1 : session[:bweet_page] += 1
    #session[:bweet_page] = 1
    @bweets = Bweet.order("created_at DESC").limit(session[:bweet_page].to_i * 10)
  end

  def new
    @bweet = Bweet.new
  end

  def create
    @bweet = Bweet.new(bweet_params)
    @bweet.user_id = session[:user_id]
    #id
    if @bweet.save
      redirect_to root_url, :notice => "You bweeted!"  
    else  
      render "index"
    end  
  end

  # def more_show
  #   session[:bweet_page].to_i += 1
  #   @bweets = Bweet.order("created_at DESC").limit(session[:bweet_page].to_i * 10)
  # end


  private
    def bweet_params
      params.permit(:description)
    end
end
