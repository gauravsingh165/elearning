class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :product_version
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
