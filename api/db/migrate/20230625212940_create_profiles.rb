class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.references :tool, foreign_key: true
      t.string :avatar
      t.integer :house_age
      t.integer :house_floor
      t.integer :house_structure

      t.timestamps
    end
  end
end
