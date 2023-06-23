class RemoveReferenceToExpenseType < ActiveRecord::Migration[7.0]
  def change
    remove_column :expense_types, :expense_id, :bigint
  end
end
