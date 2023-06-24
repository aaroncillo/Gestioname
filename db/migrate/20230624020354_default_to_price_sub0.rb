class DefaultToPriceSub0 < ActiveRecord::Migration[7.0]
  def change
    change_column_default :subscriptions, :price_sub, 0
  end
end
