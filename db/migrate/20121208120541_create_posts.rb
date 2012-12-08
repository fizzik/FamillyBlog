class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :idea
      t.string :image_path

      t.timestamps
    end
  end
end
