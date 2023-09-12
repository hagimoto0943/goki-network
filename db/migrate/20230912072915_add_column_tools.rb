class AddColumnTools < ActiveRecord::Migration[7.0]
  def change
    add_column :tools, :image, :string
    add_column :tools, :url, :string
  end
end
