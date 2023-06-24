# == Schema Information
#
# Table name: expense_types
#
#  id               :bigint           not null, primary key
#  expense_category :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class ExpenseType < ApplicationRecord
  has_many :expenses
  validates :expense_category, presence: true
  validates :expense_category, uniqueness: true
  validates :expense_category, length: { maximum: 20 }
end
