# frozen_string_literal: true

class ResultType < ApplicationRecord
  belongs_to :user
  has_many :results
end
