# frozen_string_literal: true

class Grade < ApplicationRecord
  belongs_to :user
  has_many :students
  has_many :subjects, dependent: :destroy
  has_many :results
end
