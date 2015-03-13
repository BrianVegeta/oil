class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      
      t.string :zh_TW_title,      null: false
      t.string :zh_TW_content,    null: false
      t.text :zh_TW_description

      t.string :zh_CN_title,      null: false
      t.string :zh_CN_content,    null: false
      t.text :zh_CN_description

      t.string :en_title,      null: false
      t.string :en_content,    null: false
      t.text :en_description

      t.text :applicable_types


      t.timestamps
    end
  end
end
