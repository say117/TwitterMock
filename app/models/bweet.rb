class Bweet < ActiveRecord::Base
  validates_presence_of :user_id, :description
end
