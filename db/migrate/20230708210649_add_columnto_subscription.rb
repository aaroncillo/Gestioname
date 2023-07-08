class AddColumntoSubscription < ActiveRecord::Migration[7.0]
  def change
    add_column :subscriptions, :subscription_type, :string, default: "trial"
  end
end
