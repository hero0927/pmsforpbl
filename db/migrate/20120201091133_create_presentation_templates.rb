class CreatePresentationTemplates < ActiveRecord::Migration
  def change
    create_table :presentation_templates do |t|
      t.string :name

      t.timestamps
    end
  end
end
