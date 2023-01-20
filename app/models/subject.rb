# frozen_string_literal: true

class Subject < ApplicationRecord
  belongs_to :grade
  belongs_to :user
end
