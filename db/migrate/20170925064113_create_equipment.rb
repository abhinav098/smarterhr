class CreateEquipment < ActiveRecord::Migration[5.0]
  def change
    create_table :equipment do |t|
      t.string :name
      t.string :description
      t.integer :kind

      t.timestamps
    end
  end
end
