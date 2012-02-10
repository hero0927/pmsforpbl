class CreateRiskItems < ActiveRecord::Migration
  def change
    create_table :risk_items do |t|
      t.integer :risk_number
      t.string :event
      t.string :effect
      t.string :preventive_measure
      t.string :counter_measure
      t.references :risk

      t.timestamps
    end
    add_index :risk_items, :risk_id
  end
end
