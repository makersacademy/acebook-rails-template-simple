class ChangeCommentsMessagesColumnToSingular < ActiveRecord::Migration[6.1]
  def change
    # rename_column :table_name, :old_column, :new_column
    rename_column :comments, :messages, :message
  end
end
