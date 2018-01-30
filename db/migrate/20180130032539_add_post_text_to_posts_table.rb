class AddPostTextToPostsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :post_text, :text
  end
end
