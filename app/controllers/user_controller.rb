class UserController < ApplicationController
    validates :email, uniqueness: true
end
