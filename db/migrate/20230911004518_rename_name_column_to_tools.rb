class RenameNameColumnToTools < ActiveRecord::Migration[7.0]
  def change
    rename_column :tools, :name, :url
  end
end
