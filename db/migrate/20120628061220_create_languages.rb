class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :code
      t.text :description
      t.integer :lang

      t.timestamps
    end
  end
end
