class CreateFeatures < ActiveRecord::Migration[5.1]
  def change
    create_table :features do |t|
      t.string :title
      t.text :body
      t.integer :upvotes, null: false, default: 0
      t.integer :downvotes, null: false,  default: 0
      # t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
