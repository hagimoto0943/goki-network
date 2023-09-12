class AddReferencesToTools < ActiveRecord::Migration[7.0]
  def change
    add_reference :insect_types, :countermeasure, null: false, foreign_key: true
    add_reference :insect_types, :tool, null: false, foreign_key: true
  end
end
