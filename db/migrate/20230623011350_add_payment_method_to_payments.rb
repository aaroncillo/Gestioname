class AddPaymentMethodToPayments < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :payment_method, :string
    remove_column :payments, :type_payment, :bigint
  end
end
