class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name, limit: 30
      t.string :last_name, limit: 30
      t.date :date_of_birth
      t.string :email, limit: 50
      t.string :password_digest
      t.string :image_data

      t.timestamps
    end
  end
end
