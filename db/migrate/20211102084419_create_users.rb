class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest

      t.timestamps
    end

    create_table :posts do |t|
      t.belongs_to :user
      t.string :message

      t.timestamps
    end
  end
end
