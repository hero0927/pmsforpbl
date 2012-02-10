class CreateRisks < ActiveRecord::Migration
  def change
    create_table :risks do |t|
      t.float :torelance
      t.references :user

      t.timestamps
    end
    add_index :risks, :user_id
  end
end
