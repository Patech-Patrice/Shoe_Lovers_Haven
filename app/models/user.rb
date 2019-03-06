class User < ActiveRecord::Base
  has_secure_password #accessed through bcrypt which allows us to use the authenticate method
  has_many :shoe_entries
end
