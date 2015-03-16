class AddColumnsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :top_rate,  :integer
    add_column :products, :state,     :string
  end
end
