class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.date :init_date
      t.date :end_date
      t.float :price_sub
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
