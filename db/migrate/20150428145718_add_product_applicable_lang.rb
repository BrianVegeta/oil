class AddProductApplicableLang < ActiveRecord::Migration
  def change
    rename_column :products, :applicable_types, :zh_TW_applicables
    add_column :products, :zh_CN_applicables, :text
    add_column :products, :en_applicables, :text
  end
end
