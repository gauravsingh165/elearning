class ChangeProductLineIdToNullableInCourses < ActiveRecord::Migration[6.0]
  def change
    reversible do |dir|
      change_table :courses do |t|
        dir.up { t.change :product_line_id, :integer, null: true }
        dir.down { t.change :product_line_id, :integer, null: false }
      end
    end
  end

end
