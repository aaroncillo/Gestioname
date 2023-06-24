# == Schema Information
#
# Table name: subscriptions
#
#  id         :bigint           not null, primary key
#  init_date  :date
#  end_date   :date
#  price_sub  :float            default(0.0)
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class SubscriptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
