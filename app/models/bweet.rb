class Bweet < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id, :description
  default_scope -> { order('created_at DESC') }
end
