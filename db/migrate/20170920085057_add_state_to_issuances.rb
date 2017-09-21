class AddStateToIssuances < ActiveRecord::Migration[5.0]
  def change
    add_column :issuances, :state, :integer, default:0
  end
end
