class AddKindToLeaves < ActiveRecord::Migration[5.0]
  def change
    add_column :leaves, :kind, :integer , default: 0
  end
end
