# frozen_string_literal: true

class Student < ApplicationRecord
  belongs_to :user
  belongs_to :grade
  has_many :fee_details, dependent: :destroy
  has_many :subjects, through: :grade
  has_many :results

  # List the associations you want to be searchable
  def self.ransackable_associations(auth_object = nil)
    ["fee_details", "grade", "results", "subjects", "user"]
  end

  # Allow specific attributes to be searchable
  def self.ransackable_attributes(auth_object = nil)
    [
      "id",
      "name",
      "roll_no",
      "Bform",
      "contact",
      "age",
      "father_name",
      "fee_amount",
      "grade_id",
      "user_id",
      "created_at",
      "updated_at"
    ]
  end
end
