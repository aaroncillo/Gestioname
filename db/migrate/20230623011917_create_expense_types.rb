class CreateExpenseTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :expense_types do |t|
      t.string :expense_types

      t.timestamps
    end
  end
end
