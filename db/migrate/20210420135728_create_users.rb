class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :forename
      t.string :surname
      t.string :username
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
