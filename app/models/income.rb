# == Schema Information
#
# Table name: incomes
#
#  id          :bigint           not null, primary key
#  item_name   :string
#  date        :date
#  description :text
#  amount      :float            default(0.0)
#  company_id  :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Income < ApplicationRecord
  belongs_to :company

  # validaciones

  validates :item_name, :date, :description, :amount, presence: true

end
