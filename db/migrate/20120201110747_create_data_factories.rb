class CreateDataFactories < ActiveRecord::Migration
  def change
    create_table :data_factories do |t|
      t.string :type

      t.timestamps
    end
  end
end
