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
class Subscription < ApplicationRecord
  belongs_to :user

  TYPES = %w(trial basic premium)

validates :subscription_type, inclusion: { in: TYPES }
end
