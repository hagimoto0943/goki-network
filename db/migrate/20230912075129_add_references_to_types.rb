class AddReferencesToTypes < ActiveRecord::Migration[7.0]
  def change
    add_reference :countermeasures, :insect_type, null: false, foreign_key: true
    add_reference :tools, :insect_type, null: false, foreign_key: true
  end
end
