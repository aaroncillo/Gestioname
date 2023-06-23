class DropTableBillPayments < ActiveRecord::Migration[7.0]
  def change
    drop_table :bill_payments
  end
end
