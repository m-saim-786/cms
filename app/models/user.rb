class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :students, dependent: :destroy
  has_many :cash_entries, dependent: :destroy
  has_many :fee_details, dependent: :destroy
  has_many :grades, dependent: :destroy
end
