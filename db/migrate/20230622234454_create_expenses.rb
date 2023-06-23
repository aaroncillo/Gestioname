class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :item_name
      t.date :date
      t.text :description
      t.float :amount
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
