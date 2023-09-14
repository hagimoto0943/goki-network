class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.integer :spot, null: false, default: 0

      t.timestamps
    end
  end
end
