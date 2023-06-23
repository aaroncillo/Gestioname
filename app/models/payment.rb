class Payment < ApplicationRecord
  belongs_to :subscription

  # validaciones

  validates :payment_method, presence: true
end
