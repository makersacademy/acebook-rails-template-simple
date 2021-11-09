class AddUserIdForeignKeyToPosts < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :posts, :users, column: :user_id, primary_key: "id"
  end
end
