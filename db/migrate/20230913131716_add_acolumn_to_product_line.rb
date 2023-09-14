class AddAcolumnToProductLine < ActiveRecord::Migration[7.0]
  def change
    add_column :product_lines, :is_active, :boolean
  end
end
