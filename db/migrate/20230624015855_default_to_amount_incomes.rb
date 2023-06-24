class DefaultToAmountIncomes < ActiveRecord::Migration[7.0]
  def change
    change_column_default :incomes, :amount, 0
  end
end
