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
require "test_helper"

class PaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
