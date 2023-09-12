class CreateProductVersions < ActiveRecord::Migration[7.0]
  def change
    create_table :product_versions do |t|
      t.string :name
      t.text :features

      t.timestamps
    end
  end
end
