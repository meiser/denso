class CreateBundleTypes < ActiveRecord::Migration
  def change
    create_table :bundle_types do |t|
      t.integer :cnst
      t.text :description

      t.timestamps
    end
  end
end
