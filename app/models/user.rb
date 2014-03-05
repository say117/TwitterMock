class User < ActiveRecord::Base
  validates_presence_of :name, :mail, :password_digest
  has_secure_password
end
