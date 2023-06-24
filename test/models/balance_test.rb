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
require "test_helper"

class BalanceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
