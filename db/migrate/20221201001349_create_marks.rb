# frozen_string_literal: true

class CreateMarks < ActiveRecord::Migration[5.2]
  def change
    create_table :marks do |t|
      t.references :user, foreign_key: true
      t.references :subject, foreign_key: true
      t.integer :total_marks
      t.integer :obtain_marks
      t.references :result, foreign_key: true

      t.timestamps
    end
  end
end
