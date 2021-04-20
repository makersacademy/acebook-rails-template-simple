class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      
      t.timestamps
    end
    add_reference :likes, :user, foreign_key: { to_table: :users}
    add_reference :likes, :post, foreign_key: { to_table: :posts}
  end
end
