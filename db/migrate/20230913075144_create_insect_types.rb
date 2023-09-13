class CreateInsectTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :insect_types do |t|
      t.integer :type, null: false, default: 0

      t.timestamps
    end
  end
end
