class BweetsController < ApplicationController
  def index
    if request.xhr?
      session[:bweet_page] += 1
      @bweets = Bweet.limit(10).offset(10 * session[:bweet_page])
      render partial: 'bweets', collections: @bweets
    else
      session[:bweet_page] = 0
      @bweets = Bweet.limit(10)
      @user = User.find_by_id(session[:user_id])
    end
  end

  def create
    @bweet = Bweet.new(bweet_params)
    @bweet.user_id = session[:user_id]
    respond_to do |format|
      if @bweet.save
        @bweets = Bweet.limit(10)
        format.html { render partial: 'bweets', collections: @bweets }
      else
        redirect_to root_url, notice: 'Submit Error!'
      end
    end
  end

  private
  def bweet_params
    params.permit(:description)
  end
end
