# frozen_string_literal: true

module CashEntriesHelper
  def balance_text_color(amount)
    amount >= 0 ? 'text-success' : 'text-danger'
  end
end
