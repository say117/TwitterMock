#ページングが出来てない
class BweetsController < ApplicationController
  def index
    @user = User.find_by_id(session[:user_id])
    session[:bweet_page] = 1 if session[:bweet_page] == nil
    @bweets = Bweet.order("created_at DESC").limit(10 * session[:bweet_page])
  end

  def new
    @bweet = Bweet.new
  end

  def create
    @bweets = Bweet.order("created_at DESC").limit(10 * session[:bweet_page])
    @bweet = Bweet.new(bweet_params)
    @bweet.user_id = session[:user_id]
    respond_to do |format|
      if @bweet.save
        format.js
        format.html { redirect_to root_url, :notice => "You bweeted!" }
      else
        render "index"
      end
    end
  end

  def more_show
    # session[:bweet_page].to_i += 1
    # @bweets = Bweet.order("created_at DESC").limit(session[:bweet_page].to_i * 10)
  end

  def bweet

  end


  private
  def bweet_params
    params.permit(:description)
  end
end
