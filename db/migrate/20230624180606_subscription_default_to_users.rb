class SubscriptionDefaultToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :subscription, false
  end
end
