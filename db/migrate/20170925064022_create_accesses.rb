class CreateAccesses < ActiveRecord::Migration[5.0]
  def change
    create_table :accesses do |t|
      t.string :name
      t.string :description
      t.string :url
      t.integer :kind

      t.timestamps
    end
  end
end
