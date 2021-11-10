class RenamePasswordToPasswordDigest < ActiveRecord::Migration[6.1]
  def self.up
    rename_column :users, :password, :password_digest
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end
