class AddUserIdToLikes < ActiveRecord::Migration[6.1]
  def change
    add_reference :likes, :user, index: true
  end
end
