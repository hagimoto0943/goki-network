class CreateExterminationTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :extermination_types do |t|
      t.integer :kind, null: false, default: 0

      t.timestamps
    end
  end
end
