class User < ActiveRecord::Base
  has_secure_password #accessed through bcrypt that allows us to use the authenticate method
end
