# == Schema Information
#
# Table name: expense_types
#
#  id               :bigint           not null, primary key
#  expense_category :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require "test_helper"

class ExpenseTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
