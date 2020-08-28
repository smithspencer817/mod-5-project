class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :text
      t.references :questioner, null: false, foreign_key: { to_table: :users }
      t.references :answerer, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
