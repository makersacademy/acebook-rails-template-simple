class ChangeColumnDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :friendships, :request, -> { 'null' }   
  end
end
