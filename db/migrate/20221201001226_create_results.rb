# frozen_string_literal: true

class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.integer :result_type
      t.date :month
      t.references :user, foreign_key: true
      t.references :student, foreign_key: true
      t.references :grade, foreign_key: true

      t.timestamps
    end
  end
end
