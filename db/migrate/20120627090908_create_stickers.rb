class CreateStickers < ActiveRecord::Migration
  def change
    create_table :stickers do |t|

      t.timestamps
    end
  end
end
