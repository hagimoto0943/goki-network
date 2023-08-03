class CreateSupports < ActiveRecord::Migration[7.0]
  def change
    create_table :supports do |t|
      t.references :user, null: false, foreign_key: true
      t.references :fight, null: false, foreign_key: true

      t.timestamps
    end
  end
end
