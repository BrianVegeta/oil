class AddGateToProduct < ActiveRecord::Migration
  def change
    add_column :products, :cate_id, :integer, default: 6
  end
end
