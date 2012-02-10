class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :comment
      t.integer :page
      t.references :user
      t.references :presentation
      t.references :slide_template

      t.timestamps
    end
    add_index :slides, :user_id
    add_index :slides, :presentation_id
    add_index :slides, :slide_template_id
  end
end
