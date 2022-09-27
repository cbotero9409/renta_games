class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.date :date
      t.integer :days
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.references :supplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
