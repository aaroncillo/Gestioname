class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :type_payment
      t.references :subscription, null: false, foreign_key: true

      t.timestamps
    end
  end
end
