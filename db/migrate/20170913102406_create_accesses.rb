class CreateAccesses < ActiveRecord::Migration[5.0]
  def change
    create_table :accesses do |t|
      t.references :user, foreign_key: true
      t.integer :issuer_id
      t.integer :kind
      t.integer :state, default:0
      t.timestamps
    end
  end
end
