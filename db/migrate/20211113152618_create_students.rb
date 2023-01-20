# frozen_string_literal: true

class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :roll_no
      t.string :Bform
      t.string :contact
      t.date :age
      t.string :father_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
