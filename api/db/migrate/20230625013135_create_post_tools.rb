class CreatePostTools < ActiveRecord::Migration[7.0]
  def change
    create_table :post_tools do |t|
      t.references :post, null: false, foreign_key: true
      t.references :tool, null: false, foreign_key: true

      t.timestamps
    end
  end
end
