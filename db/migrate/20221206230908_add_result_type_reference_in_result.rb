# frozen_string_literal: true

class AddResultTypeReferenceInResult < ActiveRecord::Migration[5.2]
  def change
    remove_column :results, :result_type, :integer
    add_reference :results, :result_type, foreign_key: true
  end
end
