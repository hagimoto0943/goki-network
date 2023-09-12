class RemoveReferencesToTypes < ActiveRecord::Migration[7.0]
  def change
    remove_reference :countermeasures, :insect_type, null: false, foreign_key: true
    remove_reference :tools, :insect_type, null: false, foreign_key: true
  end
end
