class RemoveToolFromCountermeasures < ActiveRecord::Migration[7.0]
  def change
    remove_reference :countermeasures, :tool, null: false, foreign_key: true
  end
end
