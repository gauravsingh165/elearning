class AddColumnToCourses < ActiveRecord::Migration[7.0]
  def change
    add_reference :courses, :product_line, null: false, foreign_key: true
    add_reference :courses, :product_version, null: false, foreign_key: true
  end
end
