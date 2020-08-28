class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.references :review_giver, null: false, foreign_key: { to_table: :users }
      t.references :user_skill, null: false, foreign_key: true
      t.references :review_receiver, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
