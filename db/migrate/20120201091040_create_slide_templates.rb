class CreateSlideTemplates < ActiveRecord::Migration
  def change
    create_table :slide_templates do |t|
      t.string :name
      t.references :presentation_template
      t.integer :figure_number
      t.integer :page

      t.timestamps
    end
    add_index :slide_templates, :presentation_template_id
  end
end
