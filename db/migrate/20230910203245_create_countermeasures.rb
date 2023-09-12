class CreateCountermeasures < ActiveRecord::Migration[7.0]
  def change
    create_table :countermeasures do |t|
      t.string :title
      t.text :body
      t.integer :type
      t.string :image


      t.timestamps
    end
  end
end
