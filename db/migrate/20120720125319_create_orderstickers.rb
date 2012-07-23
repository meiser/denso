class CreateOrderstickers < ActiveRecord::Migration
  def change
    create_table :orderstickers do |t|

      t.timestamps
    end
  end
end
