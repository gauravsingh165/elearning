class CreateTextbooks < ActiveRecord::Migration[7.0]
  def change
    create_table :textbooks do |t|
      t.references :course, null: false, foreign_key: true
      t.string :title
      t.boolean :read

      t.timestamps
    end
  end
end
