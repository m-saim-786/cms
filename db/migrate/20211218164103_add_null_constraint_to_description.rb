class AddNullConstraintToDescription < ActiveRecord::Migration[5.2]
  def change
    change_column :cash_entries, :description, :text, null: false
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
