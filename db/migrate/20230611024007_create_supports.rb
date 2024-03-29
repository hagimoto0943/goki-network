class CreateSupports < ActiveRecord::Migration[7.0]
  def change
    create_table :supports do |t|
      t.references :user, null: false, foreign_key: true
      t.references :fight, null: false, foreign_key: true

      t.timestamps
    end
    add_index :supports, [:user_id, :fight_id], unique: :true
  end
end
