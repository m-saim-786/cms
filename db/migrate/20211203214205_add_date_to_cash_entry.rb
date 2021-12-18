class AddDateToCashEntry < ActiveRecord::Migration[5.2]
  def change
    add_column :cash_entries, :date, :date, default: -> { 'CURRENT_DATE' }
  end
end
