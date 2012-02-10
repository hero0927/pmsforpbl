class CreateEvms < ActiveRecord::Migration
  def change
    create_table :evms do |t|
      t.integer :revision
      t.date :measured_date
      t.float :pv
      t.integer :bac
      t.integer :sac
      t.float :ev
      t.float :ac
      t.references :user

      t.timestamps
    end
    add_index :evms, :user_id
  end
end
