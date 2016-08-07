class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :purchaser
      t.string :phone
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end

