class Income < ApplicationRecord
  belongs_to :company

  # validaciones

  validates :item_name, :date, :description, :amount, presence: true

end
