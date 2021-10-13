class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :message
      # t.integer :number_of_likes
      # add_foreign_key :posts, :users

      t.timestamps
    end
  end
end


rails generate migration AddPostRefToComment post:references