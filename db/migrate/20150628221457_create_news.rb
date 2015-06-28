class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string  :title,   null: false, default: ''
      t.text    :content, null: false

      t.timestamps
    end
  end
end
