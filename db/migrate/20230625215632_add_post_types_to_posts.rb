class AddPostTypesToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :post_types, :integer, null: false, default: 0
  end
end
