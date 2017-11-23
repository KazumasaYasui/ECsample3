class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :sub_total
      t.integer :tax
      t.integer :grand_total
      t.string :cust_name
      t.string :cust_tel
      t.string :cust_email
      t.string :cust_postal_code
      t.integer :cust_prefecture
      t.string :cust_city
      t.string :cust_street

      t.timestamps
    end
  end
end
