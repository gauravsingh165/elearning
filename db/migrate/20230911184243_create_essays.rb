class CreateEssays < ActiveRecord::Migration[7.0]
  def change
    create_table :essays do |t|
      t.references :course, null: false, foreign_key: true
      t.text :question
      t.text :answer

      t.timestamps
    end
  end
end
