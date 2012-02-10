class CreateProductLinks < ActiveRecord::Migration
  def change
    create_table :product_links do |t|
      t.references :user
      t.string :name
      t.string :link

      t.timestamps
    end
    add_index :product_links, :user_id
  end
end
