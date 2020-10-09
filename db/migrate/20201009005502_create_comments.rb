class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.boolean :like
      t.text :content, null: false
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.references :review, foreign_key: true
      t.timestamps
    end
  end
end
