# frozen_string_literal: true

class CreateResultTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :result_types do |t|
      t.string :title
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
