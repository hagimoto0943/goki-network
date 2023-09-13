class CreateCountermeasures < ActiveRecord::Migration[7.0]
  def change
    create_table :countermeasures do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.string :image

      t.references :insect_type, null: false, foreign_key: true
      t.timestamps
    end
  end
end
