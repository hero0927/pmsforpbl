class CreateRiskScores < ActiveRecord::Migration
  def change
    create_table :risk_scores do |t|
      t.date :measured_date
      t.float :generation_rate
      t.float :influence_rate
      t.references :risk_item

      t.timestamps
    end
    add_index :risk_scores, :risk_item_id
  end
end
