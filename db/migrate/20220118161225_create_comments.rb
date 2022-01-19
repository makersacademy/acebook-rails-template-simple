class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :content, null: false 
      t.belongs_to :users, index: true, foreign_key: true, null: false 
      t.belongs_to :posts, index: true, foreign_key: true, null: false 
      t.timestamps
    end
  end
end
