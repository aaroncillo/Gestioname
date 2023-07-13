# == Schema Information
#
# Table name: expenses
#
#  id              :bigint           not null, primary key
#  item_name       :string
#  date            :date
#  description     :text
#  amount          :float            default(0.0)
#  company_id      :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  expense_type_id :bigint           not null
#
class Expense < ApplicationRecord

  TYPES = ExpenseType.all

  belongs_to :company
  belongs_to :expense_type

  validates :item_name, :date, :description, :amount, :expense_type, presence: true
  validates :expense_type, inclusion: { in: TYPES }
end
