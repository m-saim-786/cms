# frozen_string_literal: true

class CreateCashEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :cash_entries do |t|
      t.integer :amount, null: false
      t.text :description
      t.references :user, foreign_key: true
      t.integer :type, null: false

      t.timestamps
    end
  end
end
