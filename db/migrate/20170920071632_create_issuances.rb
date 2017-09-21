class CreateIssuances < ActiveRecord::Migration[5.0]
  def change
    create_table :issuances do |t|
      t.references :issuer
      t.references :issuable, polymorphic: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
