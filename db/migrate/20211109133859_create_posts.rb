class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :date_created
      t.string :date_updated
      t.string :type
      t.string :image
      t.string :text
      t.integer :user_id

      t.timestamps
    end
  end
end
