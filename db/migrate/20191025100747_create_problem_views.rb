class CreateProblemViews < ActiveRecord::Migration[6.0]
  def change
    create_table :views do |t|
      t.references :problem, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
