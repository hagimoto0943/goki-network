class AddReferencesToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :insect_type, foreign_key: true
  end
end
