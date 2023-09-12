class RenameUrlColumnToTools < ActiveRecord::Migration[7.0]
  def change
    rename_column :tools, :url, :name
  end
end
