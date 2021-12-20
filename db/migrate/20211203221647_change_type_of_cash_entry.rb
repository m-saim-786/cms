class ChangeTypeOfCashEntry < ActiveRecord::Migration[5.2]
  def change
    rename_column :cash_entries, :type, :entry_type
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
