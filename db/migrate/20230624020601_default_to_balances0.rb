class DefaultToBalances0 < ActiveRecord::Migration[7.0]
  def change
    change_column_default :balances, :total, 0
  end
end
