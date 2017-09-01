class CreateAttendances < ActiveRecord::Migration[5.0]
  def change
    create_table :attendances do |t|
      t.datetime :clockin
      t.datetime :clockout
      t.integer :work
      t.references :user, foreign_key: true
    end
  end
end
