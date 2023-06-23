class ChangeColumnNameToExpenseType < ActiveRecord::Migration[7.0]
  def change
    rename_column(:expense_types, :expense_types, :expense_category)
  end
end
