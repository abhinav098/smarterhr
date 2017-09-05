class CreateLeaves < ActiveRecord::Migration[5.0]
  def change
    create_table :leaves do |t|
      t.references :user, foreign_key: true
      t.text :message
      t.string :status
      t.datetime :from_date
      t.datetime :to_date

      t.timestamps
    end
  end
end
