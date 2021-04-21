class UserSerializer < ActiveModel::Serializer
  attributes :id, :forename, :surname, :username, :email, :password, :profilePic
end
