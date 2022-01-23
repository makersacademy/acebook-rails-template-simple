class FixColumnName < ActiveRecord::Migration[6.1]
  def self.up
    rename_column :users, :profilepic, :avatar
  end
end
