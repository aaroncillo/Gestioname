class ChangeAtrrinPayments < ActiveRecord::Migration[7.0]
  def change
    rename_column :payments, :payment_method, :subscription_type
  end
end
