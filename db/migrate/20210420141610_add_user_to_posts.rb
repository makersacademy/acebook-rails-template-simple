class AddUserToPosts < ActiveRecord::Migration[6.1]
  def change
    # Adds a foreign key 'user_id' to the posts table, referencing id in the users table
    # add_foreign_key(from_table, to_table, options): Adds a new foreign key. from_table is the table with the key column, to_table contains the referenced primary key.
    add_reference :posts, :user, foreign_key: { to_table: :users}
  end
end
