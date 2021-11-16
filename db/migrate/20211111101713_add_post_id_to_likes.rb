class AddPostIdToLikes < ActiveRecord::Migration[6.1]
  def change
    add_reference :likes, :post, index: true
  end
end
