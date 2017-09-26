class AddFieldsToAccesses < ActiveRecord::Migration[5.0]
  def change
    add_column :accesses, :state, :integer, default: 0
    add_column :accesses, :kind, :integer, default: 0
  end
end
