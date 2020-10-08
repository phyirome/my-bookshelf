class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.text :content, null: false
      t.integer :rating, null: false
      t.timestamps
    end
  end
end
