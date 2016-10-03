class CreateStockPrices < ActiveRecord::Migration[5.0]
  def change
    create_table :stock_prices do |t|
      t.references :stock
      t.decimal :price
      t.timestamps
    end
  end
end
