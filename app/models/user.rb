# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :students, dependent: :destroy
  has_many :cash_entries, dependent: :destroy
  has_many :fee_details, dependent: :destroy
  has_many :grades, dependent: :destroy
  has_many :subjects, dependent: :destroy
  has_many :results
  has_many :marks
  has_many :result_types
end
