class Company < ApplicationRecord
  belongs_to :user

  # has manys

  has_many :incomes
  has_many :expenses

  # validaciones

  validates :name_company, :description, presence: true

  has_one_attached :logo
end
