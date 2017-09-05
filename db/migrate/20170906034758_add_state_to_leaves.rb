class AddStateToLeaves < ActiveRecord::Migration[5.0]
  def change
    add_column :leaves, :state, :integer, default: 2
  end
end
