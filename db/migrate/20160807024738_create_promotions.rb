class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.integer :amount
      t.string :discount
      t.integer :product_id

      t.timestamps
    end
  end
end
