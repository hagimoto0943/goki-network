class CreateFights < ActiveRecord::Migration[7.0]
  def change
    create_table :fights do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :status, null: false, default: 1

      t.timestamps
    end
  end
end
