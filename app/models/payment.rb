# == Schema Information
#
# Table name: payments
#
#  id              :bigint           not null, primary key
#  subscription_id :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  payment_method  :string
#
class Payment < ApplicationRecord
  belongs_to :subscription

  # validaciones

  validates :payment_method, presence: true
end
