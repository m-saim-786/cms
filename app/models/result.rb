# frozen_string_literal: true

class Result < ApplicationRecord
  belongs_to :user
  belongs_to :student
  belongs_to :grade
  belongs_to :result_type

  has_many :marks

  # Explicitly allow associations for Ransack
  def self.ransackable_associations(auth_object = nil)
    ["user", "student", "grade", "result_type", "marks"]
  end

  # Allow specific attributes to be searchable
  def self.ransackable_attributes(auth_object = nil)
    ["id", "month", "created_at", "updated_at"]
  end
end
