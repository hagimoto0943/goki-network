class CreateInsectTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :insect_types do |t|
      t.string :type

      t.timestamps
    end
  end
end
