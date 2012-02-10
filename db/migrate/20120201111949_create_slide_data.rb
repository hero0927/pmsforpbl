class CreateSlideData < ActiveRecord::Migration
  def change
    create_table :slide_data do |t|
      t.text :data
      t.text :measured_date
      t.string :type
      t.references :slide

      t.timestamps
    end
    add_index :slide_data, :slide_id
  end
end
