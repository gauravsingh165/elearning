class CreateMcqs < ActiveRecord::Migration[7.0]
  def change
    create_table :mcqs do |t|
      t.references :course, null: false, foreign_key: true
      t.text :question
      t.string :answer

      t.timestamps
    end
  end
end
