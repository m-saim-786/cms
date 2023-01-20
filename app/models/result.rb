# frozen_string_literal: true

class Result < ApplicationRecord
  belongs_to :user
  belongs_to :student
  belongs_to :grade
  belongs_to :result_type

  has_many :marks
end
