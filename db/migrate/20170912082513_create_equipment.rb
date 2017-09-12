class CreateEquipment < ActiveRecord::Migration[5.0]
  def change
    create_table :equipment do |t|
      t.string :name
      t.integer :state, default:0
      t.integer :issuer_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
