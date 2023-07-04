# == Schema Information
#
# Table name: companies
#
#  id           :bigint           not null, primary key
#  name_company :string
#  description  :text
#  user_id      :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Company < ApplicationRecord
  belongs_to :user

  # has manys

  has_many :incomes, dependent: :destroy
  has_many :expenses, dependent: :destroy
  has_many :expense_types, dependent: :destroy

  # validaciones

  validates :name_company, :description, presence: true

  has_one_attached :logo
end
