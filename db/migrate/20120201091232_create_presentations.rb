class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.date :create_date
      t.string :project_type
      t.string :title

      t.timestamps
    end
  end
end
