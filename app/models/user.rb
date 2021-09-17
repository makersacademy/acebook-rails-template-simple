class User < ApplicationRecord
  # this works with bcrypt
   has_secure_password
  
end