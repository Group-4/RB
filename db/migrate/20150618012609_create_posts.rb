class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :image_url
      t.integer :user_id
      t.string :answer
      t.string :hint
      t.boolean :solved

      t.timestamps null: false
    end
  end
end
