class UserSerializer < ActiveModel::Serializer
  attributes :id, :forename, :surname, :username, :email, :profilePic
end
