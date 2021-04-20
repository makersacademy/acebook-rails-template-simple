class User < ApplicationRecord
  has_secure_password

  # does this validate email-form or do we need it for username?
  # validates email:, presence: true, uniqueness: true
end
