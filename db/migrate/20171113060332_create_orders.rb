class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :sub_total
      t.integer :tax
      t.integer :grand_total

      t.timestamps
    end
  end
end
