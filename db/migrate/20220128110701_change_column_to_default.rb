class ChangeColumnToDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :friendships, :request, -> { 'true' }   
  end
end
