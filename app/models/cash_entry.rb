class CashEntry < ApplicationRecord
  belongs_to :user

  enum entry_type: { 'cash_in': 0, 'cash_out': 1 }
  
  def self.total_cash_in
    CashEntry.cash_in.pluck(:amount).sum
  end
  
  def self.total_cash_out
    CashEntry.cash_out.pluck(:amount).sum
  end
  
  def self.total_balance
    CashEntry.total_cash_in - CashEntry.total_cash_out
  end
  
end
