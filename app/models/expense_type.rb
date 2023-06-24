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
end
