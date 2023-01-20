# frozen_string_literal: true

class FeeDetail < ApplicationRecord
  belongs_to :user
  belongs_to :student
  enum status: %i[paid partial]

  scope :paid_list, lambda { |_start_date, _end_date|
                      where(submitted_at: Date.new(Date.today.year, Date.today.month)..Date.today).pluck(:student_id)
                    }
end
