class AddReferencesToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :insect_types, :post, null: false, foreign_key: true
  end
end
