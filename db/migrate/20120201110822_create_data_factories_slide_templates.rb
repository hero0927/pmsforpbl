class CreateDataFactoriesSlideTemplates < ActiveRecord::Migration
  def change
    create_table :data_factories_slide_templates, :id => false do |t|
      t.references :data_factory
      t.references :slide_template

    end
    add_index :data_factories_slide_templates, :data_factory_id
    add_index :data_factories_slide_templates, :slide_template_id
  end
end
