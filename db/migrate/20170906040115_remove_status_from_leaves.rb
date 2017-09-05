class RemoveStatusFromLeaves < ActiveRecord::Migration[5.0]
  def change
    remove_column :leaves, :status, :string
  end
end
