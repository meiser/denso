class CreateBundlestickers < ActiveRecord::Migration
  def change
    create_table :bundlestickers do |t|
      t.text :unique_number
      t.integer :language_id
      t.boolean :neutral
      t.boolean :ce
      t.timestamps
    end
  end
end

