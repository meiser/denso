class CreateCommissions < ActiveRecord::Migration
  def change
    create_table :commissions do |t|
      t.integer :bundle_type
      t.decimal :length
      t.decimal :width
      t.decimal :height
      t.decimal :weight
      t.timestamps
    end
  end
end

