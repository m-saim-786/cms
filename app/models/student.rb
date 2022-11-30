class Student < ApplicationRecord
  belongs_to :user
  belongs_to :grade
  has_many :fee_details, dependent: :destroy
end
