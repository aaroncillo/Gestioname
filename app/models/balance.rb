# == Schema Information
#
# Table name: balances
#
#  id         :bigint           not null, primary key
#  total      :integer          default(0)
#  company_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Balance < ApplicationRecord
  belongs_to :company
end
