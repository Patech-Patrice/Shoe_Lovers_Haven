
class User < ActiveRecord::Base

 #accessed through bcrypt which allows us to use the authenticate method
  has_secure_password
  has_many :shoe_entries
  #accessed through bcrypt which allows us to use the authenticate method

end
