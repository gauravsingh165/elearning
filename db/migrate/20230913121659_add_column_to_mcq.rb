class AddColumnToMcq < ActiveRecord::Migration[7.0]
  def change
    add_column :mcqs, :given_answer, :string
  end
end
