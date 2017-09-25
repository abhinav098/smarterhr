class CreateIssuances < ActiveRecord::Migration[5.0]
  def change
    create_table :issuances do |t|
      t.references :user, foreign_key: true
      t.references :issuable, polymorphic: true
      t.integer :state, default:0
      t.references :issuer

      t.timestamps
    end
  end
end
