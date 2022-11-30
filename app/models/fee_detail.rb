class FeeDetail < ApplicationRecord
  belongs_to :user
  belongs_to :student
  enum status: %i[paid partial]

  scope :paid_list, -> (start_date, end_date){ where(submitted_at: Date.new(Date.today.year, Date.today.month)..Date.today).pluck(:student_id) }
end
