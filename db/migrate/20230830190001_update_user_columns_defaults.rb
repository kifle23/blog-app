class UpdateUserColumnsDefaults < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :confirmed, true
    change_column_default :users, :confirmed_at, -> { 'CURRENT_TIMESTAMP' }
  end
end
