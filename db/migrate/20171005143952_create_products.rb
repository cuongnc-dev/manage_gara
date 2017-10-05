class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :product_code
      t.string :name
      t.integer :quantity
      t.integer :unit_price
      t.string :image

      t.timestamps
    end
  end
end
