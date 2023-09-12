class CreateInsectTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :insect_types do |t|
      t.integer :types, null: false
      t.references :post, null: false, foreign_key: true
      t.references :countermeasure, null: false, foreign_key: true
      t.references :tool, null: false, foreign_key: true
      t.timestamps
    end
  end
end
