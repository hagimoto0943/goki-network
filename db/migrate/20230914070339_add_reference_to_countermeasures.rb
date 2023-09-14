class AddReferenceToCountermeasures < ActiveRecord::Migration[7.0]
  def change
    add_reference :countermeasures, :place, foreign_key: true
    add_reference :countermeasures, :extermination_type, foreign_key: true
  end
end
