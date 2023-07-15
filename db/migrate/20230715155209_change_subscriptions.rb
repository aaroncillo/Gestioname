class ChangeSubscriptions < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :subscription
  end
end
