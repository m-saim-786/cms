# frozen_string_literal: true

class Student < ApplicationRecord
  belongs_to :user
  belongs_to :grade
  has_many :fee_details, dependent: :destroy
  has_many :subjects, through: :grade
  has_many :results
end
