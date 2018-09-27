class CreateBlogPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_posts do |t|
      t.string :title, :limit => 50, :null => false
      t.string :summary, limit: 150, null: false
      t.text :content
      # t.references :user, foreign_key: true
      t.string :title_image_url

      t.timestamps
    end

    add_column :blog_posts, :user_id, :integer, null: false
    add_foreign_key :blog_posts, :users, column: :user_id

    # add_index :blog_posts, :title, unique: true
  end
end
