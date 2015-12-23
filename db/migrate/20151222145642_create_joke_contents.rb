class CreateJokeContents < ActiveRecord::Migration
  def change
    create_table :joke_contents do |t|
      t.string :title
      t.text :content
      t.integer :like_count
      t.integer :dislike_count

      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
