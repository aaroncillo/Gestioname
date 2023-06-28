class AddCompanyIdToExpenseTypes < ActiveRecord::Migration[7.0]
  def change
    add_column :expense_types, :company_id, :bigint
    add_index :expense_types, :company_id
  end
end
