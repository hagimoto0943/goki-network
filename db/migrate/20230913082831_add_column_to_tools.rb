class AddColumnToTools < ActiveRecord::Migration[7.0]
  def change
    add_column :tools, :url, :string, null: false
    add_column :tools, :image, :string
    add_reference :tools, :insect_type, null: false, foreign_key: true
  end
end
