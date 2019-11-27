class AddUniqueIndexToViews < ActiveRecord::Migration[6.0]
  def change
    add_index :views, [:user_id, :problem_id], unique: true
  end
end
