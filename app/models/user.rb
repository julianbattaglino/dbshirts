class User < ActiveRecord::Base
  attr_accessible :email, :username, :password, :password_confirmation, :admin
  acts_as_authentic
end
