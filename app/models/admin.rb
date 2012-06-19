class Admin < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me
end
