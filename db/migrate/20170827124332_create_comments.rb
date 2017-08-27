class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :feature, foreign_key: true
      t.integer :upvotes, null: false, default: 0
      t.integer :downvotes, null: false, default: 0
      t.references :comment, foreign_key: true

      t.timestamps
    end
  end
end
