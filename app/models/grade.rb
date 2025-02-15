# frozen_string_literal: true

class Grade < ApplicationRecord
  belongs_to :user
  has_many :students
  has_many :subjects, dependent: :destroy
  has_many :results

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "created_at", "updated_at", "user_id"]
  end
end
