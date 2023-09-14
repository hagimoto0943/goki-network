class AddReferenceToTools < ActiveRecord::Migration[7.0]
  def change
    add_reference :tools, :place, foreign_key: true
    add_reference :tools, :extermination_type, foreign_key: true
  end
end
