
class User < ActiveRecord::Base
  validates_presence_of :name, :email, :password
  has_secure_password #accessed through bcrypt which allows us to use the authenticate method
  has_many :shoe_entries
end
