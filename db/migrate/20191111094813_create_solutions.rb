class CreateSolutions < ActiveRecord::Migration[6.0]
  def change
    create_table :solutions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :problem, null: false, foreign_key: true
      t.text :code

      t.timestamps
    end
  end
end
