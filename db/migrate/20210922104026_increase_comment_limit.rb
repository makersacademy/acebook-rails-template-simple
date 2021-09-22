class IncreaseCommentLimit < ActiveRecord::Migration[6.1]
  def change
    change_column :comments, :comment, :string, limit: 500
  end
end
