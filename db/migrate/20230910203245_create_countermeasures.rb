class CreateCountermeasures < ActiveRecord::Migration[7.0]
  def change
    create_table :countermeasures do |t|
      t.string :title
      t.string :body
      t.string :image


      t.timestamps
    end
  end
end
