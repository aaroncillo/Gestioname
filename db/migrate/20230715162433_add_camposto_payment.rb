class AddCampostoPayment < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :credit_card_number, :integer
    add_column :payments, :name, :string
    add_column :payments, :security_code, :integer
    add_column :payments, :expiration_date, :string
  end
end
