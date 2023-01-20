# frozen_string_literal: true

class CreateFeeDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :fee_details do |t|
      t.references :user, foreign_key: true
      t.references :student, foreign_key: true
      t.date :submitted_at
      t.integer :status
      t.integer :amount

      t.timestamps
    end
  end
end
