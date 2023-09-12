class RemoveFromCountermeasures < ActiveRecord::Migration[7.0]
  def change
    remove_column :countermeasures, :type
  end
end
