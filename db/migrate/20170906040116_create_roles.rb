class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.integer :manager_id
      t.integer :employee_id

      t.timestamps
    end
    add_index :roles, :manager_id
    add_index :roles, :employee_id
    add_index :roles, [:manager_id, :employee_id], unique: true
  end
end
