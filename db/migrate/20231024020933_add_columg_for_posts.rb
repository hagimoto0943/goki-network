class AddColumgForPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :insect_types, :integer, default: 0
    add_column :posts, :places, :integer, default: 0
  end
end
