# frozen_string_literal: true

class ResultType < ApplicationRecord
  belongs_to :user
  has_many :results

  # Allow specific attributes to be searchable
  def self.ransackable_attributes(auth_object = nil)
    ["id", "title", "created_at", "updated_at", "user_id"]
  end
end
