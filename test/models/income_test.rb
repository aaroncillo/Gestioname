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
require "test_helper"

class IncomeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
