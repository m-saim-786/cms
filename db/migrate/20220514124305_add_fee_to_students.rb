# frozen_string_literal: true

class AddFeeToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :fee_amount, :integer, null: false
  end
end
