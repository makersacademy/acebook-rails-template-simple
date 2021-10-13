class RemoveNumberOfLikesToPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :number_of_likes
  end
end
