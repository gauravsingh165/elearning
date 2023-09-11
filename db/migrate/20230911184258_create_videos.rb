class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.references :course, null: false, foreign_key: true
      t.string :title
      t.boolean :watched

      t.timestamps
    end
  end
end
